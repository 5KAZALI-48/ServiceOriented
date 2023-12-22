using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Xml;

namespace CryptLibrary
{
    public class CryptoLib
    {
        private static byte[] key = Encoding.UTF8.GetBytes("7sdfasdfasdfasdfasdfasdfasdfasd7");
        private static byte[] iv = Encoding.UTF8.GetBytes("1quinnzxcasdqwe1");

        public CryptoLib(){ }

        public static String encryption(string plainText)
        {
            String ciphertext = "";

            if (plainText == null || plainText.Length <= 0) 
            { 
                throw new ArgumentException("plaintext"); 
            }
            if (key == null || key.Length <= 0) 
            { 
                throw new ArgumentException("key"); 
            }
            if (iv == null || iv.Length <= 0) 
            { 
                throw new ArgumentException("iv"); 
            }
            


           
            byte[] encrypted;
            


           
            using (Rijndael rij = Rijndael.Create())
            {
                rij.Key = key;
                rij.IV = iv;

                ICryptoTransform encryptor = rij.CreateEncryptor(rij.Key, rij.IV);

                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter westream = new StreamWriter(csEncrypt))
                        {
                            westream.Write(plainText);
                        }
                        encrypted = msEncrypt.ToArray();
                    }
                }
            }

            ciphertext = Encoding.Default.GetString(encrypted);

            return ciphertext;
        }


        public static String decryption(string ciphertext)
        {
           
            string plaintext = null;
            byte[] ctByteArray = System.Text.Encoding.Default.GetBytes(ciphertext);

          


            
            if (ciphertext == null || ciphertext.Length <= 0) { throw new ArgumentException("ciphertext"); }
            if (key == null || key.Length <= 0) { throw new ArgumentException("key"); }
            if (iv == null || iv.Length <= 0) { throw new ArgumentException("iv"); }
           
            using (Rijndael rij = Rijndael.Create())
            {
                rij.Key = key;
                rij.IV = iv;

                ICryptoTransform decryptor = rij.CreateDecryptor(rij.Key, rij.IV);

                using (MemoryStream msdecrypt = new MemoryStream(ctByteArray))
                {
                    using (CryptoStream csdecrypt = new CryptoStream(msdecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader dereader = new StreamReader(csdecrypt))
                        {
                            plaintext = dereader.ReadToEnd();
                        }
                    }
                }
            }

            return plaintext;
           

        }
    }

    public class XMLProccess
    {
        public static void addUser(string XMLPath, string userName, string encryptedPass)
        {
            FileStream fs = null;
            XmlNode node = null;
            try
            {
                if (File.Exists(XMLPath))
                {
                    fs = new FileStream(XMLPath, FileMode.Open, FileAccess.Read);
                    XmlDocument xd = new XmlDocument();
                    xd.Load(fs);
                    fs.Close();
                    node = xd["users"];

                    if (node != null)
                    {
                        XmlNode newUserNode = xd.CreateNode(XmlNodeType.Element, "user", null);
                        XmlNode newUserNameNode = xd.CreateNode(XmlNodeType.Element, "userName", null);
                        XmlNode newPasswordNode = xd.CreateNode(XmlNodeType.Element, "password", null);

                        newUserNameNode.InnerText = userName;
                        newPasswordNode.InnerText = encryptedPass;

                        newUserNode.AppendChild(newUserNameNode);
                        newUserNode.AppendChild(newPasswordNode);
                        node.AppendChild(newUserNode);
                    }

                    File.Delete(XMLPath);
                    fs = new FileStream(XMLPath, FileMode.Create, FileAccess.Write);
                    xd.Save(fs);
                    fs.Close();
                }
            }
            finally
            {
                fs.Close();
            }
        }

        public static XmlNode findUser(string XMLPath, string username)
        {
            FileStream fs = null;
            XmlNode node = null;
            try
            {
                if (File.Exists(XMLPath))
                {
                    fs = new FileStream(XMLPath, FileMode.Open, FileAccess.Read);
                    XmlDocument xd = new XmlDocument();
                    xd.Load(fs);
                    fs.Close();
                    node = xd["users"];
                    node = node.SelectSingleNode("descendant::user/userName[text()='" + username + "']");
                    if (node != null)
                        node = node.ParentNode;
                }
            }
            finally
            {
                fs.Close();
            }
            return node;
        }

        //return array of string. First element will be "Error" if error occur
        public static string[] getUserList(string XMLPath)
        {
            string[] ret;
            FileStream fs = null;
            string fLocation = XMLPath;
            try
            {
                if (File.Exists(fLocation))
                {
                    fs = new FileStream(fLocation, FileMode.Open, FileAccess.Read);
                    XmlDocument xd = new XmlDocument();
                    xd.Load(fs);
                    fs.Close();
                    XmlNode node = xd["users"];
                    XmlNodeList children = node.ChildNodes;
                    ret = new string[children.Count];
                    int i = 0;

                    foreach (XmlNode child in children)
                    {
                        ret[i] = child["userName"].InnerText;
                        i++;
                    }
                    return ret;
                }
            }
            finally
            {
                fs.Close();
            }
            ret = new string[1];
            ret[1] = "Error";
            return ret;
        }
    }
}

using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace NearestStore
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        public async Task<string> FindNearestStoreAsync(string zipcode, string storeName)
        {
            string finalData = "";
            string location;
            List<string> list = new List<string>();
            LatLonRootObject objLatLon = new LatLonRootObject(); // Creates object to deserialize JSON doc into
            StoreObject storeobj = new StoreObject(); // Creates object to deserialize JSON doc into
            var requestUri = string.Format("https://maps.googleapis.com/maps/api/geocode/json?address={0}&sensor=false&key=AIzaSyAPjQs812odZopVGESco8OXGTUoq8L7-tk", Uri.EscapeDataString(zipcode));

            using (var client = new HttpClient())
            {

                var response = await client.GetAsync(requestUri);
                var jsonContent = await response.Content.ReadAsStringAsync();
                objLatLon = JsonConvert.DeserializeObject<LatLonRootObject>(jsonContent);

                if (objLatLon.status == "OK")
                {
                    location = objLatLon.results[0].geometry.bounds.northeast.lat.ToString() + ","
                           + objLatLon.results[0].geometry.bounds.northeast.lng.ToString(); //location is now represented AS lat lot format yaaay!!!
                    requestUri = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="
                            + location + "&radius=30000&keyword=" + storeName + "&key=AIzaSyB9XXOg_qNnBpFD9ajKth2XSy9PwSphaqk";

                    jsonContent = await client.GetStringAsync(requestUri);

                    storeobj = JsonConvert.DeserializeObject<StoreObject>(jsonContent);
                    if (storeobj.status == "OK") // Makes sure that the store name is valid
                    {
                        list.Add(storeobj.results[0].icon); // URL for the icon 
                        list.Add(storeobj.results[0].name); // Adds the store name
                        list.Add(storeobj.results[0].rating.ToString()); // Adds the store rating
                        list.Add(storeobj.results[0].vicinity); // Adds the street address 
                    }
                    else
                    {
                        list.Add(storeName + " does not exist in the area.");
                    }
                }
                else
                    list.Add("Not a valid location"); 
            }
            
            foreach (string str in list)
            {
                finalData += str + "|"; 
            }

            finalData = finalData.TrimEnd('|');
            return finalData;

        }

        public class LatLonRootObject
        {
            public Result[] results { get; set; }
            public string status { get; set; }

            public class Result
            {
                public Geometry geometry { get; set; }
                public class Geometry
                {
                    public Bounds bounds { get; set; }
                    public class Bounds
                    {
                        public Northeast northeast { get; set; }
                        public class Northeast
                        {
                            public float lat { get; set; }
                            public float lng { get; set; }
                        }
                    }
                }
            }
        }


        public class StoreObject
        {
            public Result[] results { get; set; }
            public string status { get; set; }

            public class Result
            {
                public string icon { get; set; }
                public string name { get; set; }
                public float rating { get; set; }
                public string vicinity { get; set; }
            }
        }
    }
}

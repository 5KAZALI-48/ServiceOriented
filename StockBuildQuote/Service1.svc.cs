using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;

namespace StockBuildQuote
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        private static readonly HttpClient _httpClient = new HttpClient();
        private readonly string _apiUrl = "http://api.marketstack.com/v1/eod";
        private readonly string _apiKey = "14caf7ae72a6481eb3df2e2681b570cf";


        public async Task<float> StockQuote(string symbol)
        {
            string requestUrl = $"{_apiUrl}?access_key={_apiKey}&symbols={symbol}&date_from=2023-11-17&date_to=2023-11-27";

            try
            {
                var response = await _httpClient.GetAsync(requestUrl);
                response.EnsureSuccessStatusCode();
                var content = await response.Content.ReadAsStringAsync();

                // Deserialize and extract the stock price
                // Placeholder for JSON deserialization. Adapt as needed.
                float stockPrice = ExtractStockPriceFromJson(content);
                return stockPrice;
            }
            catch (Exception)
            {
                // Handle exceptions
                return 0; // Consider a better error handling strategy
            }
        }
        private float ExtractStockPriceFromJson(string jsonContent)
        {
            try
            {
                var jsonObject = JObject.Parse(jsonContent);
                var data = jsonObject["data"] as JArray;

                if (data != null && data.Count > 0)
                {
                    var firstEntry = data[0] as JObject;
                    if (firstEntry != null && firstEntry["close"] != null)
                    {
                        return firstEntry["close"].Value<float>();
                    }
                }
            }
            catch (Exception)
            {
                // Handle or log the exception as needed
            }

            return 0; // Return 0 or an appropriate default/error value
        }
    }


}

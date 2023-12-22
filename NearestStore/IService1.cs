using System.ServiceModel;
using System.Threading.Tasks;

namespace NearestStore
{
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        //async Task<string> FindNearestStoreAsync(string zipcode, string storeName)
        Task<string> FindNearestStoreAsync(string zipcode, string storeName);
        //Task<string> FindNearestStoreAsync(string zipcode, string storeName);
    }
}


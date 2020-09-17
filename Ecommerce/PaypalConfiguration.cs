using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ecommerce
{
    public class PaypalConfiguration
    {
        public readonly static string clientId;
        public readonly static string clientSecret;


        static PaypalConfiguration()
        {
            var config = getconfig();
            clientId = "AcDCKXMe6deFC2pjbMjpY5-jc6mZDN9AhzKCPlwjViU6gjXrBEeBDpn2OxLJHkF7neIl9zy2eP2KeGNR";
            clientSecret = "EJpFbEwNZuH3m2ZDY-o3hkvnVT84MjUHPO6xYRmTRNHjlBz6_ogX6do9uJ9xEFa48gndxS9j_Tzt7gmb";
        }

        private static Dictionary<string, string> getconfig()
        {
            return PayPal.Api.ConfigManager.Instance.GetProperties();
        }

        private static string GetAccessToken()
        {
            string accessToken = new OAuthTokenCredential(clientId, clientSecret, getconfig()).GetAccessToken();
            return accessToken;
        }
        public static APIContext GetAPIContext()
        {
            APIContext apicontext = new APIContext(GetAccessToken());
            apicontext.Config = getconfig();
            return apicontext;
        }
    }
}

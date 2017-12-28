using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MyBookshop.Startup))]
namespace MyBookshop
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

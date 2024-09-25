using OBControl.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace OBControl.ClassesOfCommands
{
    public class DBCommands
    {
        public ICommand ProductsCommand => new Command(() => 
        {
            Shell.Current.GoToAsync(nameof(ProductsPage));
        });
    }
}

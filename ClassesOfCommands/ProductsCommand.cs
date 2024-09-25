using CommunityToolkit.Maui.Views;
using OBControl.Pages;
using OBControl.Pages.Popups;
using OBControl.Pages.Sub;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace OBControl.ClassesOfCommands
{
    public class ProductsCommand
    {
        public ProductsPage PP { get; set; }
        public ICommand CatCmd
            => new Command(async () => await PP.ShowPopupAsync(new CategoryEditPopUp()));
        public ICommand ProCmd
            => new Command(async () => await Shell.Current.GoToAsync(nameof(GridProducts)));
    }
}

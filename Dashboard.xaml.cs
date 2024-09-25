using DataCore.Models;
using OBControl.ClassesOfCommands;
using OBControl.Pages;
using SiteSettings = OBControl.Pages.SiteSettings;

namespace OBControl;

public partial class Dashboard : ContentPage
{
	public Dashboard()
	{
		InitializeComponent();

		Routing.RegisterRoute(nameof(ProductsPage), typeof(ProductsPage));

		Routing.RegisterRoute(nameof(TablesPage), typeof(TablesPage));

		Routing.RegisterRoute(nameof(BranchPage), typeof(BranchPage));

		Routing.RegisterRoute(nameof(SiteSettings), typeof(SiteSettings));

        BindingContext = new DBCommands();
	}

    private void Products_Clicked(object sender, EventArgs e)
    {
        Shell.Current.GoToAsync(nameof(ProductsPage));
    }

    private void Tables_Tapped(object sender, TappedEventArgs e)
    {
        Shell.Current.GoToAsync(nameof(TablesPage));
    }

    private void Tables_Clicked(object sender, EventArgs e)
    {
        Tables_Tapped(sender, null);
    }

    private void Branch_Tapped(object sender, TappedEventArgs e)
    {
        Shell.Current.GoToAsync(nameof(BranchPage));
    }

    private void Branches_Clicked(object sender, EventArgs e)
    {
        Branch_Tapped(sender, null);
    }

    private void SiteMainSettings_Clicked(object sender, EventArgs e)
    {
        SiteMainSettings_Tapped(sender, null);
    }

    private void SiteMainSettings_Tapped(object sender, TappedEventArgs e)
    {
        Shell.Current.GoToAsync(nameof(SiteSettings));
    }
}
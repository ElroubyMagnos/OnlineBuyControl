using CommunityToolkit.Maui.Views;
using DataCore;
using DataCore.Models;
using Microsoft.EntityFrameworkCore;
using OBControl.ClassesOfCommands;
using OBControl.Pages.Popups;
using OBControl.Pages.Sub;

namespace OBControl.Pages;

public partial class ProductsPage : ContentPage
{
	public ProductsPage()
	{
		InitializeComponent();

		var pc = new ProductsCommand();
		pc.PP = this;

		BindingContext = pc;

		Routing.RegisterRoute(nameof(GridProducts), typeof(GridProducts));
	}

    private async void CatEdit_Clicked(object sender, EventArgs e)
    {
		await this.ShowPopupAsync(new CategoryEditPopUp());
    }

    private async void ProEdit_Clicked(object sender, EventArgs e)
    {
		await Shell.Current.GoToAsync(nameof(GridProducts));
    }
}
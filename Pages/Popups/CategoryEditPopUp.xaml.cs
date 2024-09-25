using CommunityToolkit.Maui.Views;
using DataCore.Models;
using DataCore;
using Microsoft.EntityFrameworkCore;

namespace OBControl.Pages.Popups;

public partial class CategoryEditPopUp : Popup
{
	public CategoryEditPopUp()
	{
        InitializeComponent();
	}

    private async void AddCat_Clicked(object sender, EventArgs e)
    {
        if (CatsEntry.Text.Length > 3)
        {
            var b = new onlinebuy();

            if ((await b.CategoriesOfProducts.FirstOrDefaultAsync(x => x.Name == CatsEntry.Text)) != null)
            {
                return;
            }

            await b.CategoriesOfProducts.AddAsync(new CategoryOfProduct()
            {
                Name = CatsEntry.Text,
                CountVisited = 0
            });

            await b.SaveChangesAsync();

            RefreshListOfCats();

            CatsEntry.Text = "";
        }

    }

    async void RefreshListOfCats()
    {
        var b = new onlinebuy();

        listofcats.EmbedSourceList(await b.CategoriesOfProducts.Select(x => x.Name).ToListAsync());
    }

    private async void DeleteCat_Clicked(object sender, EventArgs e)
    {
        var Object = listofcats.SelectedItem;

        if (Object != null)
        {
            var b = new onlinebuy();

            var Selected = await b.CategoriesOfProducts.FirstOrDefaultAsync(x => x.Name == Object.Text);

            if (Selected == null)
            {
                RefreshListOfCats();
                return;
            }

            b.CategoriesOfProducts.Remove(Selected);
            await b.SaveChangesAsync();

            RefreshListOfCats();
        }
    }

    private void listofcats_Loaded(object sender, EventArgs e)
    {
        RefreshListOfCats();
    }

    private async void CloseWindow_Clicked(object sender, EventArgs e)
    {
        await this.CloseAsync();
    }
}
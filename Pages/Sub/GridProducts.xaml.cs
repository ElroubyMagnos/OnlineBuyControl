using DataCore;
using DataCore.Models;
using ElroubyMauiLibraryPlus;
using ElroubyMauiLibraryPlus.DataGridComponents.Parts;
using ElroubyMauiLibraryPlus.Lists.Parts;
using ElroubyMauiLibraryPlus.TextBoxes;
using Microsoft.EntityFrameworkCore;
using OBControl.ClassesOfCommands;
using static ElroubyMauiLibraryPlus.ExtMethods;

namespace OBControl.Pages.Sub;

public partial class GridProducts : ContentPage
{
	public GridProducts()
	{
		InitializeComponent();
	}

    private void New_Clicked(object sender, EventArgs e)
    {
		foreach (var entry in Container)
		{
			if (entry is DynEntry)
			{
				(entry as DynEntry).Text = "";
			}
		}

		IDOf.Value = 0;

		Details.Text = "";

		CoverImage.Source = "empty.jpg";

		cats.SelectedItem = null;
    }

    private async void Save_Clicked(object sender, EventArgs e)
    {
		foreach (Entry entry in Container.OfType<Entry>())
		{
			if (entry.Text.Length == 0)
			{
				await DisplayAlert("Stop", "Please Fill all fields", "OK");
				return;
			}
		}

		if (cats.SelectedItem == null)
		{
			await DisplayAlert("Stop", "Please select a category", "OK");
			return;
		}

		if (Details.Text.Length < 5)
		{
			await DisplayAlert("Attention", "You have to write a description with more than 5 characters long", "I Will");
			return;
		}

		if (BuyPrice.Value > Price.Value)
		{
			await DisplayAlert("Can't Move", "Paid can't be less than The Price", "OK!");
			return;
		}

		var b = new onlinebuy();

		var Selected = await b.Products.FirstOrDefaultAsync(x => x.ID == IDOf.Value);

		if (Selected != null)
		{
			await DisplayAlert("Note", "Product Already Exist", "Ok!");
			return;
		}
		else
		{
			var ImagePath = CoverImage.Source.ToString().Split(':').Last().Trim();
			if (!File.Exists(ImagePath))
			{
				await DisplayAlert("Error", "Image Not Found!", "Ok!");
				return;
			}

            var NewProduct = new Product()
			{
				Title = Title.Text,
				Price = Price.Value,
				BuyPrice = BuyPrice.Value,
				CategoryString = cats.Selected,
				CountAvailable = 0,
				Weight = Weight.Value,
				Details = Details.Text,
				Image = File.ReadAllBytes(ImagePath)
			};

			if (NewProduct.Image == null)
			{
				await DisplayAlert("Error", "Image is null", "What?");
				return;
			}

            await b.Products.AddAsync(NewProduct);

			await b.SaveChangesAsync();

            Grid_Loaded(sender, e);

			New_Clicked(sender, e);
		}
    }

    private async void Delete_Clicked(object sender, EventArgs e)
    {
		var b = new onlinebuy();

		var Selected = await b.Products.FirstOrDefaultAsync(x => x.ID == IDOf.Value);

		if (Selected != null)
		{
			b.Products.Remove(Selected);

			await b.SaveChangesAsync();

			Grid_Loaded(sender, e);
		}
		else await DisplayAlert("Error", "Selected ID not found", "Oh No!");
    }

    private async void Grid_Loaded(object sender, EventArgs e)
    {
        var b = new onlinebuy();

		Grid.EmbedList(await b.Products.Select(x => new
		{
			Count = x.CountAvailable,
			Name = x.Title,
			Identifier = x.ID,
			SellPrice = x.Price,
			x.BuyPrice,
			x.Weight,
			Category = x.CategoryString,
			Description = x.Details,
			x.Image,
			Supplier = b.Users.FirstOrDefault(y => y.ID == x.SupplierID).Url
		}).ToListAsync());
		
		cats.EmbedSourceList(b.CategoriesOfProducts.Select(x => x.Name).ToList());
    }

    private void Grid_SelectedRowChanged(object sender, EventArgs e)
    {
  		IDOf.Text = Grid.GetCell(Grid.SelectedRowIndex, 4).Text;
		CoverImage.Source = ImageSource.FromStream(() => new MemoryStream(Grid.DataSource.Rows[Grid.SelectedRowIndex].ItemArray[5] as byte[]));
		Title.Text = Grid.GetCell(Grid.SelectedRowIndex, 6).Text;
		Price.Value = Grid.GetCell(Grid.SelectedRowIndex, 0).Text.DoubleOrDefault();
		BuyPrice.Value = Grid.GetCell(Grid.SelectedRowIndex, 7).Text.DoubleOrDefault();
		Weight.Value = Grid.GetCell(Grid.SelectedRowIndex, 9).Text.IntOrDefault();
		Details.Text = Grid.GetCell(Grid.SelectedRowIndex, 3).Text;

		foreach (ComboChunk item in cats.Items)
		{
			if (item.Text == Grid.GetCell(Grid.SelectedRowIndex, 1).Text)
			{
				cats.SelectedItem = item;
			}
		}
	}

    private async void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
    {
        var File = await FilePicker.PickAsync();

        if (File == null)
            return;

        var Extension = Path.GetExtension(File.FileName).ToLower();

		if (Extension == ".jpg" || Extension == ".png")
		{
			CoverImage.Source = ImageSource.FromFile(File.FullPath);
		}
		else await DisplayAlert("Error", "Only jpg and png extension accepted", "Try again");
    }
}
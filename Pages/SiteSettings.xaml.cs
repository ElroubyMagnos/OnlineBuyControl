using Microsoft.EntityFrameworkCore;
using DataCore.Models;
using DataCore;
using ElroubyMauiLibraryPlus;
using ElroubyMauiLibraryPlus.TextBoxes;

namespace OBControl.Pages;

public partial class SiteSettings : ContentPage
{
	public SiteSettings()
	{
		InitializeComponent();
	}

    private async void Grid_Loaded(object sender, EventArgs e)
    {
		var b = new onlinebuy();

		var Selected = await b.Settings.FirstOrDefaultAsync();

		if (Selected != null)
		{
			AdminCheckBox.IsChecked = Selected.AdminPostOnly;

			if (Selected.Logo.Length > 0)
				LogoImage.Source = ImageSource.FromStream(() => new MemoryStream(Selected.Logo));

			FacebookURL.Text = Selected.Facebook;
			WhatsAppURL.Text = Selected.WhatsApp;
			InstagramURL.Text = Selected.Instagram;
			TikTokURL.Text = Selected.TikTok;

			if (Selected.DefaultCover.Length > 0)
				DefaultCover.Source = ImageSource.FromStream(() => new MemoryStream(Selected.DefaultCover));

			if (Selected.DefaultMainImage.Length > 0)
				DefaultMainImage.Source = ImageSource.FromStream(() => new MemoryStream(Selected.DefaultMainImage));
        }
    }

    private async void Save_Clicked(object sender, EventArgs e)
    {
		var b = new onlinebuy();

		foreach (DynEntry de in GridLoaded.OfType<DynEntry>())
		{
			if (de.Text.Length == 0)
			{
				await DisplayAlert("Error", "Please Fill all fields", "OK!");
				return;
			}
		}

		b.Settings.RemoveRange(b.Settings);

		await b.SaveChangesAsync();

		await b.Settings.AddAsync(new DataCore.Models.SiteSettings()
		{
			AdminPostOnly = AdminCheckBox.IsChecked,
			Logo = await LogoImage.Source.ImageToBytes(),
			Facebook = FacebookURL.Text,
			WhatsApp = WhatsAppURL.Text,
			Instagram = InstagramURL.Text,
			TikTok = TikTokURL.Text,
			DefaultCover = await DefaultCover.Source.ImageToBytes(),
            DefaultMainImage = await DefaultMainImage.Source.ImageToBytes(),
        });

		await b.SaveChangesAsync();

		await DisplayAlert("Congratz", "Saved Successfully", "Fun!");
    }

    private void LogoImageTap(object sender, TappedEventArgs e)
    {
		GetImage(LogoImage);
    }

	async void GetImage(Image I)
	{
		var Picker = await FilePicker.PickAsync();

		var PathExt = Path.GetExtension(Picker.FileName);

		if (PathExt == ".jpg" || PathExt == ".png")
		{
			I.Source = ImageSource.FromFile(Picker.FullPath);
		}
		else await DisplayAlert("Error", "Only jpg and png is valid", "Sad!");
	}

    private void DefaultCoverTap(object sender, TappedEventArgs e)
    {
        GetImage(DefaultCover);
    }

    private void DefaultMainImageTap(object sender, TappedEventArgs e)
    {
		GetImage(DefaultMainImage);
    }
}
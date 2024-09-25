using DataCore;
using DataCore.Models;
using ElroubyMauiLibraryPlus.TextBoxes;
using ElroubyMauiLibraryPlus;
using static ElroubyMauiLibraryPlus.ExtMethods;
using Microsoft.EntityFrameworkCore;
using System.Net.WebSockets;

namespace OBControl.Pages;

public partial class BranchPage : ContentPage
{
	public BranchPage()
	{
		InitializeComponent();
	}

    private async void Grid_Loaded(object sender, EventArgs e)
    {
		var b = new onlinebuy();

		Grid.EmbedList(await b.Branches.Select(x => new
        {
            x.ID,
            x.Name,
            x.Phone,
            x.Address
        }).ToListAsync());
    }

    private async void Assign_Clicked(object sender, EventArgs e)
    {
        foreach (var entry in this.GridOf.OfType<DynEntry>())
        {
            if (entry.Text.Length == 0)
            {
                await DisplayAlert("Error", "Please fill all fields", "Ok!");
                return;
            }
        }

        var b = new onlinebuy();

        var Selected = await b.Branches.FirstOrDefaultAsync(x => x.ID == IDOf.Value);

        if (Selected == null)
        {
            Selected = new Branch()
            {
                Name = BranchName.Text,
                Phone = BranchPhone.Value.ToString(),
                Address = BranchAddress.Text,
            };

            await b.Branches.AddAsync(Selected);

            await b.SaveChangesAsync();
        }
        else
        {
            Selected.Name = BranchName.Text;
            Selected.Phone = BranchPhone.Value.ToString();
            Selected.Address = BranchAddress.Text;

            b.Branches.Update(Selected);

            await b.SaveChangesAsync();
        }

        New_Clicked(sender, e);

        Grid_Loaded(sender, e);
    }

    private async void Delete_Clicked(object sender, EventArgs e)
    {
        var b = new onlinebuy();

        var Selected = await b.Branches.FirstOrDefaultAsync(x => x.ID == IDOf.Value);

        if (Selected != null)
        {
            b.Branches.Remove(Selected);

            await b.SaveChangesAsync();

            Grid_Loaded(sender, e);
        }
    }

    private void New_Clicked(object sender, EventArgs e)
    {
        IDOf.Value = 0;
        BranchName.Text = "";
        BranchPhone.Value = 0;
        BranchAddress.Text = "";
    }

    private void Grid_SelectedRowChanged(object sender, EventArgs e)
    {
        if (Grid.SelectedRow != null)
        {
            IDOf.Value = Grid.GetCellByColumnName(Grid.SelectedRowIndex, "ID").Text.IntOrDefault();
            BranchName.Text = Grid.GetCellByColumnName(Grid.SelectedRowIndex, "Name").Text;
            BranchPhone.Value = Grid.GetCellByColumnName(Grid.SelectedRowIndex, "Phone").Text.IntOrDefault();
            BranchAddress.Text = Grid.GetCellByColumnName(Grid.SelectedRowIndex, "Address").Text;
        }
    }
}
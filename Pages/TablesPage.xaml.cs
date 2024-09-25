using DataCore;
using DataCore.Models;
using ElroubyMauiLibraryPlus;
using Microsoft.EntityFrameworkCore;
using System.Net.WebSockets;

namespace OBControl.Pages;

public partial class TablesPage : ContentPage
{
	public TablesPage()
	{
		InitializeComponent();
	}

    private async void Grid_Loaded(object sender, EventArgs e)
    {
		var b = new onlinebuy();

		Grid.EmbedList(await b.Tables.ToListAsync());
    }

    private async void Assign_Clicked(object sender, EventArgs e)
    {
        if (TableName.Text.Length < 3 || TableNumber.Value == 0)
        {
            await DisplayAlert("Error", "Please fill all fields", "Ok!");
            return;
        }

        var b = new onlinebuy();

        var SelectedNumber = await b.Tables.FirstOrDefaultAsync(x => x.TableNumber == TableNumber.Value);

        if (SelectedNumber != null)
        {
            await DisplayAlert("Error", "Theres already a table with number " + SelectedNumber.TableNumber, "Oh!");
            return;
        }

        var Selected = await b.Tables.FirstOrDefaultAsync(x => x.ID == IDOf.Value);

        if (Selected == null)
        {
            Selected = new Table()
            {
                TableName = TableName.Text,
                TableNumber = TableNumber.Value
            };

            await b.Tables.AddAsync(Selected);

            await b.SaveChangesAsync();
        }
        else
        {
            Selected.TableName = TableName.Text;
            Selected.TableNumber = TableNumber.Value;

            b.Tables.Update(Selected);

            await b.SaveChangesAsync();
        }

        New_Clicked(sender, e);

        Grid_Loaded(sender, e);
    }

    private async void Delete_Clicked(object sender, EventArgs e)
    {
        var b = new onlinebuy();

        var Selected = await b.Tables.FirstOrDefaultAsync(x => x.ID == IDOf.Value);

        if (Selected != null)
        {
            b.Tables.Remove(Selected);

            await b.SaveChangesAsync();

            Grid_Loaded(sender, e);
        }
    }

    private void New_Clicked(object sender, EventArgs e)
    {
        IDOf.Value = 0;
        TableName.Text = "";
        TableNumber.Value = 0;
    }

    private void Grid_SelectedRowChanged(object sender, EventArgs e)
    {
        if (Grid.SelectedRow != null)
        {
            IDOf.Value = Grid.GetCellByColumnName(Grid.SelectedRowIndex, "ID").Text.IntOrDefault();
            TableName.Text = Grid.GetCellByColumnName(Grid.SelectedRowIndex, "TableName").Text;
            TableNumber.Value = Grid.GetCellByColumnName(Grid.SelectedRowIndex, "TableNumber").Text.IntOrDefault();
        }
    }
}
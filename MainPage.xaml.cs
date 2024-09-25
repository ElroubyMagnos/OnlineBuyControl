using DataCore;
using Microsoft.EntityFrameworkCore;

namespace OBControl
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();

            Routing.RegisterRoute(nameof(Dashboard), typeof(Dashboard));

        }

        private async void EnterButton_Clicked(object sender, EventArgs e)
        {
            var b = new onlinebuy();

            if ((await b.UsersOfControl.FirstOrDefaultAsync(x => x.Name == Username.Text && x.Password == Password.Text)) != null)
            {
                await Shell.Current.GoToAsync(nameof(Dashboard));
            }
            else await DisplayAlert("Error", "Wrong Username or Password", "Try again");
        }

        private async void ScrollView_Loaded(object sender, EventArgs e)
        {
            var b = new onlinebuy();

            var Selected = await b.UsersOfControl.FirstOrDefaultAsync(x => x.Name == "admin");
            if (Selected == null)
            {
                await b.UsersOfControl.AddAsync(new DataCore.Control.ControlUser()
                {
                    Name = "admin",
                    Password = "admin"
                });

                await b.SaveChangesAsync();
            }
        }

        private async void Username_TextChanged(object sender, TextChangedEventArgs e)
        {
            var b = new onlinebuy();

            if ((await b.UsersOfControl.FirstOrDefaultAsync(x => x.Name == Username.Text)) != null)
            {
                Password.Focus();
            }
        }

        private async void Password_TextChanged(object sender, TextChangedEventArgs e)
        {
            var b = new onlinebuy();

            if ((await b.UsersOfControl.FirstOrDefaultAsync(x => x.Name == Username.Text && x.Password == Password.Text)) != null)
            {
                EnterButton_Clicked(sender, e);
            }
        }
    }
}

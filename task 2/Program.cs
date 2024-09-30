using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc.Infrastructure;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

List<Profile> profiles = new() {
new Profile(1,"evrart","m",new DateTime(2000,12,13)),
new Profile(2,"harry","n",new DateTime(1956,6,6)),
new Profile(3,"jean","u",new DateTime(1994,11,1)),
new Profile(4,"carl","a",new DateTime(2004,4,23)),
};

    
app.MapGet("/profiles", () => { return TypedResults.Ok(profiles); });

app.MapGet("/profile/{id}", Ok<Profile>(int id) => {
    var prof = profiles.SingleOrDefault(x => x.id == id);
    return TypedResults.Ok(prof);
});


app.Run();


public record Profile(int id, string name, string description,DateTime dateofbirth);
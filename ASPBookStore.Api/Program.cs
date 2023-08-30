using ASPBookStore.Api.Core;
using ASPBookStore.DataAccess;
using ASPBookStore.Implementation.Extensions;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.


builder.Services.AddScoped<ASPBookStoreContext>();
builder.Services.AddUsesCases();
builder.Services.AddJwt();
builder.Services.AddApplicationActor();
builder.Services.AddValidators();
builder.Services.AddHttpContextAccessor();
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddAutoMapper(typeof(QueryableExtensions).Assembly);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
    });
}

app.UseAuthentication();
app.UseAuthorization();
app.UseStaticFiles();

app.UseMiddleware<GlobalExceptionHandler>();

app.MapControllers();

app.Run();

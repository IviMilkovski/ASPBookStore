using Api.Core;
using ASPBookStore.Application.Commands.Categories;
using ASPBookStore.Application.Queries.Categories;
using ASPBookStore.Application;
using ASPBookStore.Implementation.Validators.Categories;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using System.Text;
using ASPBookStore.Implementation.Commands.Categories;
using ASPBookStore.Implementation.Queries.Categories;
using ASPBookStore.Implementation.Logging;
using ASPBookStore.Implementation.Validators.Users;
using ASPBookStore.Application.Commands.Users;
using ASPBookStore.Implementation.Commands.Users;
using ASPBookStore.Application.Queries.Users;
using ASPBookStore.Implementation.Queries.Users;
using ASPBookStore.Implementation.Validators.Authors;
using ASPBookStore.Application.Commands.Authors;
using ASPBookStore.Implementation.Commands.Authors;
using ASPBookStore.Application.Commands.Books;
using ASPBookStore.Implementation.Commands.Books;
using ASPBookStore.Application.Queries.Authors;
using ASPBookStore.Implementation.Queries.Authors;
using ASPBookStore.Implementation.Validators.Books;
using ASPBookStore.Application.Queries.Books;
using ASPBookStore.Implementation.Queries.Books;
using ASPBookStore.Implementation.Validators;
using ASPBookStore.Application.Commands.Carts;
using ASPBookStore.Implementation.Commands.Carts;
using ASPBookStore.Application.Queries;
using ASPBookStore.Implementation.Queries.Carts;
using ASPBookStore.Implementation.Validators.Orders;
using ASPBookStore.Implementation.Queries.Orders;
using ASPBookStore.Application.Queries.Orders;
using ASPBookStore.Implementation.Commands.Orders;
using ASPBookStore.Application.Commands.Orders;
using ASPBookStore.Application.Email;
using ASPBookStore.Implementation.Email;
using ASPBookStore.Implementation.Queries.Logs;
using ASPBookStore.Application.Queries.Logs;

namespace ASPBookStore.Api.Core
{
    public static class ContainerExtensions
    {
        public static void AddValidators(this IServiceCollection services)
        {
            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<UpdateCategoryValidator>();
            services.AddTransient<CreateUserValidator>();
            services.AddTransient<UpdateUserValidator>();
            services.AddTransient<CreateAuthorValidator>();
            services.AddTransient<UpdateAuthorValidator>();
            services.AddTransient<CreateBookValidator>();
            services.AddTransient<UpdateBookValidator>();
            services.AddTransient<CreateCartValidator>();
            services.AddTransient<CreateOrderValidator>();
        }

        public static void AddUsesCases(this IServiceCollection services)
        {
            services.AddTransient<UseCaseExecutor>();

            //category
            services.AddTransient<ICreateCategoryCommand, EFCreateUserCommand>();
            services.AddTransient<IDeleteCategoryCommand, EfDeleteCategoryCommand>();
            services.AddTransient<IUpdateCategoryCommand, EfUpdateCategoryCommand>();

            //user
            services.AddTransient<ICreateUserCommand, EfCreateUserCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<IUpdateUserCommand, EFUpdateUserCommand>();

            //author
            services.AddTransient<ICreateAuthorCommand, EfCreateAuthorCommand>();
            services.AddTransient<IDeleteAuthorCommand, EfDeleteAuthorCommand>();
            services.AddTransient<IUpdateAuthorCommand, EfUpdateAuthorCommand>();

            //book
            services.AddTransient<ICreateBookCommand, EfCreateBookCommand>();
            services.AddTransient<IDeleteBookCommand, EfDeleteBookCommand>();
            services.AddTransient<IUpdateBookCommand, EfUpdateBookCommand>();

            //cart
            services.AddTransient<ICreateCartCommand, EfCreateCartCommand>();
            services.AddTransient<IDeleteCartCommand, EfDeleteCartCommand>();

            //order
            services.AddTransient<ICreateOrderCommand, EfCreateOrderCommand>();

            //email
            services.AddTransient<IEmailSender, SmtpEmailSender>();

            //logs
            services.AddTransient<IGetAuditLogsQuery, EfGetLogsQuery>();

            //queries

            //category
            services.AddTransient<IGetCategoriesQuery, EFGetCategoriesQuery>();
            services.AddTransient<IGetCategoryQuery, EFGetCategoryQuery>();

            //user
            services.AddTransient<IGetUsersQuery, EFGetUsersQuery>();
            services.AddTransient<IGetUserQuery, EFGetUserQuery>();

            //author
            services.AddTransient<IGetAuthorsQuery, EfGetAuthorsQuery>();
            services.AddTransient<IGetAuthorQuery, EfGetAuthorQuery>();

            //book
            services.AddTransient<IGetBooksQuery, EfGetBooksQuery>();
            services.AddTransient<IGetBookQuery, EfGetBookQuery>();

            //cart
            services.AddTransient<IGetCartQuery, EfGetCartQuery>();

            //order
            services.AddTransient<IGetOrdersQuery, EfGetOrdersQuery>();
            services.AddTransient<IGetOrderQuery, EfGetOrderQuery>();

            //usecase
            services.AddTransient<IActivityLogger, DatabaseUseCaseLogger>();
        }

        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                    return new AnonymousActor();

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;
            });
        }

        public static void AddJwt(this IServiceCollection services)
        {
            services.AddTransient<JwtManager>();

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }

        public static void AddSwagger(this IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Cari books", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                          {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                            },
                            new List<string>()
                          }
                    });
            });
        }

    }
}

using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Queries;
using ASPBookStore.Domain;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Extensions
{
    public static class QueryableExtensions
    {
        public static PagedResponse<TDto> Paged<TDto, TEntity>(
            this IQueryable<TEntity> query, PagedSearch search, IMapper mapper)
            where TDto : class
        {
            var skipCount = search.PerPage * (search.Page - 1);

            var skipped = query.Skip(skipCount).Take(search.PerPage);

            var response = new PagedResponse<TDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = mapper.Map<IEnumerable<TDto>>(skipped)
            };

            return response;
        }

    }

    public static class CommandableExtensions
    {
        public static void Delete(this Entity entity)
        {
            entity.IsDeleted = true;
            entity.IsActive = false;
            entity.DeletedAt = DateTime.UtcNow;
        }

        private static string apiPath = Directory.GetCurrentDirectory();
        private static string path = Path.Combine(apiPath, "wwwroot", "images");

        //public static string UploadImage(IFormFile image)
        //{
        //    var guid = Guid.NewGuid();
        //    var extension = Path.GetExtension(image.FileName);

        //    var newFileName = guid + extension;

        //    var uploadPath = Path.Combine(path, newFileName);

        //    using (var fileStream = new FileStream(uploadPath, FileMode.Create))
        //    {
        //        image.CopyTo(fileStream);
        //    }

        //    return newFileName;
        //}
    }


    }

﻿using Ecommerce.DAL;
using Ecommerce.Repository;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace Ecommerce.Models.Home
{
    public class HomeIndexViewModel
    {
       
            public GenericUnitOfWork _unitOfWork = new GenericUnitOfWork();
            ecommerceDBEntities context = new ecommerceDBEntities();
            public IPagedList<Product> ListOfProducts { get; set; }
        public HomeIndexViewModel CreateModel(string search, int pageSize, int? page)
        {
            SqlParameter[] param = new SqlParameter[]{
                new SqlParameter("@search",search??(object)DBNull.Value)
            };
            IPagedList<Product> data = context.Database.SqlQuery<Product>("GetBySearch @search", param).ToList().ToPagedList(page ?? 1, pageSize);
            return new HomeIndexViewModel
            {
                ListOfProducts = data
            };
        }

    }

}

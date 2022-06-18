﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NHibernate;
using System.Reflection;
using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using NHibernate.Cfg;
using NHibernate.Tool.hbm2ddl;

namespace CS_lab5
{
    public partial class MainPage : System.Web.UI.MasterPage
    {

        private ISessionFactory factory;
        private ISession session;

        private ISession openSession(String host, int port, String database, String user, String passwd)
        {
            ISession session = null;
            Assembly mappingsAssemly = Assembly.GetExecutingAssembly();
            if (factory == null)
            {

                factory = Fluently.Configure().Database(PostgreSQLConfiguration.PostgreSQL82.ConnectionString
                    (c => c.Host(host).Port(port).Database(database).Username(user).Password(passwd)))
                    .Mappings(m => m.FluentMappings.AddFromAssembly(mappingsAssemly)).ExposeConfiguration(BuildSchema)
                    .BuildSessionFactory();
            }
            session = factory.OpenSession();
            return session;
        }

        private static void BuildSchema(Configuration config)
        {
            //new SchemaExport(config).Create(false, true);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            session = openSession("localhost", 5432,
            "csharp", "postgres", "123");
            Session["hbmsession"] = session;
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

    // redirecti to home page (with list of providers) 
    protected void Menu1_MenuItemClick1(object sender, MenuEventArgs e)
    {
      if (Menu1.SelectedItem.Text == "Providers")
      {
        Response.Redirect("Default.aspx");
      }
    }
  }
}
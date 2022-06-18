﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainPage.Master" CodeBehind="ProductsForm.aspx.cs" Inherits="CS_lab5.ProductsForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <table style="width:100%;">
    <tr align="center">
      <td>
        <asp:Label ID="Label4" runat="server" Text="List of products of provider " Font-Bold="True" Font-Size="20pt" ForeColor="Maroon"> 
        </asp:Label>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="20pt" ForeColor="Maroon">
        </asp:Label>
      </td>
    </tr>
    <tr>
      <td>
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowFooter="true" ShowHeader="true"
                                  AllowPaging="true" PageSize="10"
                                  Font-Size="14pt" HorizontalAlign="Center"
                                  onrowcancelingedit="GridView1_RowCancelingEdit"
                                  onrowdeleting="GridView1_RowDeleting"
                                  onrowediting="GridView1_RowEditing"
                                  onrowupdating="GridView1_RowUpdating"
                                  onpageindexchanging="GridView1_PageIndexChanging">
      <Columns>
      <asp:TemplateField HeaderText="Product name" ItemStyle-Width="250">
        <ItemTemplate>
          <asp:Label id="myLabel1" runat="server" Text='<%# Bind("Name")%>' />
        </ItemTemplate>
        <EditItemTemplate>
          <asp:TextBox ID="myTextBox1" runat="server" Width="250" Text='<%# Bind("Name") %>'/>
        </EditItemTemplate>
        <FooterTemplate>
          <asp:TextBox ID="myFooterTextBox1" runat="server" Width="250" Text='<%# Bind("Name") %>' />
        </FooterTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Price" ItemStyle-Width="250">
          <ItemTemplate>
            <asp:Label id="myLabel2" runat="server" Text='<%# Bind("Price")%>' />
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="myTextBox2" runat="server" Width="250" Text='<%# Bind("Price") %>'/>
          </EditItemTemplate>
          <FooterTemplate>
            <asp:TextBox ID="myFooterTextBox2" runat="server" Width="250" Text='<%# Bind("Price") %>' />
          </FooterTemplate>
          </asp:TemplateField>

         <asp:TemplateField HeaderText="Quantity" ItemStyle-Width="50">
          <ItemTemplate>
            <asp:Label id="myLabel3" runat="server" Text='<%# Bind("Count")%>' />
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="myTextBox3" runat="server" Width="50" Text='<%# Bind("Count") %>'/>
          </EditItemTemplate>
          <FooterTemplate>
            <asp:TextBox ID="myFooterTextBox3" runat="server" Width="50" Text='<%# Bind("Count") %>' />
          </FooterTemplate>
         </asp:TemplateField>

          <%--Commands--%>
        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"> 
          <ItemTemplate>
            <asp:ImageButton ID="ibEdit" runat="server" CommandName="Edit" Text="Edit" ImageUrl="~/img/edit2.png" /> 
            <asp:ImageButton ID="ibDelete" runat="server" CommandName="Delete" Text="Delete" ImageUrl="~/img/cross2.png" />
          </ItemTemplate>
          <EditItemTemplate>
            <asp:ImageButton ID="ibUpdate" runat="server" CommandName="Update" Text="Update" ImageUrl="~/img/edit2.png" />
            <asp:ImageButton ID="ibCancel" runat="server" CommandName="Cancel" Text="Cancel" ImageUrl="~/img/cross2.png" />
          </EditItemTemplate>
          <FooterTemplate>
            <asp:ImageButton ID="ibInsert" runat="server" CommandName="Insert" OnClick="ibInsert_Click" ImageUrl="~/img/add2.png" />
          </FooterTemplate>
          </asp:TemplateField>
        </Columns>

        <EmptyDataTemplate>
          <table border="1" cellpadding="0" cellspacing="0">
            <tr>
              <td width="200" align="center">Product name</td>
              <td width="300" align="center">Price</td>
              <td width="300" align="center">Quantity</td>
              <td width="300" align="center">Action</td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="emptyProductNameTextBox" runat="server" Width="200"/>
              </td>
              <td>
                <asp:TextBox ID="emptyProductPriceTextBox" runat="server" Width="300"/>
              </td>
                <td>
                <asp:TextBox ID="emptyProductQuantityTextBox" runat="server" Width="300"/>
              </td>
              <td align="center">
                <asp:ImageButton ID="emptyImageButton" runat="server" ImageUrl="~/img/select2.png" OnClick="ibInsertInEmpty_Click"/>
              </td>
            </tr>
          </EmptyDataTemplate>
        <PagerStyle HorizontalAlign ="Center" />
        </asp:GridView>
       </td>
      </tr>
    </table>
  </asp:Content>
        


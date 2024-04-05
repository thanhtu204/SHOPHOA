<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="ShopHoa.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-inline">
        Danh Sách Loại Hoa
        <asp:DropDownList ID="Ddlloai" AutoPostBack="true" CssClass="form-control" runat="server" DataSourceID="dsloai" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
    </div>

    <div class="row">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoa">
            <ItemTemplate>
                <div class="col-md-3">
                    <a href="#">
                        <img src="Hinh_San_Pham/<%# Eval("hinh")  %>" style="width:100px" />
                    </a> <br />
                    <%# Eval("TenHoa") %> <br />
                    Giá bán : <%# Eval("gia") %> <br />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>



    <asp:SqlDataSource ID="dsloai" runat="server"
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString2 %>"
        SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsHoa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString2 %>" 
        SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Ddlloai" DefaultValue="1"
                Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
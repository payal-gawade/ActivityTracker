<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Activity_Tracker111.Default" %>


<!DOCTYPE html>
<html>
<head>
    <title>Activity Tracker</title>
</head>
<body>
    <h1>Activity Tracker</h1>
    <form id="activityForm" xmlns="http://www.w3.org/1999/xhtml" runat="server">
        <label for="name">Name:</label>
        <input type="text" id="name" runat="server" />
        <br />

        <label for="weight">Weight:</label>
        <input type="number" id="weight" runat="server" />
        <br />

        <label for="height">Height:</label>
        <input type="number" id="height" runat="server" />
        <br />

        <label for="gender">Gender:</label>
        <select id="gender" runat="server">
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select>
        <br />

        <h2>Daily Activities</h2>
        <label for="date">Date:</label>
        <input type="date" id="date" runat="server" />
        <br />

        <label for="wakeUpTime">Wake Up Time:</label>
        <input type="time" id="wakeUpTime" runat="server" />
        <br />

        <label for="gym">Gym:</label>
        <input type="checkbox" id="gym" runat="server" />
        <br />

        <label for="meditation">Meditation:</label>
        <input type="checkbox" id="meditation" runat="server" />
        <input type="number" id="meditationMinutes" runat="server" />
        <br />

        <label for="reading">Reading:</label>
        <input type="checkbox" id="reading" runat="server" />
        <input type="number" id="readingPages" runat="server" />
        <br />

        <input type="submit" value="Submit" runat="server" onserverclick="SubmitActivity" />
    <h2>Activity Records</h2>
   <asp:GridView ID="activityGridView" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:BoundField DataField="Weight" HeaderText="Weight" />
        <asp:BoundField DataField="Height" HeaderText="Height" />
        <asp:BoundField DataField="Gender" HeaderText="Gender" />
        <asp:BoundField DataField="WakeUpTime" HeaderText="Wake Up Time" DataFormatString="{0:hh\\:mm}" />
        <asp:TemplateField HeaderText="Gym">
            <ItemTemplate>
                <%# Convert.ToBoolean(Eval("Gym")) ? "Yes" : "No" %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Meditation">
            <ItemTemplate>
                <%# Convert.ToBoolean(Eval("Meditation")) ? "Yes" : "No" %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="MeditationMinutes" HeaderText="Meditation Minutes" />
        <asp:TemplateField HeaderText="Reading">
            <ItemTemplate>
                <%# Convert.ToBoolean(Eval("Reading")) ? "Yes" : "No" %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="ReadingPages" HeaderText="Reading Pages" />
        <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
    </Columns>
</asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ActivityTrackerDBConnectionString %>" SelectCommand="SELECT * FROM [ActivityRecords]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
    </form>

    </body>
</html>


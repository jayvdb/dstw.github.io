---
layout: post
title: "Simple C# CRUD Desktop App"
date: 2015-03-19 15:23:38 +0700
comments: true
categories: c# dotnet mssql
---
This simple application which I built is about CRUD application using C#.
In this example, that application is being used to save information that is username and IP address of user desktop computer.
For beginning, create new project on Visual Studio (I use version 2008) with name InputDataApp.

![inputdataapp1](/images/inputdataapp1.png)

Click Form1 that appears after we create new project, edit on the menu Properties > Name for coding reference and on Text for appearance description.

![inputdataapp2](/images/inputdataapp2.png) ![inputdataapp3](/images/inputdataapp3.png)

Add 3 label for description and 3 text box to grab user input.
To do this, just do drag-and-drop on the menu Toolbox > Label and TextBox.

Tambahkan 3 label untuk keterangan dan 3 text box untuk menangkap inputan user. Caranya dengan drag-and-drop di bagian Toolbox > Label dan TextBox.
This should be an example:

![inputdataapp4](/images/inputdataapp4.png)

Edit on properties > name in existing textbos, for example textBox1 change to tboxUser to link the coding reference easier latter.

![inputdataapp5](/images/inputdataapp5.png)

Repeat previous step for textBox2 and textBox3.
Then add 4 buttons with help menu properties > button.

![inputdataapp6](/images/inputdataapp6.png) ![inputdataapp7](/images/inputdataapp7.png)

Edit on menu preperties from previous buttons on its Name and Text menu variable.
So there are 4 name properties: btnCari, btnTambah, btnEdit and btnHapus
Next step is add DataGridView form as main menu to display output from the datasource (in this case, database) in realtime.

![inputdataapp8](/images/inputdataapp8.png)

Things to pay attention more from this DataGridView is properties on AllowUserToAddRows and AllowUserToDeleteRows which has default configuration True, must be changed to False.

![inputdataapp9](/images/inputdataapp9.png)

After all those forms created, then dive in coding side. To do this, right click on Form1.cs and choose View Code.

![inputdataapp10](/images/inputdataapp10.png)

Change the code as follow:

{% include_code Form1 %}

Connect those previous buttons with created code. Start from Search button. To do this, change Events Click on that form (search thunder icon on Properties):

![inputdataapp11](/images/inputdataapp11.png)
![inputdataapp12](/images/inputdataapp12.png)

Edit this based on code previously created. Repeat this step for all existing buttons.
Next step, create database on MS SQL. In this example, I use MS SQL 2008 R2. Login to MS sQL Server Management Studio, then create this query:

![inputdataapp13](/images/inputdataapp13.png)

Based on created code, then we need to create database with name InputDataDB. To create this, execute following command:

{% highlight sql %}
create database InputDataDB;
{% endhighlight %}

Click execute or press F5 on MS SMS.
Then command for the tables:

{% highlight sql %}
use InputDataDB;
 
create table datakomputer
(
	NamaUser varchar(255),
	IP_Address varchar(255),
	Deskripsi varchar(255)
);
{% endhighlight %}

To confirm that the table successfully created, check with this query:

{% highlight sql %}
select * from datakomputer
{% endhighlight %}

Back to Visual Studio, the next step we need do is compile the code that have been built. Click Build > Build Solution (or press F6).
After compilation process success, application can be run by click Debug > Start Without Debugging (or press Ctrl + F5).

![inputdataapp14](/images/inputdataapp14.png) ![inputdataapp15](/images/inputdataapp15.png)

![inputdataapp16](/images/inputdataapp16.png)

That's all. This simple application can do add, edit and delete data as user demand.
To download the complete sourcecode of this application, you can go to here:

[https://github.com/didiksetiawan/InputDataApp](https://github.com/didiksetiawan/InputDataApp)

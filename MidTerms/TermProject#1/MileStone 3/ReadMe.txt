Design:

The Request and Donation tables are driving tables.

Request contains all the information on request from cients.
This includes who made the request, what employee confirmed it, what package is needed, 
who needs it, when it was made, when the recipient got the package, and the status of the package. 

Requests references client, employee, package, and recipient.
These tables minus package cantain info about people with relations to the organization.
Package is a basic description of each available package and what size they are.
To get specific details on what each package containes there is a PackageManifest that links 
package to a candy table.

The candy table provides info on each specific candy that can be found in a package.
The PackageManifest shows which candies are in each package.

The Donation table is seperate from the request table and is not linked to it in any way.
The Donation table lists donations recieved, who donated them, when they donated, and for how much.
This links out to the Donors table that provides more info on each individual donor,
including earliest and most recent donations and total donated.

Choices:

I decided to seperate donations and request as to avoid mixing actions of the organization
and the actions of those helping them.

I also decided to split Recipients and Clients despite the fact that a client can also be a recipient
because it's important to clarify the people that are purly on the recieving end and have
no real reason to be in contact with the organization.

I instead used a stored procedure to find people inside both the client and recipient table.

End User:

The end user would use this database in two places.

First a website would allow clients to make request that once confirmed by an 
employee would go to the request table.
The website would also allow potential donors to make donations. Once the money goes through
the donor would be added to the Donor table and and the donation recorded on the Donation table.

The website would also pull data from the Candy and Package tables to display what's available.

The other use of the database would be for the organization to find info on people involved with 
the organization and keep track of what candy they have available.

The organization could go in and add new candies or packages that would then update on the website. 



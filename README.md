# Wine Shop

Wine Shop is a Java web application for browsing and purchasing wine products. The project supports product listing, searching, filtering, shopping cart management, checkout, login, and admin-only page access.

## Features

- View all wine products with images, prices, discount prices, categories, and quantities.
- Search products by name.
- Filter products by price range and discount status.
- Sort products by price in ascending or descending order.
- Add products to a session-based shopping cart.
- View cart details, item quantities, item totals, and order total.
- Complete a simple checkout flow by clearing the current cart.
- Login with username and password.
- Restrict admin page access to admin users only.
- Track and display the last viewed product using cookies.

## Tech Stack

- Java Servlet
- JSP and JSTL
- JPA with EclipseLink
- SQL Server
- Apache Tomcat
- Bootstrap
- HTML/CSS
- NetBeans Ant project

## Project Structure

```text
WineShop/
├── src/java/controller/      # Servlet controllers
├── src/java/models/          # JPA entities, controllers, and cart model
├── src/conf/                 # Persistence configuration
├── web/                      # JSP pages, layouts, images, and web config
├── lib/                      # Required external libraries
├── WineStore.sql             # Database schema and sample data
└── build.xml                 # Ant build file
```

## Main Modules

- `ListAllProductController`: loads and displays all products.
- `SearchController`: searches products by keyword.
- `FilterController`: filters products by price, discount, and sort order.
- `CartController`: adds products to the shopping cart.
- `BuyController`: handles the checkout action.
- `LoginController`: authenticates users.
- `AdminController`: protects admin-only access.

## Database

The database script is available in:

```text
WineStore.sql
```

It creates the `WineStore` database with:

- `Users`: stores login accounts, admin roles, and account status.
- `Products`: stores wine product information.

Sample accounts:

| Username | Password | Role |
| --- | --- | --- |
| admin | 123 | Admin |
| user1 | 123 | User |
| user2 | 123 | User |

## How to Run

1. Create the SQL Server database by running `WineStore.sql`.
2. Open the project in NetBeans.
3. Configure Apache Tomcat for the project.
4. Check the SQL Server connection in `src/conf/persistence.xml`.
5. Build and run the project.
6. Open the product page through the `san_pham` route after deployment.

## Notes

- The current database connection in `persistence.xml` uses SQL Server on `localhost:1433`.
- Update the database username and password to match your local SQL Server setup.
- The project is designed as a learning project for Java Servlet/JSP web development.

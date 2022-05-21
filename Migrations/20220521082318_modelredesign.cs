using Microsoft.EntityFrameworkCore.Migrations;

namespace SimpleBookLibrary.Migrations
{
    public partial class modelredesign : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Books_Categories_CategoryId",
                table: "Books");

            migrationBuilder.DropForeignKey(
                name: "FK_Books_Favourites_FavouriteId",
                table: "Books");

            migrationBuilder.DropIndex(
                name: "IX_Books_CategoryId",
                table: "Books");

            migrationBuilder.DropIndex(
                name: "IX_Books_FavouriteId",
                table: "Books");

            migrationBuilder.DropColumn(
                name: "CategoryId",
                table: "Books");

            migrationBuilder.DropColumn(
                name: "FavouriteId",
                table: "Books");

            migrationBuilder.AddColumn<int>(
                name: "BookId",
                table: "Favourites",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Favourites_BookId",
                table: "Favourites",
                column: "BookId");

            migrationBuilder.AddForeignKey(
                name: "FK_Favourites_Books_BookId",
                table: "Favourites",
                column: "BookId",
                principalTable: "Books",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Favourites_Books_BookId",
                table: "Favourites");

            migrationBuilder.DropIndex(
                name: "IX_Favourites_BookId",
                table: "Favourites");

            migrationBuilder.DropColumn(
                name: "BookId",
                table: "Favourites");

            migrationBuilder.AddColumn<int>(
                name: "CategoryId",
                table: "Books",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "FavouriteId",
                table: "Books",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Books_CategoryId",
                table: "Books",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_Books_FavouriteId",
                table: "Books",
                column: "FavouriteId");

            migrationBuilder.AddForeignKey(
                name: "FK_Books_Categories_CategoryId",
                table: "Books",
                column: "CategoryId",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Books_Favourites_FavouriteId",
                table: "Books",
                column: "FavouriteId",
                principalTable: "Favourites",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}

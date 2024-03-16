create database Steam;
use Steam;

create table categories(
Special_selection varchar(100) NOT NULL,
Genres varchar(50) NOT NULL,
Themes varchar (100) NOT NULL, 
Player_support varchar (50)
); 

drop table categories;

select * from categories;
alter table categories rename column Special_selection to name_category;
alter table categories rename column Genres to number_of_genres;
alter table categories rename column Themes to number_of_themes;
alter table categories rename column Player_support to number_of_player_support;

insert into categories (name_category, number_of_genres, number_of_themes, number_of_player_support) values ("Genres", "Many", "A Few", "Some");


create table genres(
type varchar(100) NOT NULL,
number_of_games int NOT NULL,
number_of_discounted_games int NOT NULL,
genre_id int primary key auto_increment
);

insert into genres (type, number_of_games, number_of_discounted_games) values ('Strategy', '124' , '15');
insert into genres (type, number_of_games, number_of_discounted_games) values ('Adventure', '400' , '100');
insert into genres (type, number_of_games, number_of_discounted_games) values ('Simulation', '256' , '40');
insert into genres (type, number_of_games, number_of_discounted_games) values ('Sports & Racing', '50' , '5');

select * from genres;

create  table special_selection(
selection_category varchar (100) NOT NULL,
number_of_games int NOT NULL,
id int,
constraint foreign key (id) references genres (genre_id)
);

select * from special_selection;

create  table Themes(
selection_category varchar (100) NOT NULL,
number_of_games int NOT NULL,
id int,
constraint foreign key (id) references genres (genre_id)
);
select * from Themes;

alter table Themes rename column selection_category to theme_category;
alter table Themes add theme_id int primary key auto_increment;
alter table special_selection add selection_id int primary key auto_increment;

create table games(
name varchar(500) NOT NULL,
genre_id int,
ratin real,
price real,
description varchar (1000),
game_id int primary key auto_increment,
constraint foreign key (genre_id) references genres (genre_id)
);

insert into games (name, genre_id, ratin, price) values ("Call of duty 2", "1", "8", "10"), ("Dragon Age", "2", "9", "29"), ("Cyberpunk", "4", "7.5", "60"), ("Fifa 2024", "6", "5", "50"), ("EuroTruck", "6", "4.5", "25");
select * from games;

create table sales(
sale_id int primary key auto_increment,
id_game int,
id_genre int,
constraint foreign key (id_game) references games (game_id),
constraint foreign key (id_genre) references genres (genre_id)
);


#1 Show the action total of action games
select * from games where genre_id=1;

#2 Show the name of one game from the Strategy Genre
select * from games where game_id=1;

#3 Show games that are have a lower price than 30
select count(*) as price from games where price>30;

create database the_office;

create table episodes_rating(
select episodes.*, rating.imdb_rating, rating.total_votes from episodes
left join rating on episodes.title = rating.title);


select count(distinct episode_num_overall) from episodes_rating
where directed_by = 'Ken Kwapis';

select count(distinct Episode_Number), Season, char_appearances.Character from char_appearances
where char_appearances.Character = 'Dwight'
group by char_appearances.Character, Season;

select count(char_appearances.Character), char_appearances.Character from char_appearances
where char_appearances.Character = 'Dwight'
group by char_appearances.Character;

create table total_appearances(
select count(char_appearances.Character) as total, char_appearances.Character from char_appearances
group by char_appearances.Character
having(total>=3)
order by total desc)
;

select * from char_appearances;

select count(distinct char_appearances.Character) from char_appearances;

select * from episodes;

select * from episodes_rating;

create table directed_by(
select a.title, a.directed_by, b.Character as actor_director from episodes_rating a
join actors_names b on a.directed_by = b.Real_Name);
 
 create table written_by(
select a.title, a.written_by, b.Character as actor_writer from episodes_rating a
join actors_names b on a.written_by = b.Real_Name);

create table writer_director(
select a.title, a.directed_by, a.written_by, b.Character as actor_writer from episodes_rating a
join actors_names b on a.written_by = b.Real_name and a.directed_by = b.Real_Name);


select * from episodes_rating
where directed_by like '%Mindy%';


select * from episodes_rating
where written_by = 'Ed Helms';

select * from episodes_rating
where directed_by = 'Ed Helms';

select distinct actor_writer from written_by;

select avg(us_viewers) from episodes;
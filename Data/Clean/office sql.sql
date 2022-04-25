create database the_office;

create table episodes_rating(
select episodes.*, rating.imdb_rating, rating.total_votes from episodes
left join rating on episodes.title = rating.title);


select count(distinct episode_num_overall) from episodes_rating
where directed_by = 'Ken Kwapis';
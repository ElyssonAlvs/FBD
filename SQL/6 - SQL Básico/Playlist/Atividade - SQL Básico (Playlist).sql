-- SQL Básico - Playlist
select * from public.gravadora;
/*
1. Insira cinco novas músicas no banco de dados e seus respectivos artistas.
*/
-- Inserindo novos artistas
insert into public.artista(cod_autor, nome) values
	(13, 'Stone Sour'),
	(14, 'Calcinha Preta'),
	(15, 'Slipknot'),
	(16, 'System of a Down'),
	(17, 'Poor Mans Poison');
select * from public.artista;
-- Inserindo novas músicas
insert into public.musica(cod_musica, id_gravadora, titulo) values
	(23, 2, 'Fabuless'),
	(24, 1, 'Faço chover'),
	(25, 1, 'Before I Forget'),
	(26, 2, 'Toxicity'),
	(27, 2, 'Feed Machine');
select * from public.musica;
-- Relacionando músicas e artistas
insert into public.musica_artista(cod_musica, cod_artista)
values (23, 13), (24, 14), (25, 15), (26, 16), (27, 17);
select * from public.musica_artista;

/*
2. Insira cada música da questão em uma das playlists já criadas.
*/
select * from public.playlist;
select * from public.playlist_musica;
insert into playlist_musica(id_playlist, cod_musica) values
(2,24),(1,23), (1,25), (1,26), (1,27);

/*
3. Obtenha o título da música cujo código é 10.
*/
select titulo from public.musica where cod_musica = 10;

/*
4. Obtenha os dados da música cujo título é ‘Infinita Highway’
*/
select * from public.musica where titulo = 'Infinita Highway';

/*
5. Obtenha os títulos de todas as músicas.
*/

select titulo from public.musica;

/*
6. Obtenha o título e nome da gravadora de todas as músicas.
*/
select m.titulo, g.nome
from public.musica as m
INNER JOIN public.gravadora as g 
ON m.id_gravadora = g.id_gravadora;
-- Livia
select m.titulo, g.nome
from public.musica m, public.gravadora g
where m.id_gravadora = g.id_gravadora;

/*
7. Obtenha os dados das playlists da Ana
*/
select * from public.usuario; -- Ana = 10
select * from public.playlist;
select * from public.playlist where id_usu = 10;
-- Livia
select *
from public.usuario u, public.playlist p
where p.id_usu = u.id_usuario and u.nome = 'Ana';

/*
8. Obtenha as músicas que começam com a letra A. 
*/
select * from public.musica where titulo like 'A%';

/*
9. Obtenha as músicas que terminam com a letra A e tem 5 letras no título.
*/
select * from public.musica where titulo like '____a';

/*
10. Obtenha os dados dos artistas com código entre 3 e 10. Use o operador Between
*/
select * from public.artista where cod_autor between 3 and 10;

/*
11. Obter, sem repetição, o título das músicas e a nome da gravadora das músicas que estão em
alguma playlist de Bruno.
*/
set schema 'public';
select distinct  musica.titulo, gravadora.nome
from playlist_musica
join musica on playlist_musica.cod_musica = musica.cod_musica
join gravadora on musica.id_gravadora = musica.id_gravadora
join playlist on playlist_musica.id_playlist = playlist.id_playlist
join usuario on playlist.id_usu = usuario.id_usuario
where usuario.nome = 'Bruno';

set schema 'public';
select distinct m.titulo, g.nome
from usuario u, playlist p, playlist_musica pm, musica m, gravadora g
where p.id_usu = u.id_usuario and u.nome = 'Bruno'
and p.id_playlist = pm.id_playlist
and pm.cod_musica = m.cod_musica
and m.id_gravadora = g.id_gravadora;

/*
12. Obter, sem repetição, os artistas das músicas que estão em alguma playlist da Ana
*/
set schema 'public';
select distinct artista.nome
from artista
join musica_artista on artista.cod_autor = musica_artista.cod_artista
join musica on musica_artista.cod_musica = musica.cod_musica
join playlist_musica on musica.cod_musica = playlist_musica.cod_musica
join playlist on playlist_musica.id_playlist = playlist.id_playlist
where playlist.id_usu = 10;
select * from playlist;

set schema 'public';
select distinct m.titulo, g.nome
from usuario u, playlist p, playlist_musica pm, musica m, gravadora g
where p.id_usu = u.id_usuario and u.nome = 'Ana'
and p.id_playlist = pm.id_playlist
and pm.cod_musica = m.cod_musica
and m.id_gravadora = g.id_gravadora
order by m.titulo desc
offset 2 limit 1;

/*
13. Obter o título das músicas que estão em alguma playlist da Ana e também do Bruno.
*/
select distinct musica.titulo 
from musica
join musica_artista on musica_artista.cod_musica = musica.cod_musica
join playlist_musica as pm1 on pm1.cod_musica = musica.cod_musica
join playlist as p1 on p1.id_playlist = pm1.id_playlist
join playlist_musica as pm2 on pm2.cod_musica = musica.cod_musica
join playlist as p2 on p2.id_playlist = pm2.id_playlist
where p1.id_usu = 10 and p2.id_usu = 11;

/*
14. Obter todas as músicas que não estão em nenhuma playlist.
*/
select titulo 
from Musica
where cod_musica not in (
  select cod_musica 
  from Playlist_Musica
);

/*
15. Obter o nome dos artistas que estão na playlist 1 ou 2, mas não em ambas.
*/
set schema 'public';
select nome
from artista
where cod_autor in (
select cod_musica
from playlist_musica
where id_playlist = 1
)
intersect
select nome
from artista
where cod_autor in (
select cod_musica
from playlist_musica
where id_playlist = 2
);
select * from playlist_musica;
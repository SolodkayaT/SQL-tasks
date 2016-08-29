-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Авг 29 2016 г., 20:04
-- Версия сервера: 5.5.25
-- Версия PHP: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `sql_task`
--

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id`, `name`) VALUES
(1, 'Home'),
(2, 'Work'),
(3, 'Friends'),
(4, 'Study');

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `status`, `project_id`) VALUES
(1, 'to see a movie', 'complited', 1),
(2, 'buy milk call Kate', 'complited', 3),
(3, 'go to the cinema', 'complited', 3),
(4, 'walk the dog', 'incomplite', 1),
(5, 'read a book', 'complited', 1),
(6, 'clean the room', 'incomplite', 1),
(7, 'write a synopsis', 'complited', 4),
(8, 'plan for the day', 'done', 2),
(9, 'make three calls', 'incomplite', 2),
(10, 'plan for the day', 'complited', 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Запрос №1
--
SELECT DISTINCT STATUS FROM tasks ORDER BY STATUS 

--
-- Запрос №2
--
SELECT projects.name AS projects_name, COUNT( * ) 
FROM tasks INNER JOIN projects ON tasks.project_id = projects.id 
GROUP BY project_id DESC

--
-- Запрос №3
--
SELECT COUNT( tasks.id ) , projects.name AS projects_name
FROM tasks
INNER JOIN projects ON tasks.project_id = projects.id
GROUP BY project_id
--
-- Запрос №4
--
SELECT * FROM tasks WHERE name LIKE  'W%'
--
-- Запрос №5
--
SELECT COUNT( tasks.id ) , projects.name AS projects_name
FROM tasks 
INNER JOIN projects ON tasks.project_id = projects.id WHERE projects.name LIKE  '%o%'
GROUP BY project_id
--
-- Запрос №6
--
SELECT name FROM tasks WHERE name IN (SELECT name FROM tasks
GROUP BY name HAVING COUNT( * ) >1)

--
-- Запрос №8
--
SELECT COUNT( 
STATUS ) >=3, projects.name AS projects_name
FROM tasks
INNER JOIN projects ON tasks.project_id = projects.id
WHERE tasks.status LIKE  'complited'
GROUP BY project_id

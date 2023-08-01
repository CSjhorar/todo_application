CREATE SCHEMA IF NOT EXISTS TODO_DATA;
create table TODO_DATA.TASK_ITEM
(
    id                        IDENTITY PRIMARY KEY ,
    title                     varchar(255) NOT NULL ,
    done                      BOOLEAN
);
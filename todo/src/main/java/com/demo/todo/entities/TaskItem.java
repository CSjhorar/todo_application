package com.demo.todo.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "TASK_ITEM", schema = "TODO_DATA")
@Getter
@Setter
public class TaskItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String title;

    private boolean done;

    public TaskItem(String title) {
        this.title = title;
        this.done = false;
    }

    public TaskItem() {

    }
}

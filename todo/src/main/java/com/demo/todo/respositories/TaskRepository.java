package com.demo.todo.respositories;

import com.demo.todo.entities.TaskItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<TaskItem,Integer> {

}

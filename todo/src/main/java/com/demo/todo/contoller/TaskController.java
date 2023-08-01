package com.demo.todo.contoller;

import com.demo.todo.entities.TaskItem;
import com.demo.todo.respositories.TaskRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/tasks")
// @CrossOrigin(origins = "http://localhost:44385")
public class TaskController {

    private final TaskRepository taskRepository;

    public TaskController(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    @GetMapping
    public List<TaskItem> getItems() {
        return taskRepository.findAll();
    }

    @PostMapping("/add")
    public TaskItem addTask(@Valid @RequestBody TaskItem taskItem) {
        return taskRepository.save(taskItem);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<String> updateTask(@PathVariable int id) {
        boolean isExist = taskRepository.existsById(id);
        if (isExist) {
            TaskItem task = taskRepository.getReferenceById(id);
            boolean done = task.isDone();
            task.setDone(!done);
            taskRepository.save(task);
            return ResponseEntity.ok("Task is updated");
        }
        return new ResponseEntity<>("Task does not exist", HttpStatus.BAD_REQUEST);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteTask(@PathVariable int id) {
        boolean isExist = taskRepository.existsById(id);
        if (isExist) {
            taskRepository.deleteById(id);
            return ResponseEntity.ok("Task is updated");

        }
        return new ResponseEntity<>("Task does not exist", HttpStatus.BAD_REQUEST);
    }
}

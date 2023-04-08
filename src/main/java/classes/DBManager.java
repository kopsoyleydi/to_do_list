package classes;

import classes.Tasks;

import java.util.ArrayList;

public class DBManager {
    public static ArrayList<Tasks> tasks = new ArrayList<>();

    private static Long id = 6L;
    static {
        tasks.add(new Tasks(1L, "Создать веб приложение на Java EE", "Yes", "2021-07-10"));
        tasks.add(new Tasks(2L, "Создать веб приложение на Java EE", "Yes", "2020-07-10"));
        tasks.add(new Tasks(3L, "Создать веб приложение на Java EE", "No", "2023-02-01"));
        tasks.add(new Tasks(4L, "Создать веб приложение на Java EE", "Yes", "2023-01-01"));
        tasks.add(new Tasks(5L, "Создать веб приложение на Java EE", "Yes", "2023-05-07"));
    }


    public static void addTask(Tasks task){
        task.setId(id);
        tasks.add(task);
        id++;
    }

    public static ArrayList<Tasks> getTasks(){
        return tasks;
    }

    public static Tasks getTask(Long id){
        for(Tasks t : tasks){
            if(t.getId() == id){
                return t;
            }
        }
        return null;
    }

    public static void deleteTask(Long id){
        for(int i = 0;i<tasks.size();i++){
            if (tasks.get(i).getId() == id){
                tasks.remove(i);
            }
        }
    }

}

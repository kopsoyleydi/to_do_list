package classes;

import classes.Tasks;

import java.util.ArrayList;

public class DBManager {
    public static ArrayList<Tasks> tasks = new ArrayList<>();

    private static Long id = 6L;
    static {
        tasks.add(new Tasks(1L, "Создать веб приложение на Java EE", "Yes", "23.10.2021"));
        tasks.add(new Tasks(2L, "Создать веб приложение на Java EE", "Yes", "23.10.2021"));
        tasks.add(new Tasks(3L, "Создать веб приложение на Java EE", "Yes", "23.10.2021"));
        tasks.add(new Tasks(4L, "Создать веб приложение на Java EE", "Yes", "23.10.2021"));
        tasks.add(new Tasks(5L, "Создать веб приложение на Java EE", "Yes", "23.10.2021"));
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
        int index = Math.toIntExact(id);
        tasks.remove(index);
    }

}

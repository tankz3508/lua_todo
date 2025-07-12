local todo_ = {};

function task_add(t, v)
    table.insert(t, v);
    print("Added Task: ", v);
end

function task_rem(t, v)
    for i, j in pairs(t) do
      if j == v then
          table.remove(t, i);
          break;
      end
  end
  print("Removed Task: ", v);
end

function save(t)
  local save_file = io.open("tasks.txt", "w");

  for i, v in pairs(t) do
      local save_file_ = io.open("tasks.txt", "w").write(save_file, v, "\n");
  end
end

function load()
    local load_file = io.open("tasks.txt", "r");

  for lines in load_file:lines() do
      table.insert(todo_, lines);
  end
end

function menu()
  load();
  print("1. Add Task");
  print("2. Remove Task");
  print("3. Save");
  print("4. Exit");
  print("----------------");
end

menu()
local choice = io.read();

if choice == "1" then
    print("What task do you wish to add? ");
    -- adds the input to the table and saves
    local task = io.read();
    task_add(todo_, task);
    save(todo_);

elseif choice == "2" then
    print("What task do you wish to remove? ");
    
    -- loops the table, checks if the input exists in the table; if so it removes, else error.
    local task = io.read();
    for i, v in pairs(todo_) do
        if v == task then 
            task_rem(todo_, v);  
            save(todo_);
            break;
        else
            print("Error: No such task found.");
            break;
        end
    end
    menu();
elseif choice == "3" then
    save(todo_);
    menu();
elseif choice == "4" then
    os.exit();
end

class Task
    attr_reader :title, :id
    attr_accessor :done


    def initialize(attributes)
      @id = attributes[:id]
      @title = attributes[:title]
      @description = attributes[:description]
      @done = attributes[:done] || false
    end


    # Create / Update
    def save
      if @id.nil?
        # 1. Create
        DB.execute(
          "INSERT INTO tasks (title, description, done) VALUES (?, ?, ?)",
          @title, @description, @done ? 1 : 0)
        @id = DB.last_insert_roxxw_id
      else
        # 2. Update
        DB.execute(
          "UPDATE tasks SET title = ?, description = ?, done = ? WHERE id = ?",
          @title, @description, @done ? 1 : 0, @id)
      end
    end


    # Read
    def self.find(id)
      result = DB.execute("SELECT * FROM tasks WHERE id = ?", id).first
      result.nil? ? nil : build_task(result)
    end


    def self.all
      DB.execute("SELECT * FROM tasks").map { |row| build_task(row) }
    end


    # Destroy
    def destroy
      DB.execute("DELETE FROM tasks WHERE id = ?", @id)
    end


    private


    def self.build_task(row)
      Task.new(
        id: row["id"],
        title: row["title"],
        description: row["description"],
        done: row["done"] == 1
      )
    end
  end

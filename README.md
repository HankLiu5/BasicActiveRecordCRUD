# BasicActiveRecordCRUD

第一步主要是利用scaffold創造出User, Profile, TodoList, TodoItem四個表單。

第二步是在assignment資料夾下的assignment.rb練習CRUD。

在create_todolist裡面，因為資料的hash.key是提供:name & :due_date，
因此必須把它轉換成:list_name & :list_due_date，以符合資料庫格式，
所以用了類似mapping的方式把key改名。

```ruby
mappings = {:name => :list_name, :due_date => :list_due_date}
params.keys.each { |k| params[ mappings[k] ] = params.delete(k) if mappings[k] }
@todolist = TodoList.create(params)
```

另外在update & delete的地方用到了DRY的概念，
直接使用get_user_byid跟get_todolist_byid來抓取資料。

最後在delete的地方有destroy跟delete可以使用
destroy在刪除row之前會先回傳row的data(稱為callback)，而delete不會callback。

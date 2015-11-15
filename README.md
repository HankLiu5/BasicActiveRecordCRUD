# Active Pack

這次的作業是接續module2的作業，但只使用todo_items來練習

1. create完之後直接回到index (todo_items_path)

2. 去除index的Edit link

3. 在_form.html.erb(partial)中加入if-condition讓completed只有在edit的時候能夠修改(default is false)

4. 在TodoItem class下加入一個class method來return completed items的數量

5. 在TodoItemsController的index method中設定一個variable儲存TodoItem.count_completed_items的return value

6. 在index加入completed todo items的數量

That's it!

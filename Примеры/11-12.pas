// 11. Алгоритм добавления элемента в линейный односвязный динамический список.
type Chain = ^Elem;

Elem = Record
Data: integer;
Next: Chain;
end;

procedure add_first(var head: chain; data: integer); // Добавление в начало
var
    curr: chain;
begin
    new(curr);
    curr^.data := data;
    curr^.next := head;
    head := curr;
end;

procedure add_latest(var head: chain; data: integer); // Добавление в конец
var
    curr: chain;
    temp: chain;
begin
    new(curr);
    curr^.data := data;
    curr^.next := nil;

    if head = nil then
    begin
        head := curr;
    end
    else
    begin
        temp := head;
        while (temp^.next <> nil) do temp := temp^.next;

        temp^.next := curr;
    end;
end;

procedure add_after_chain(prev: chain; data: integer); // Добавление поcле заданного узла
var
    curr: chain;
begin
    if prev <> nil then
    begin
        new(curr);
        curr^.data := data;
        curr^.next := prev^.next;
        prev^.next := curr;
    end;
end;


//12. Алгоритм удаления элемента из линейного односвязного динамического списка.

procedure del_first(var head: chain); // удаление первого
var
    curr: chain;
begin
    if (head <> nil) then
    begin
        curr := head;
        head := head^.next;
        dispose(curr);
    end;
end;

procedure del_latest(var head: chain); // удаление последнего
var
    curr: chain;
    prev: chain;
begin
    if head <> nil then
    begin

    if head^.next = nil then
        begin
            dispose(head);
            head := nil;
        end

    else
        begin
            prev := head;
            curr := head^.next;

            while (curr^.next <> nil) do
                begin
                    prev := curr;
                    curr := curr^.next;
                end;
            dispose(curr);
            prev^.next := nil;
        end;

    end;
end;

procedure del_data(var head: chain; data: integer); // Удаление по значению
var
    curr, temp: chain;
begin
    // Пустой список
    if head = nil then
        // ничего не делаем
    else if head^.data = data then
    begin
        // Случай 1: удаляем первый элемент
        temp := head;
        head := head^.next;
        dispose(temp);
    end
    else
    begin
        // Случай 2: ищем элемент в остальной части списка
        curr := head;
        while (curr^.next <> nil) and (curr^.next^.data <> data) do
            curr := curr^.next;
        
        // Если нашли - удаляем
        if curr^.next <> nil then
        begin
            temp := curr^.next;
            curr^.next := temp^.next;
            dispose(temp);
        end;
    end;
end;
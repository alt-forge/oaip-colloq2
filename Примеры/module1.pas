// Пример реализации модуля в языке Pascal
unit module1; // Название модуля

interface // Объявление интерфейса модуля (видимых извне элементов)
function add(a, b: Integer): Integer;

implementation // Реализация функций и процедур, объявленных в интерфейсе
function add(a, b: Integer): Integer;
begin
    Result := a + b;
end;

initialization // Код, который выполняется при загрузке модуля (необязательно)
    writeln('Module1 initialized');

finalization // Код, который выполняется при выгрузке модуля (необязательно)
    writeln('Module1 finalized');
end.
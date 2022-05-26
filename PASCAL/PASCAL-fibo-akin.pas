// https://www.codewars.com/kata/5772382d509c65de7e000982/pascal

unit kata;

interface

function LengthSupUK(n, k: Int64): Int64;
function Comp(n: Int64): Int64;
function FiboAkin(var FiboArr: array of int64): int64;

implementation

function LengthSupUK(n, k: Int64): Int64;
var
  FiboArr: array of int64;
  i, amount: int64;
begin
  if (n < 3) or (k < 3) then
  begin
    Result := -1; // 'error: N and K must be greater than 2'
    exit
  end
  else
  begin
    SetLength(FiboArr, n+1);
    FiboAkin(FiboArr);
    amount := 0;
    for i := 1 to n do
      begin
        if FiboArr[i] >= k then inc(amount);
      end;
    Result := amount;
  end;
end;


function Comp(n: Int64): Int64;
var
  FiboArr: array of int64;
  i, amount: int64;
begin
  if (n < 3) then
  begin
    Result := -1; // 'error: N must be greater than 2'
    exit
  end
  else
  begin
    SetLength(FiboArr, n+1);
    FiboAkin(FiboArr);
    amount := 0;
    for i := 2 to n do
      begin
        if FiboArr[i] < FiboArr[i-1] then inc(amount);
      end;
    Result := amount;
  end;
end;

function FiboAkin(var FiboArr: array of int64): int64;
var
  a1, a2, i, tmpResult, n: int64;
begin
  n := length(FiboArr) - 1;
    FiboArr[0] := 0;
    for i := 1 to n do
      begin
        if (i = 1) or (i = 2) then tmpResult := 1
        else
          begin
            a1 := FiboArr[i-1];
            a2 := FiboArr[i-2];
            tmpResult := FiboArr[i - a1] + FiboArr[i - a2];
          end;
        FiboArr[i] := tmpResult;
      end;
    Result := FiboArr[n];
end;

end.

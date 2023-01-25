uses GraphABC, Fractal_Module;

var
  x0, y0, x00, y00, mas, n: integer;
function KU(i:integer):integer; forward;
function KD(i:integer):integer; forward;
function KR(i:integer):integer; forward;
function KL(i:integer):integer; forward;
function per: integer; forward;

function KU( i: integer): integer;
begin
  if i > 0 then
  begin
    KR(i - 1);
    LineUP(x0, y0, mas);
    KU(i - 1);
    LineRIGHT(x0, y0, mas);
    KU(i - 1);
    LineDOWN(x0, y0, mas);
    KL(i - 1);
  end;
end;

function KD( i: integer): integer;
begin
  if i > 0 then
  begin
    KL(i - 1);
    LineDOWN(x0, y0, mas);
    KD(i - 1);
    LineLEFT(x0, y0, mas);
    KD(i - 1);
    LineUP(x0, y0, mas);
    KR(i - 1);
  end;
end;

function KL( i: integer): integer;
begin
  if i > 0 then
  begin
    KD(i - 1);
    LineLEFT(x0, y0, mas);
    KL(i - 1);
    LineDOWN(x0, y0, mas);
    KL(i - 1);
    LineRIGHT(x0, y0, mas);
    KU(i - 1);
  end;
end;

function KR( i: integer): integer;
begin
  if i > 0 then
  begin
    KU(i - 1);
    LineRIGHT(x0, y0, mas);
    KR(i - 1);
    LineUP(x0, y0, mas);
    KR(i - 1);
    LineLEFT(x0, y0, mas);
    KD(i - 1);
  end;
end;

procedure Key(key:integer);
begin
  case key of
    VK_Up : begin y00:=y00-100; per; end;
    VK_Down : begin y00:=y00+100; per; end;
    VK_Left : begin x00:=x00-100; per; end;
    VK_Right : begin x00:=x00+100; per; end;
    $BB : begin mas:=mas+2; per; end;
    $BD : begin if mas > 0 then mas:=mas-2; per; end;
    $39 : begin if n<10 then n:=n+1; per; end;
    $38 : begin if n>0 then n:=n-1; per; end;
  end;
end;

function per: integer;
begin
  var center := window.center;
    moveto(center.x - 200, center.y - 100);
  clearwindow;
  x0:=x00;
  y0:=y00;
  sleep(10);
  KU(n);
  onKeyDown:=key;
end;

begin
  n:=2;
  x00:=270;
  y00:=220;
  mas:=15;
  per
end.
Uses Crt, GraphABC;
Const
     u = 10;       {Размер}
       p = 5;
Var
   i: Integer;
Procedure LineRel(dx, dy : Integer);
Begin
     LineTo(PenX+dx, PenY+dy)
End;
 
Procedure a(i: Integer); forward;
Procedure b(i: Integer); forward;
Procedure c(i: Integer); forward;
Procedure d(i: Integer); forward;
 
Procedure a(i: Integer);
Begin
     If i > 0 Then
     Begin
          d(i - 1);
          LineRel( + u, 0);
              a(i - 1);
              LineRel(0, u);
              a(i - 1);
              LineRel(-u, 0);
              c(i - 1)
     End
End;
 
Procedure b(i: integer);
Begin
     If i > 0 Then
     Begin
          c(i - 1);
              LineRel(-u, 0);
              b(i - 1);
              LineRel(0, -u);
              b(i - 1);
              LineRel(u, 0);
              d(i - 1)
     End
End;
 
Procedure c(i: integer);
Begin
     If i > 0 Then
     Begin
          b(i - 1);
          LineRel(0, -u);
              c(i - 1);
              LineRel(-u, 0);
              c(i - 1);
              LineRel(0, u);
              a(i - 1)
     End
End;
 
Procedure d(i: integer);
Begin
     If i > 0 Then
     Begin
          a(i - 1);
              LineRel(0, u);
              d(i - 1);
              LineRel(u, 0);
              d(i - 1);
              LineRel(0, -u);
              b(i - 1)
     End
End;
{Основная программа}
Begin
     SetWindowCaption('Фракталы: Кривая Гильберта');
     SetWindowSize(500,500);
     ClearWindow;
     MoveTo(100, 100);
       a(p);
     Repeat until KeyPressed
End.
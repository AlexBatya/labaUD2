clc
fprintf('     Кафедра динамики и управления ЛА\n')
fprintf('       Управление полетом самолетов\n')
fprintf('          Лабораторная работа № 5\n')
fprintf('АВТОМАТИЧЕСКАЯ ПОСАДКА САМОЛЕТА ПО ГЛИССАДЕ\n\n')
global Kc T1c Tc KSIc Kwz Ktet V D N_of_var Teg
Teg=1;
N_of_var=0;
while N_of_var < 1 | N_of_var > 4
N_of_var=input('Введите номер варианта: ');
switch N_of_var
   case 1
      a1=1.0;
      a2=3.0;
      a3=0.8;
      a4=1.;
      a5=0.4;
      V =80;
      Kwz=0.75;
      Ktet=5.17;
      Tau1=1.786;
      Tau2=0.37;
      Ksi2=0.45;
   case 2
      a1=0.8;
      a2=3.2;
      a3=2.0;
      a4=1.;
      a5=0.2;
      V =70;
      Kwz=0.6;
      Ktet=2.34;
      Tau1=1.786;
      Tau2=0.345;
      Ksi2=0.455;
   case 3
      a1=0.75;
      a2=5.5;
      a3=4.0;
      a4=1.;
      a5=0.25;
      V =60;
      Kwz=0.68;
      Ktet=2.01;
      Tau1=1.83;
      Tau2=0.26;
      Ksi2=0.54;
   case 4
      a1=0.37;
      a2=5.88;
      a3=8.0;
      a4=1.;
      a5=0.13;
      V =90;
      Kwz=0.45;
      Ktet=1.1;
      Tau1=1.82;
      Tau2=0.25;
      Ksi2=0.57;
   otherwise
      fprintf('Задан неверный номер варианта\n')
   end
end 
Kc=-a3*a4/(a1*a4+a2);
T1c=1/a4;
Tc=1/sqrt(a1*a4+a2);
KSIc=Tc*(a1+a4+a5)/2; 
Teg=Tau1;
fprintf('Коэффициенты уравнений движения:\n')
fprintf(sprintf('a1 =%7.3f,   a4 =%7.3f\n',a1,a4))
fprintf(sprintf('a2 =%7.3f,   a5 =%7.3f\n',a2,a5))
fprintf(sprintf('a3 =%7.3f\n\n',a3))
fprintf('Коэффициенты передаточной функции:\n')
fprintf(sprintf('Kc =%7.3f,   T1c =%7.3f\n',Kc,T1c))
fprintf(sprintf('Tc =%7.3f,   KSIc=%7.3f\n\n',Tc,KSIc))
fprintf('Коэффициенты обратных связей:\n')
fprintf(sprintf('Kwz=%7.3f,   Ktet=%7.3f\n\n',Kwz,Ktet))
D=input('Задайте значение дальности D: ');
Kegmax=D/(V*Tau1);
Keg=Kegmax/4;
fprintf('\nКоэффициент усиления позиционного регулятора:\n')
fprintf(sprintf('примерное значение Keg=%7.3f, предельное значение Keg_max=%7.3f\n\n',Keg,Kegmax))
Kegforsmax=D/(V*Tau2);
Kegfors=Kegforsmax/4;
fprintf('Коэффициент усиления форсирующего регулятора:\n')
fprintf(sprintf('примерное значение Keg=%7.3f, предельное значение Keg_max=%7.3f\n',Kegfors,Kegforsmax))
fprintf(sprintf('Постоянная времени форсирующего регулятора Teg=%7.3f\n\n',Teg))
Dummy=input('Нажмите <<Enter>> для открытия модели');
open_system('posadka')



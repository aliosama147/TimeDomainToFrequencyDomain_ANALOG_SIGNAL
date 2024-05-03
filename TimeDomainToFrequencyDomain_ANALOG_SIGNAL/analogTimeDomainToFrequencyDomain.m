while(1)
clc
clear
close all

disp("Which one do you want : ")
disp("1-RectPulse")
disp("2-triPulse")
disp("3-sin wave")
disp("4-cos wave")
flag2 = input('Choose on of the above : ');

if isempty(flag2) || flag2 == 1

    
    disp("1-Default data")
    disp("2-input your values")

    flag1 = input('Choose one of the above : ');

    if isempty(flag1) || flag1 == 1

        T = 2;
        t = -2.5 : 0.0001 : 2.5;
        A = 1;
        x = A*rectpuls(t,T);
        subplot(211)
        plot(t,x,'r','Linewidth',3);
        axis([-2.5 2.5 0 1.2])
        title({'RectPulse'})
        xlabel({'Time(s)'});
        ylabel('Ampltude');
        grid
        syms t omega 
        F = int(A*exp(-1j*omega*t), t, -1, 1);
        subplot(212)
        fplot(F,'linewidth',3)
        axis([-20 20 -0.5 2])
        grid
    elseif flag1 == 2

        T = input('Enter the width of the RectPulse : ');
        ts = input('Enter the start time period : ');
        tl = input('Enter the end time period : ');
        A = input('Enter the Amplitude : ');
        t = ts : 0.0001 : tl;
        x = A*rectpuls(t,T);
        subplot(211)
        plot(t,x,'r','Linewidth',3);
        title({'RectPulse'})
        xlabel({'Time(s)'});
        ylabel('Ampltude');
        axis([ts tl -0.5 A+0.2])
        grid
        syms t omega 
        F = int(A*exp(-1j*omega*t), t, -T/2, T/2);
        subplot(212)
        fplot(F,'linewidth',3)
        axis([-20 20 -0.5 2*A])
        grid
    else 
        disp("Please Enter a valid option")
    end
    
elseif flag2 == 2

    disp("1-Default data")
    disp("2-input your values")

    flag1 = input('Choose one of the above : ');

    if isempty(flag1) || flag1 == 1

        T = 2;
        t = -2.5 : 0.0001 : 2.5;
        A = 1;
        x = A*tripuls(t,T);
        subplot(211)
        plot(t,x,'r','Linewidth',3);
        axis([-2.5 2.5 0 1.2])
        title({'triPulse'})
        xlabel({'Time(s)'});
        ylabel('Ampltude');
        grid
        syms t omega 
        F = int(A*(t+1)*exp(-2j*omega*t), t, -1, 0) + int(A*(-t+1)*exp(-2j*omega*t), t, 0, 1);
        subplot(212)
        fplot(F,'Linewidth',3)
        axis([-10 10 -0.2 A+0.2])
        grid
    elseif flag1 == 2

        T = input('Enter the width of the triPulse : ');
        ts = input('Enter the start time period : ');
        tl = input('Enter the end time period : ');
        A = input('Enter the Amplitude : ');
        t = ts : 0.0001 : tl;
        x = A*tripuls(t,T);
        subplot(211)
        plot(t,x,'r','Linewidth',3);
        title({'triPulse'})
        xlabel({'Time(s)'});
        ylabel('Ampltude');
        axis([ts tl 0 A+0.2])
        grid
        syms t omega 
        F = int(A*(t+1)*exp(-2j*omega*t), t, -T/2, 0) + int(A*(-t+1)*exp(-2j*omega*t), t, 0, T/2);
        subplot(212)
        fplot(F,'linewidth',3)
        axis([-10 10 -0.2 A+0.2])
        grid
    else 
        disp("Please Enter a valid option")
    end
elseif flag2 == 3
    disp("1-Default data")
    disp("2-input your values")

    flag1 = input('Choose one of the above : ');
    if isempty(flag1) || flag1 == 1
        t = 0 : 0.001 : 1;
        F = 1;
        A = 1;
        w = 2*pi*F;
        x = sin(w.*t);
        subplot(211)
        plot(t,x,'r','linewidth',3);
        grid
        y = fft(x);
        subplot(212)
        stem(y,'k','linewidth',2);
        grid
    elseif flag1 == 2
        ts = input('Enter the start time period : ');
        tl = input('Enter the end time period : ');
        A = input('Enter the Amplitude : ');
        t = ts : 0.001 : tl;
        F = input('Enter the frequency : ');
        w = 2*pi*F;
        x = sin(w.*t);
        subplot(211)
        plot(t,x,'r','linewidth',3)
        grid
        subplot(212)
        y = fft(x);
        stem(y,'p','linewidth',3);
        grid
    else 
    disp("Please Enter a valid option")
        
    end
elseif flag2 == 4
    disp("1-Default data")
    disp("2-input your values")

    flag1 = input('Choose one of the above : ');
    if isempty(flag1) || flag1 == 1
        t = 0 : 0.001 : 1;
        F = 1;
        A = 1;
        w = 2*pi*F;
        x = cos(w.*t);
        subplot(211)
        plot(t,x,'r','linewidth',3);
        grid
        y = fft(x);
        subplot(212)
        stem(y,'k','linewidth',2);
        grid
    elseif flag1 == 2
        ts = input('Enter the start time period : ');
        tl = input('Enter the end time period : ');
        A = input('Enter the Amplitude : ');
        t = ts : 0.001 : tl;
        F = input('Enter the frequency : ');
        w = 2*pi*F;
        x = cos(w.*t);
        subplot(211)
        plot(t,x,'r','linewidth',3)
        grid
        subplot(212)
        y = fft(x);
        stem(y,'p','linewidth',3);
        grid
    else 
    disp("Please Enter a valid option")
        
    end
else 
    disp("Please Enter a valid option")
end
flag3 = input('Press 0 to exit or 1 to continue : ');
    if isempty(flag3) || flag3 == 0
        break;
    end
end
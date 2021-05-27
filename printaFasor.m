function printaFasor(V)
    for i = 1:length(V)
        disp([num2str(abs(V(i))), ' \ ', num2str(rad2deg(angle(V(i))))])
    
end

function fasor(Z, R)
    return Z*complex(cos(R*pi/180), sin(R*pi/180))
end

function dydt = satellite_dynamics(t, y, params, torque_fun)
    arguments
        t (1, 1) double
        y (7, 1) double
        params struct
        torque_fun (1, 1) function_handle =  @(tt, yy) [0;0;0]
    end

    validateattributes(params.InertiaMatrix, {'double'}, {'size', [3,'3d']});

    omega = y(1:3);
    q = y(4:7);

    M = torque_fun(t, y);

    I = params.InertiaMatrix;
    omega_dot = I \ (M - cross(omega, I * omega));

    q = q / norm(q);
    q_dot = 0.5 * omega_mat(omega) * q;

    dydt = [omega_dot; q_dot];
end

function Om = omega_mat(w)
    wx = w(1);
    wy = w(2);
    wz = w(3);
    
    Om = [0, -wx, -wy, -wz;
         wx, 0, wz, wy;
         wy, -wz, 0, wx;
         wz, wy, -wx, 0];
end
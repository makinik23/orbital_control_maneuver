function params = satellite_params()
    params.mass = 4.0;
    params.width = 0.1;
    params.height = 0.1;
    params.depth = 0.3;

    params.InertiaX = (1/12) * params.mass * (params.height^2 + params.depth^2);
    params.InertiaY = (1/12) * params.mass * (params.width^2 + params.depth^2);
    params.InertiaZ = (1/12) * params.mass * (params.width^2 + params.height^2);

    params.InertiaMatrix = diag([params.InertiaX, params.InertiaY, params.InertiaZ]);
end

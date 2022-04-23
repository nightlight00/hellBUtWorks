randomise();

x = view_wport[0] / 2;
y = view_hport[0] * 0.75;

maxSpeed = 3.5;
shootCooldown = 0;
timeSinceLastShot = 0;

lifeMax = 50;
lifeCur = lifeMax;

immuneCur = 0;
immuneReset = 25;

grazeCur = 150;
grazeMax = 150;

specialActive = false;
specialTimer = 0;

autoAim = o_infoHandler.autoAim;
[t, preds]=size(loresstim);

sigma=10;
gaussFilter=gausswin(sigma+1);
gaussFilter = gaussFilter / sum(gaussFilter); % normalize

filteredcells=conv2(lorescells, gaussFilter); %2x25ms timestep=50ms
filteredstim=conv2(loresstim, gaussFilter); %2x25ms timestep=50ms
%durkeep=filteredtask(:,2);

clear spotinlist lorestim lorescells;
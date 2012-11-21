
%% VOTING
%Weighted averaging

ranks_high = ranks_builtin_t;
ranks_low = ranks_audio_nbt; %%sometimes contains too mentions
ranks_output = zeros(size(ranks_high));
weight_for_high = 3;
offset = 11;

%%for one example
for exy = 1:size(ranks_high,1)
    
    score_vec = zeros(10,1);
    for caty = 1:10 %% creates the scorign vector
        position_low = find(ranks_low(exy,:)==caty, 1); %%
        if isempty(position_low)
            position_low = 10
        end
        position_high = find(ranks_high(exy,:)==caty, 1);
        if isempty(position_high)
            position_high = 10
        end
        score_vec(caty) = (offset-position_low) + weight_for_high*(offset-position_high);
    end
    
    for i = 1:10 %% put together the rank order for that example based on the scoring
        %keyboard;
        [~,idx] = max(score_vec); %this returns the idx in the highest scoring vector
        ranks_output(exy,i) = idx; %index with the highest goes first
        score_vec(idx) = 0; %take this out for the next loop
    end
        %keyboard;
end
    
rankloss(ranks_output,Yt)    
rankloss(ranks_output,Yt)   
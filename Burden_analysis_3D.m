function Burden_analysis_3D()


%% Source Files (will convert ALL the .avi in the folder)
srcPath = uigetdir('Select the sequence path'); %Images Location
mkdir(srcPath, [filesep 'Results_burden']);
srcFiles = strcat(srcPath,[filesep '*.tif']);  % the folder in which ur images exists
srcFiles = dir(srcFiles);
[x,y] = size(srcFiles);

prompt = {'Burden channel'};
title = 'Parameters';
definput = {'Tau'};
answer = inputdlg(prompt,title,[1 50],definput);
Burden= answer{1};


    
    % Prepare the table for results
    Table1_combined  = cell2table(cell(0,2),'VariableNames',{'Case',strcat(Burden,'_percent_volume')});

    for Files=1:x
        
        if contains (srcFiles(Files).name, Burden)
        disp(strcat('analysing',{' '}, srcFiles(Files).name))
   
        % Load images
        BURDEN = read_stackTiff(strcat(srcPath,'/',srcFiles(Files).name));
        BURDEN = BURDEN > 0;
        
        % Get case name
        FileName=(char(srcFiles(Files).name));
        FileName=FileName (:,1:end-4);
        
        % Image Area
        Image_area=numel(BURDEN);
               
        % Percent Burden Area
        Burden_area=nnz(BURDEN);
        Percent_burden_area=(Burden_area/Image_area)*100;
        
                       
        % Create table       
        Results.(strcat(Burden,'_percent_volume'))=Percent_burden_area;
        Table1 = struct2table(Results);
        Table1.Case(:)={FileName};   
        Table1 = Table1(:,[1 2]);
        Table1_combined =vertcat(Table1,Table1_combined); 
                 
        % Save Excel export                   
        writetable (Table1_combined, (strcat(srcPath,[filesep 'Results_burden' filesep strcat(Burden,'_percent_volume.csv')])));
                 
        end  
    end                      
         disp('Done - enjoy! :)')
end




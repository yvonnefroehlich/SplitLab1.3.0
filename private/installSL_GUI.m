% function installSL_GUI

txt  = {'Thank you for choosing SplitLab :-)',' ',...
    'This program uses three externally written toolboxes:',...
    '  1) matTaup  - a seismic travel time calculator',...
    '  2) saclab   - for handling seismogram files in SAC format',' ',...
    '  3) irisFetch.m - for pulling waveforms and event metadata from the interwebs',' ',...
    ' Many thanks to their authors for providing of these programs  '};


h=dialog('Name', 'SplitLab Installation');
pos = get(h,'Position');
uicontrol('Style','text',...
    'Position',[10 pos(4)-170 pos(3)-20 150],...
    'Parent',h,...
    'String',txt);
uicontrol('Style','Pushbutton',...
    'Position',[pos(3)-100 10 60 30],...
    'Parent',h,...
    'String','Next >',...
    'Callback','assignin(''caller'',''next'',1); close(gcbf)');

%help directory
tmph = mfilename('fullpath');
 tmph = fileparts(tmph);
 helpdir = ['file:///' tmph(1:end-8) filesep 'Doc'];

 
 
load icon

%% splitlab
slab(1) = uicontrol(...
    'Parent',h,....
    'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[130 170 pos(3)-200 20],...
    'String',splitlabpath  ,...
    'Callback', 'splitlabpath=get(gcbo,''String'');');
slab(2) = uicontrol(...
    'Parent',h,...
    'Units','pixel',...
    'Style','Pushbutton',...
    'Position',[100 170 25 20],...
    'cdata', icon.folder,...
    'ToolTipString','Browse',...
    'Enable','off',...
    'Userdata',slab,...
    'Callback',['tmp2=uigetdir(''' splitlabpath ''');if isstr(tmp2), splitlabpath=tmp2;set(get(gcbo,''Userdata''), ''String'',splitlabpath);end,clear tmp*']);

%  uicontrol('parent',h,...
%  'Units','pixel',...
%      'Style','Pushbutton',...
%      'Position',[70 170 25 20],...
%      'Cdata', icon.help,...
%      'Tooltip',' See help documents',...
%      'Callback',['web ' helpdir filesep 'splitlabManual.htm -browser ;' ]);
uicontrol('Style','checkbox',...
    'Position',[30 190 200 20],...
    'Parent',h,...
    'Value',installSplitlab,...
    'String','Install Splitlab *recomended*',...
    'Userdata',slab,...
    'Enable','off',...
    'Callback','tmp = get(gcbo,''userdata''); assignin(''caller'', ''installSplitlab'', get(gcbo,''Value'')); if get(gcbo,''Value'') ,set(tmp,''Enable'',''On''); else, set(tmp,''Enable'',''Off''),end; clear tmp');


%% saclab
saclab(1) = uicontrol(...
    'Parent',h,....
    'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[130 120 pos(3)-200 20],...
    'String',saclabpath  ,...
    'Callback', 'saclabpath=get(gcbo,''String'');');
saclab(2) = uicontrol(...
    'Parent',h,...
    'Units','pixel',...
    'Style','Pushbutton',...
    'Position',[100 120 25 20],...
    'cdata', icon.folder,...
    'ToolTipString','Browse',...
    'Userdata',saclab(1),...
    'Callback',['tmp2=uigetdir(''' toolboxpath ''');if isstr(tmp2), saclabpath=tmp2;set(get(gcbo,''Userdata''), ''String'',saclabpath);end,clear tmp*']);
 uicontrol('parent',h,...
     'Units','pixel',...
     'Style','Pushbutton',...
     'Position',[70 120 25 20],...
     'Cdata', icon.help,...
     'Tooltip',' See help documents',...
     'Callback',['web ' helpdir filesep 'saclab.htm ;' ]);
uicontrol('Style','checkbox',...
    'Position',[30 140 90 20],...
    'Parent',h,...
    'Value',installSaclab,...
    'Userdata',saclab,...
    'String','Install saclab',...
    'Callback','tmp = get(gcbo,''userdata''); assignin(''caller'', ''installSaclab'', get(gcbo,''Value'')); if get(gcbo,''Value'')  ,set(tmp,''Enable'',''On''); else, set(tmp,''Enable'',''Off''),end; clear tmp');

%% mattaup
mattaup(1) = uicontrol(...
    'Parent',h,....
    'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[130 60 pos(3)-200 20],...
    'String',matpath  ,...
    'Callback', 'saclabpath=get(gcbo,''String'');');
mattaup(2) = uicontrol(...
    'Parent',h,...
    'Units','pixel',...
    'Style','Pushbutton',...
    'Position',[100 60 25 20],...
    'cdata', icon.folder,...
    'ToolTipString','Browse',...
    'Userdata',mattaup(1),...
    'Callback',['tmp2=uigetdir(''' toolboxpath ''');if isstr(tmp2), matpath=tmp2;set(get(gcbo,''Userdata''), ''String'',matpath);end,clear tmp*']);
 uicontrol('parent',h,...
     'Units','pixel',...
     'Style','Pushbutton',...
     'Position',[70 60 25 20],...
     'Cdata', icon.help,...
     'Tooltip',' See help documents',...
     'Callback',['web ' helpdir filesep 'matTaup.htm;' ]);
uicontrol('Style','checkbox',...
    'Position',[30 80 200 20],...
    'Parent',h,...
    'Value',installMatTaup,...
    'Userdata',mattaup,...
    'String','Install matTaup',...
    'Callback','tmp = get(gcbo,''userdata''); assignin(''caller'', ''installMatTaup'', get(gcbo,''Value'')); if get(gcbo,''Value''), set(tmp,''Enable'',''On''); else, set(tmp,''Enable'',''Off''),end; clear tmp');


%% Linux hints
mattaup(2) = uicontrol(...
    'Parent',h,...
    'Units','pixel',...
    'Style','text',...
     'HorizontalAlignment','center',...
     'fontweight','bold',...
    'Position',[pos(3)/2-100 250 200 20],...
    'String','Linux/Unix User ReadMe');
 uicontrol('parent',h,...
     'Units','pixel',...
     'Style','Pushbutton',...
     'Position',[pos(3)/2-15 235 25 20],...
     'Cdata', icon.help,...
     'Tooltip',' See help documents',...
     'Callback',['web ' helpdir filesep 'getdirError_LINUX.html;']);


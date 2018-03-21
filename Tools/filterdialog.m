function [f1, f2] = filterdialog(in)
% create dialogbox to input filter frequncies

% Preset filters
f1=in(1);
f2=in(2);
mpos =get(0,'PointerLocation');

% makes figure insertion box
figpos = [mpos(1)-50 mpos(2)-100 200 100];
fig = figure('WindowStyle','modal','Position',figpos,'NumberTitle','off','Name','Filter','Toolbar','None','menubar','none');

% Inserts f1 into box
hndl1 = uicontrol('Units','pixel', 'Style','edit','Parent',fig,...
    'backgroundColor','w','tooltipstring','Enter "0" for lowpass filtering',...
    'Position',[20 55 45 20], 'String', num2str(f1));
% Inserts f2 into box
hndl2 = uicontrol('Units','pixel', 'Style','edit','Parent',fig,...
    'backgroundColor','w','tooltipstring','Enter "inf" for highpass filtering',  ...
    'Position',[110 55 45 20], 'String', num2str(f2));
% Adds Hz to figure
uicontrol('Units','pixel', 'Style','text','Parent',fig,...
    'Position',[70 55 15 15], 'String', 'Hz');
uicontrol('Units','pixel', 'Style','text','Parent',fig,...
    'Position',[160 55 15 15], 'String', 'Hz');
% Adds text to figure
uicontrol('Units','pixel', 'Style','text','Parent',fig,...
    'Position',[20 75 45 15], 'String', 'from');
uicontrol('Units','pixel', 'Style','text','Parent',fig,...
    'Position',[110 75 45 15], 'String', 'to');

% retrieves what is entered
cbstr= '''f1=str2num(get(hndl1,''''string''''));  f2=str2num(get(hndl2,''''string''''));''';
uicontrol('Units','pixel', 'Style','pushbutton','Parent',fig,...
    'Position',[90 10 45 25], 'String', 'OK',...
    'callback',['evalin(''caller'',' cbstr '); close(gcbf);']);
uicontrol('Units','pixel', 'Style','pushbutton','Parent',fig,...
    'Position',[150 10 45 25], 'String', 'Cancel',...
    'callback',' close(gcbf);')
%waitforbuttonpress
%waitfor(fig)
uiwait(fig)


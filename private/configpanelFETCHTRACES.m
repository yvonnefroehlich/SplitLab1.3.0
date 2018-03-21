% Splitlab Configuration GUI helper function
    x = 15;
    y = 160;
    w = 305;
    v = 15; 
h.panel(4) = uipanel('Units','pixel','Title','Trace Parameters','FontSize',10,'Position',[130 135 425 280], 'BackgroundColor', [224   223   227]/255 );

% Button for allowing restricted data
uicontrol('Parent',h.panel(4),'Units','pixel',...
    'Style','pushbutton','FontSize',12',...
    'Position',[285 15 100 20],...
    'ToolTipString','Open dialog to add username and password for restricted data access.',...
    'String','Restricted Data',...
    'Callback','SL_addRestrictedDataParams;');

% Setup textbox for offset relative to origin
uicontrol('Parent',h.panel(4),'Units','pixel',...
        'Style','Text','FontSize',12,...
        'Position',[10 15 240 40],...
        'HorizontalAlignment','Left',...
        'ToolTipString','Requested Start Time = Origin Time + Offset Time',...
        'String','Offset between request start time and event origin [sec]:');

h.find(4) = uicontrol('Parent',h.panel(4),'Units','pixel',...
    'Style','Edit','FontSize',12,...
    'BackgroundColor','w',...
    'Position',[285 45 100 20],...
    'String', config.fetchOriginOffset,...
    'FontName','FixedWidth',...
    'Callback','config.fetchOriginOffset=get(gcbo,''String'');');
    
    
% Setup textbox for request duration
uicontrol('Parent',h.panel(4),'Units','pixel',...
        'Style','Text','FontSize',12,...
        'Position',[10 55 240 40],...
        'HorizontalAlignment','Left',...
        'String','Requested trace duration [sec]:');

h.find(5) = uicontrol('Parent',h.panel(4),'Units','pixel',...
    'Style','Edit','FontSize',12,...
    'BackgroundColor','w',...
    'Position',[285 80 100 20],...
    'String', config.fetchDuration,...
    'FontName','FixedWidth',...
    'Callback','config.fetchDuration=get(gcbo,''String'');');
    
% Text to describe the response removal options
uicontrol('Parent',h.panel(4),'Units','pixel',...
        'Style','Text','FontSize',12,...
        'Position',[10 95 240 40],...
        'HorizontalAlignment','Left',...
        'String','Response removal options:');

    
% setup popup menu for output sample rates (10, 20, 40, 100 samples per second)
uicontrol('Parent',h.panel(4),'Units','pixel',...
                'Style','Popupmenu','FontSize',12,...
                'BackgroundColor','w',...
                'Position',[255 95 160 40],...
                'String',{'No Removal','Scalar Only','Pole-Zero to Displacement','Pole-Zero to Velocity', 'Pole-Zero to Acceleration'},...
                'Value',1,...
                'ToolTipString','Select the desired output response deconvolution. Please note that the deconvolution sets a floor at 200 seconds period to avoid blowing up at long periods.',...
                'Callback',{@SL_setResponseRemoval});


% text to describe the output sample rate chooser
uicontrol('Parent',h.panel(4),'Units','pixel',...
        'Style','Text','FontSize',12,...
        'Position',[10 135 240 40],...
        'HorizontalAlignment','Left',...
        'String','Please choose the output sample rate [samples/sec]');
    
% setup popup menu for output sample rates (10, 20, 40, 100 samples per second)
uicontrol('Parent',h.panel(4),'Units','pixel',...
                'Style','Popupmenu','FontSize',12,...
                'BackgroundColor','w',...
                'Position',[255 135 160 40],...
                'String',{'1','10','20','40','100'},...
                'HorizontalAlignment','Right',...
                'Value',2,...
                'ToolTipString','Select the desired output sample rate.',...
                'Callback',{@SL_changeRequestedSampleRate});

% text to describe the channel chooser
uicontrol('Parent',h.panel(4),'Units','pixel',...
        'Style','Text','FontSize',12,...
        'Position',[10 175 240 40],...
        'HorizontalAlignment','Left',...
        'String','Please choose the set of channels to fetch:');

% Set of channels to request popup menu
uicontrol('Parent',h.panel(4),'Units','pixel',...
                'Style','Popupmenu','FontSize',12,...
                'BackgroundColor','w',...
                'Position',[255 175 160 40],...
                'String',{'BHE,BHN,BHZ', 'BH1,BH2,BHZ','HHE,HHN,HHZ','HH1,HH2,HHZ','LHE,LHN,LHZ','LH1,LH2,LHZ'},...
                'Value',1,...
                'ToolTipString','Select the appropriate channel triple for your station.',...
                'Callback',{@SL_changeRequestedChannels});
            

% text to describe the data center popupmenu
uicontrol('Parent',h.panel(4),'Units','pixel',...
        'Style','Text','FontSize',12,...
        'Position',[10 215 240 40],...
        'HorizontalAlignment','Left',...
        'String','Please choose the data center:');


% pop up menu to select server base (only know of iris and berkeley so
% far)
uicontrol('Parent',h.panel(4),'Units','pixel',...
                'Style','Popupmenu','FontSize',12,...
                'BackgroundColor','w',...
                'Position',[255 215 160 40],...
                'String',{'http://service.iris.edu', 'http://service.ncedc.org','http://service.scedc.caltech.edu'},...
                'Value',1,...
                'ToolTipString','Select the appropriate datacenter for your station.',...
                'Callback',{@SL_changeServiceDataCenter});
            
            
h.panel(5) = uipanel('Units','pixel','Title','Fetch Traces','FontSize',10,'Position',[130 5 425 120], 'BackgroundColor', [224   223   227]/255 );

% Big warning that hitting the button will take significant time
uicontrol('Parent',h.panel(5),'Units','pixel',...
                    'Style','Text','FontSize',12,'FontAngle','Italic','Position',[5 28 410 70],...
                    'String','Caution, hitting the button below will pull data from the internet and save locally as SAC files.',...
                    'ToolTipString','Consider yourself warned.');


% Button to go get waveforms!
uicontrol('Parent',h.panel(5),'Units','pixel',...
                              'Style','pushbutton', 'FontSize',12,...
                              'Position',[5 8 410 60],...
                              'FontWeight','bold', ...
                              'String', 'Fetch Traces',...
                              'ToolTipString','Push this stupidly large button to fetch data from server',...
                              'BackgroundColor',[255 203 0]/255,...
                              'Callback','SL_fetchTraces;');                        
                          
                          
                          
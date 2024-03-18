%%% DEALING WITH DIALOGUE BOXES

%answer = inputdlg(prompt,dlgtitle,fieldsize,definput,opts)specifies that the 
% dialog box is resizeable in the horizontal direction when opts is set to 
% 'on'. When opts is a structure, it specifies whether the dialog box is 
% resizeable in the horizontal direction, whether it is modal, and whether 
% the prompt text is interpreted.

prompt = {'URL for desired image', 'Desired key (non-alphabetical symbols accepted!'};
title = input;

og_img?? = inputdlg(prompt, title, fieldsize, opts.Resize = 'on', opts.WindowStyle = 'normal');
    
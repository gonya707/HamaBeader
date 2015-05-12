function r = selectCatalog(values, handles)

     if(get(handles.checkboxMatt, 'Value') == 0)
         values(values(:, 1) == 1, :) = [];
     end


     if(get(handles.checkboxTranslucent, 'Value') == 0)
         values(values(:, 1) == 2, :) = [];
     end
     if(get(handles.checkboxFluorescent, 'Value') == 0)
         values(values(:, 1) == 3, :) = [];
     end
     if(get(handles.checkboxPastel, 'Value') == 0)
         values(values(:, 1) == 5, :) = [];
     end
     if(get(handles.checkboxGlow, 'Value') == 0)
         values(values(:, 1) == 6, :) = [];
     end

     if(get(handles.checkboxMetal, 'Value') == 0)
         values(values(:, 1) == 7, :) = [];
     end

     if(get(handles.checkboxNeon, 'Value') == 0)
         values(values(:, 1) == 4, :) = [];
     end
     
     
     r = values(:, 2:4)./255;
end
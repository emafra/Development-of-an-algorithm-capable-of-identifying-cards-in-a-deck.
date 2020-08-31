% Código nipes: 
tamY = 24; % Tamanho de comparação padronizados
tamX = 21;
  % Espadas:
  
        espada = iread('espada.png', 'double');
        espada = rgb2gray(espada);
        espada1 = otsu(espada);
        espadabw = not(espada >= espada1);
        [esp_label, m, ~, cls] = ilabel(espadabw);
        prop = regionprops(esp_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(espadabw);
        for i =  1:m
            b = cls(i)
            if  50 < prop(i).ConvexArea < 900 && b ==1
             j = j+1;
             indice = i;
            end
        end
            a = prop(indice(1)).BoundingBox

            xMin = a(1)
            xMax = xMin + a(3)
            yMin = a(2)
            yMax = yMin + a(4) 
%             hold on
%             plot_box(xMin,yMin, xMax,yMax,'r')   

            espadabw = espadabw(yMin - 1: yMax, xMin -1 : xMax);
            espadabw = imresize(espadabw,[tamY,tamX]);
            
% Copas:

        copas = iread('Copas.png', 'double');
        copas = rgb2gray(copas);
        copas1 = otsu(copas);
        copasbw = not(copas >= copas1);
        [cop_label, m, ~, cls] = ilabel(copasbw);
        prop = regionprops(cop_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(copasbw);
        for i =  1:m
            b = cls(i)
            if  50 < prop(i).ConvexArea < 900 && b ==1
             j = j+1;
             indice = i;
            end
        end
            a = prop(indice(1)).BoundingBox

            xMin = a(1)
            xMax = xMin + a(3)
            yMin = a(2)
            yMax = yMin + a(4) 
%             hold on
%             plot_box(xMin,yMin, xMax,yMax,'r')   

            copasbw = copasbw(yMin - 1: yMax, xMin -1 : xMax); 
            copasbw = imresize(copasbw,[tamY,tamX]);
            
% Ouro:

        ouro = iread('ouro.png', 'double');
        ouro = rgb2gray(ouro);
        ouro1 = otsu(ouro);
        ourobw = not(ouro >= ouro1);
        [our_label, m, ~, cls] = ilabel(ourobw);
        prop = regionprops(our_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(ourobw);
        for i =  1:m
            b = cls(i)
            if  50 < prop(i).ConvexArea < 900 && b ==1
             j = j+1;
             indice = i;
            end
        end
            a = prop(indice(1)).BoundingBox

            xMin = a(1)
            xMax = xMin + a(3)
            yMin = a(2)
            yMax = yMin + a(4) 
%             hold on
%             plot_box(xMin,yMin, xMax,yMax,'r')   

            ourobw = ourobw(yMin - 1: yMax, xMin -1 : xMax); 
            ourobw = imresize(ourobw,[tamY,tamX]);

% Paus:

        paus= iread('paus.png', 'double');
        paus = rgb2gray(paus);
        paus1 = otsu(paus);
        pausbw = not(paus >= paus1);
        [pau_label, m, ~, cls] = ilabel(pausbw);
        prop = regionprops(pau_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(pausbw);
        for i =  1:m
            b = cls(i)
            if  50 < prop(i).ConvexArea < 900 && b ==1
             j = j+1;
             indice = i;
            end
        end
            a = prop(indice(1)).BoundingBox

            xMin = a(1)
            xMax = xMin + a(3)
            yMin = a(2)
            yMax = yMin + a(4) 
%             hold on
%             plot_box(xMin,yMin, xMax,yMax,'r')   

            pausbw = pausbw(yMin - 1: yMax, xMin -1 : xMax );
            pausbw = imresize(pausbw,[tamY,tamX]);
           
            
            save('espadabw');
            save('copasbw');
            save('ourobw');
            save('pausbw');

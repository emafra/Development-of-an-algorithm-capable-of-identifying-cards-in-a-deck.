 % Código nipes: 

tamY = 30;
tamX = 20;
  
  % Ás:
  
        as = iread('As.png', 'double');
        as = rgb2gray(as);
        as1 = otsu(as);
        asbw = not(as >= as1);
        [as_label, m, ~, cls] = ilabel(asbw);
        prop = regionprops(as_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(asbw);
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
%              hold on
%              plot_box(xMin,yMin, xMax,yMax,'r')   

            asbw = asbw(yMin - 1: yMax, xMin -1 : xMax);
            asbw = imresize(asbw,[tamY,tamX]);
            
% Dois:

        dois = iread('Dois.png', 'double');
        dois = rgb2gray(dois);
        dois1 = otsu(dois);
        doisbw = not(dois >= dois1);
        [cdos_label, m, ~, cls] = ilabel(doisbw);
        prop = regionprops(cdos_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(doisbw);
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
            hold on
            plot_box(xMin,yMin, xMax,yMax,'r')   

            doisbw = doisbw(yMin - 1: yMax, xMin -1 : xMax); 
            doisbw = imresize(doisbw,[tamY,tamX]);
            
% Três:

        tres = iread('Tres.png', 'double');
        tres = rgb2gray(tres);
        tres1 = otsu(tres);
        tresbw = not(tres >= tres1);
        [tre_label, m, ~, cls] = ilabel(tresbw);
        prop = regionprops(tre_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(tresbw);
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

            tresbw = tresbw(yMin - 1: yMax, xMin -1 : xMax); 
            tresbw = imresize(tresbw,[tamY,tamX]);

% Paus:

        quatro = iread('Quatro.png', 'double');
        quatro = rgb2gray(quatro);
        quatro1 = otsu(quatro);
        quatrobw = not(quatro >= quatro1);
        [qua_label, m, ~, cls] = ilabel(quatrobw);
        prop = regionprops(qua_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(quatrobw);
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

            quatrobw = quatrobw(yMin - 1: yMax, xMin -1 : xMax);
            quatrobw = imresize(quatrobw,[tamY,tamX]);

% Cinco:
  
        cinco = iread('Cinco.png', 'double');
        cinco = rgb2gray(cinco);
        cinco1 = otsu(cinco);
        cincobw = not(cinco >= cinco1);
        [cin_label, m, ~, cls] = ilabel(cincobw);
        prop = regionprops(cin_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(cincobw);
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

            cincobw = cincobw(yMin - 1: yMax, xMin -1 : xMax);
            cincobw = imresize(cincobw,[tamY,tamX]);
            
% Seis:

        seis = iread('Seis.png', 'double');
        seis = rgb2gray(seis);
        seis1 = otsu(seis);
        seisbw = not(seis >= seis1);
        [sei_label, m, ~, cls] = ilabel(seisbw);
        prop = regionprops(sei_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(seisbw);
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

            seisbw = seisbw(yMin - 1: yMax, xMin -1 : xMax); 
            seisbw = imresize(seisbw,[tamY,tamX]);
            
% Sete:

        sete = iread('Sete.png', 'double');
        sete = rgb2gray(sete);
        sete1 = otsu(sete);
        setebw = not(sete >= sete1);
        [set_label, m, ~, cls] = ilabel(setebw);
        prop = regionprops(set_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(setebw);
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

            setebw = setebw(yMin - 1: yMax, xMin -1 : xMax); 
            setebw = imresize(setebw,[tamY,tamX]);

% Paus:

        oito= iread('Oito.png', 'double');
        oito = rgb2gray(oito);
        oito1 = otsu(oito);
        oitobw = not(oito >= oito1);
        [oit_label, m, ~, cls] = ilabel(oitobw);
        prop = regionprops(oit_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(oitobw);
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

            oitobw = oitobw(yMin - 1: yMax, xMin -1 : xMax);
            oitobw = imresize(oitobw,[tamY,tamX]);
            
% Nove:
  
        nove = iread('Nove.png', 'double');
        nove = rgb2gray(nove);
        nove1 = otsu(nove);
        novebw = not(nove >= nove1);
        [nov_label, m, ~, cls] = ilabel(novebw);
        prop = regionprops(nov_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(novebw);
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

            novebw = novebw(yMin - 1: yMax, xMin -1 : xMax);
            novebw = imresize(novebw,[tamY,tamX]);
            
% J:

        valete = iread('J.png', 'double');
        valete = rgb2gray(valete);
        valete1 = otsu(valete);
        valetebw = not(valete >= valete1);
        [val_label, m, ~, cls] = ilabel(valetebw);
        prop = regionprops(val_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(valetebw);
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

            valetebw = valetebw(yMin - 1: yMax, xMin -1 : xMax); 
            valetebw = imresize(valetebw,[tamY,tamX]);
            
% K:

        rei = iread('K.png', 'double');
        rei = rgb2gray(rei);
        rei1 = otsu(rei);
        reibw = not(rei >= rei1);
        [rei_label, m, ~, cls] = ilabel(reibw);
        prop = regionprops(rei_label,'ConvexArea','BoundingBox');
        j =0;
        b = 0;
        indice = [];
        idisp(reibw);
        for i =  1:m
            b = cls(i)
            if  100 < prop(2).ConvexArea < 900 && b ==1
             j = j+1;
             indice = i;
            end
        end
            a = prop(1).BoundingBox

            xMin = a(1)
            xMax = xMin + a(3)
            yMin = a(2)
            yMax = yMin + a(4) 
            hold on
            plot_box(xMin,yMin, xMax,yMax,'r')   

            reibw = reibw(yMin - 1: yMax, xMin -1 : xMax); 
            reibw = imresize(reibw,[tamY,tamX]);

% Q:

        dama= iread('Q.png', 'double');
        dama = rgb2gray(dama);
        dama1 = otsu(dama);
        damabw = not(dama >= dama1);
        [dam_label, m, ~, cls] = ilabel(damabw);
        prop = regionprops(dam_label,'ConvexArea','BoundingBox');
        j =0;
        indice = [];
        idisp(damabw);
        for i =  1:m
            b = cls(i)
            if  50 < prop(i).ConvexArea < 900 && b ==1
             j = j+1;
             indice = i;
            end
        end
            a = prop(2).BoundingBox

            xMin = a(1)
            xMax = xMin + a(3)
            yMin = a(2)
            yMax = yMin + a(4) 
            hold on
            plot_box(xMin,yMin, xMax,yMax,'r')   

            damabw = damabw(yMin - 1 : yMax, xMin - 1 : xMax);
            damabw = imresize(damabw,[tamY,tamX]);
            
            
            save('asbw');
            save('doisbw');
            save('tresbw');
            save('quatrobw');
            save('cincobw');
            save('seisbw');
            save('setebw');
            save('oitobw');
            save('novebw');
            save('valetebw');
            save('damabw');
            save('reibw');
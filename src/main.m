clear all; clc;
close all;
warning('off');

% Referências para os naipes:
tamYa = 24;
tamXa = 21;

load('espadabw.mat');
load('copasbw.mat');
load('ourobw.mat');
load('pausbw.mat');

% Referências para os numeros (ou letras):

tamY1 = 30;
tamX1 = 20;

load('asbw');
load('doisbw');
load('tresbw');
load('quatrobw');
load('cincobw');
load('seisbw');
load('setebw');
load('oitobw');
load('novebw');
load('valetebw');
load('damabw');
load('reibw');

% Strings para os printf

 str = ["Ás","Dois","Três","Quatro","Cinco","Seis",...
 "Sete","Oito","Nove","Valete","Dama","Rei"];
str1 = ["espada","copas","ouro","paus"];  

% Inicio código:

im = iread('fig5_n3.png', 'double');
figure(); idisp(im);

tic % Inicia a contagem do tempo de processamento do código;

img = rgb2gray(im); % Converte a imagem para escala de cinza;
imbw = not((img >= 200/255)); % imagem negada;
Se = ones(2); % Máscara de suavização;
Imbw = idilate(imbw, Se); % Filtro de Suavização;
preencimento = bwconvhull(Imbw, 'objects'); % Imagem com cartas preenchidas; 
[lbl, m, ~, cls] = ilabel(preencimento); % Aplica Label nas cartas; 

%% Tratamento das cartas (uma por uma):
for p = 1:m % Laço para percCo orrer todas as cartas do baralho;

    if cls(p,1) == 1 % Verifica se é carta ou fundo;
        
Im = (lbl==p); % Tratamento da carta com label == p
%figure;idisp(Im);

% Separa as cartas: 
 [x,y] = find(Im); % Posição das cartas;
 xmin = min(x);
 xmax = max(x);
 ymin = min(y);
 ymax = max(y);
 % Corte na imagem contendo apenas as cartas: 
 ibw = Im(xmin: xmax,ymin : ymax); % Carta preto e branco;
 irgb = im(xmin: xmax,ymin : ymax, :); % Carta RGB;
  
 exp =100; % Padroniza margem de cada carta;
 
 % Carta para extrair os corners:
 Inova = double(zeros(size(ibw,1) + exp, size(ibw,2) + exp));
 Inova(exp/2: exp/2 + size(ibw,1) - 1, exp/2 : exp/2 + size(ibw,2) - 1) = ibw;
 
 % Carta onde é realizada a homografia:
 InRGB = double(ones(size(irgb,1) + exp, size(irgb,2) + exp, 3));
 InRGB(exp/2 : exp/2  + size(irgb,1) - 1, exp/2 : exp/2 + size(irgb,2) - 1, :) = irgb;
 
edges = icanny(Inova); % Filtro de detecção de bordas;
Inova = bwconvhull(edges); % realiza precimento da imagem ;
edges = icanny(double(Inova)); % filtro de detecção de bordas;

Se = ones(3);
edges = idilate(edges, Se); % Engrossar as bordas para utilizar a 
% transformada Hough;
I2 = edges; 
h = Hough(edges,'suppress',10); 
linhas = h.lines(); % linhas de perpsctiva; 
% hold on;
% linhas.plot; 
linhas2 = linhas.seglength(I2); % linhas de perpsctiva (com informação adicional);
% figure();idisp(InRGB);
% linhas2.plot('g');

%% Obtenção dos corners:
[m,n]  = size(linhas2);
k = 0;
a = 0;
for i = 1:n
    for j = i+1:n
        k=k+1;
        u(k) = ((linhas2(i).rho/cos(linhas2(i).theta)) - ...
        (linhas2(j).rho/cos(linhas2(j).theta)))/...
            (tan(linhas2(i).theta)-tan(linhas2(j).theta));
        v(k) = -u(k)*tan(linhas2(j).theta) + ...
        (linhas2(j).rho/cos(linhas2(j).theta));       
        if u(k)>0 && v(k)>0 && u(k)<1000 && v(k)<1000
            a=a+1;
            M(a,1)=u(k); % Pontos de interseção;
            M(a,2)=v(k);
        end
    end
end
%% Ordenando os cornes:

M = sortrows(M,2); % Ordena pontos do menor v para o maior v.
% portanto M(1,1) será o ponto mais acima (basta saber se esta na esquerda
% ou na direita).

m00 = mpq(Inova, 0, 0);
m10 = mpq(Inova, 1, 0);
m01 = mpq(Inova, 0, 1);
centro = [m10/m00, m01/m00]; % Centroide da carta;

j=0;
for i = 2:size(M,1) % Percorre os outros 3 corners;
    if M(i,2)<centro(2) % Procura o outro ponto acima do centroide;
        if M(1,1)<M(i,1)
            conjunto1 = [M(1,1),M(1,2);M(i,1),M(i,2)];
        end
        if M(1,1)>M(i,1)
            conjunto1 = [M(i,1),M(i,2);M(1,1),M(1,2)];
        end
    else
        j = j+1;
        baixo(j) = i;  % Pontos restante são os ponto de baixo.           
    end
end

    if M(baixo(1),1) < M(baixo(2),1) % Verifica entre os pontos de baixo 
        % qual é o da esquerda e o da direita.
        conjunto2 = [M(baixo(1),1),M(baixo(1),2);M(baixo(2),1),M(baixo(2),2)];
    end
    if M(baixo(1),1) > M(baixo(2),1)
        conjunto2 = [M(baixo(2),1),M(baixo(2),2);M(baixo(1),1),M(baixo(1),2)];
    end
    
    % Verifica se a distância entre os pontos de cima são maiores que a
    % distância entre o primeiro ponto e o ponto de baixo da esquerda (caso
    % a resposta seja verdadeira, uma inversão nos corners será feita):
    if norm(conjunto1(1,:) - conjunto1(2,:)) > norm(conjunto1(1,:) - conjunto2(1,:))
      novo = conjunto1(1,:);
      conjunto1(1,:) = conjunto1(2,:);
      conjunto1(2,:) = conjunto2(2,:);
      conjunto2(2,:) = conjunto2(1,:);
      conjunto2(1,:) = novo;
    end

%% Realiza a Homografia: 
    B(1,:) = conjunto1(1,:); % Conjuntos atribuidos a uma matriz B.
    B(2,:) = conjunto1(2,:);
    B(3,:) = conjunto2(1,:);
    B(4,:) = conjunto2(2,:);

x1=[B(4,1);B(3,1);B(2,1);B(1,1)];% Pontos para a realização da homografia 
y1=[B(4,2);B(3,2);B(2,2);B(1,2)];

% Padroniza o tamanho das imagens após a homografia:
dimX = 260;
dimY = dimX*0.70;
x2 = [1; dimY; 1; dimY];
y2 = [1;     1; dimX; dimX];

% Realiza a homografia das imagens:
T = fitgeotrans([x1 y1], [x2 y2], 'projective');
Im2= imwarp(InRGB,T,'OutputView',imref2d(size(InRGB)));

%% Seção de Detecção:

corte = Im2(16: 80, 7 : 35,:); % Corte nas imagem após a homografia;
corte1 = rgb2gray(corte);
corte2 = otsu(corte1); % Suaviza a imagem
cortebw = not(corte1 >= corte2);
[im_label, m, ~, cls1] = ilabel(cortebw); % Aplica labels aos objetos 
% encontrados no corte;

prop = regionprops(im_label,'Area','BoundingBox'); % Extrai propriedades dos objetos 
% encontrados.

indice=[];
j = 0;
for i = 1:m
    a = prop(i).Area;
    b = cls1(i);
    if a > 100 && a < 500 && b==1
        j = j+1;
        indice(j) = i; % Seleciona apenas o numero (ou letra) e o naipe.
    end
end
% idisp(cortebw)

if size(indice,2) == 3 % É a carta 10;
               
        a = prop(indice(3)).BoundingBox; % Tratamento do naipe.

        xMin = a(1);
        xMax = xMin + a(3);
        yMin = a(2);
        yMax = yMin + a(4);

%         hold on
%         plot_box(xMin,yMin, xMax,yMax,'b')

        % Recorta apenas o naipe e padroniza ele com o mesmo tamanho da
        % referência:
        naipe = cortebw(yMin - 1 : yMax, xMin - 1 : xMax);
        naipe = imresize(naipe,[tamYa,tamXa]);

            % Template Matching (SAD):
            
            n1 = [];
            n1(1) = sum((sum(sum((naipe(:,:) - espadabw(:,:)).^2))));
            n1(2) = sum((sum(sum((naipe(:,:) - copasbw(:,:)).^2))));
            n1(3) = sum((sum(sum((naipe(:,:) - ourobw(:,:)).^2))));
            n1(4) = sum((sum(sum((naipe(:,:) - pausbw(:,:)).^2))));

            i = find(n1 == min(n1)); % Menor valor será o naipe correto;
            
            fprintf('10 de %s \n',str1(i)); % Print mensagem.      
            
else % Não é a carta 10;
       
        a = prop(indice(2)).BoundingBox; % Tratamento naipe;

        xMin = a(1);
        xMax = xMin + a(3);
        yMin = a(2);
        yMax = yMin + a(4); 

%         hold on
%         plot_box(xMin,yMin, xMax,yMax,'b')

        % Recorta apenas o naipe e padroniza ele com o mesmo tamanho da
        % referência:
        naipe = cortebw(yMin - 1 : yMax, xMin - 1 : xMax);
        naipe = imresize(naipe,[tamYa,tamXa]);

       
            % Template Matching (SAD):

            n2 = [];
            n2(1) = sum((sum(sum((naipe(:,:) - espadabw(:,:)).^2))));
            n2(2) = sum((sum(sum((naipe(:,:) - copasbw(:,:)).^2))));
            n2(3) = sum((sum(sum((naipe(:,:) - ourobw(:,:)).^2))));
            n2(4) = sum((sum(sum((naipe(:,:) - pausbw(:,:)).^2))));
            
            n = find(n2 == min(n2)); % Menor valor será o naipe correto;

% Detecção do numero (ou letra):           
        
        a = prop(indice(1)).BoundingBox; % Tratamento numero (ou letra);

        xMin = a(1);
        xMax = xMin + a(3);
        yMin = a(2);
        yMax = yMin + a(4) ;

%         hold on
%         plot_box(xMin,yMin, xMax,yMax,'b')

        % Recorta apenas o numero e padroniza ele com o mesmo tamanho da
        % referência:
        number = cortebw(yMin - 1 : yMax, xMin - 1 : xMax );
        number = imresize(number,[tamY1,tamX1]);
            
        % Template Matching (SAD):
            num = [];
            num(1) = sum((sum(sum((number(:,:) - asbw(:,:)).^2))));
            num(2) = sum((sum(sum((number(:,:) - doisbw(:,:)).^2))));
            num(3) = sum((sum(sum((number(:,:) - tresbw(:,:)).^2))));
            num(4) = sum((sum(sum((number(:,:) - quatrobw(:,:)).^2))));
            num(5) = sum((sum(sum((number(:,:) - cincobw(:,:)).^2))));
            num(6) = sum((sum(sum((number(:,:) - seisbw(:,:)).^2))));
            num(7) = sum((sum(sum((number(:,:) - setebw(:,:)).^2))));
            num(8) = sum((sum(sum((number(:,:) - oitobw(:,:)).^2))));
            num(9) = sum((sum(sum((number(:,:) - novebw(:,:)).^2))));
            num(10) = sum((sum(sum((number(:,:) - valetebw(:,:)).^2))));
            num(11) = sum((sum(sum((number(:,:) - damabw(:,:)).^2))));
            num(12) = sum((sum(sum((number(:,:) - reibw(:,:)).^2))));
            
            i = find(num == min(num));
            
            % Printa o nome da carta:          
                    
            fprintf('%s de %s \n',str(i),str1(n));          
   
            
end
        end
end
toc
%==================================================
%% HTU-thesis-grd.cls for HTUThesis
%%==================================================

\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs}
\RequirePackage{graphicx,float}
\RequirePackage{setspace}   %设置行间距离
\RequirePackage{upgreek}    %直立希腊字母字体
\RequirePackage{makecell}

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{HTU-thesis-grd}[2023/12/03 v1.2 HTU-thesis-grd document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifBIT@master\BIT@masterfalse
\newif\ifBIT@doctor\BIT@doctorfalse
\newif\ifBIT@istwoside\BIT@istwosidefalse
\DeclareOption{twoside}{\BIT@istwosidetrue}
\DeclareOption{master}{\BIT@mastertrue}
\DeclareOption{doctor}{\BIT@doctortrue}

\ProcessOptions\relax
\ifBIT@istwoside
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto]{ctexbook}
\fi

%% the setup of ctex package
\def\contentsname{目\quad 录}
\def\listfigurename{插图索引}
\def\listtablename{表格索引}

%% 中文封面标题
%\def\BIT@label@classification{中图分类号}
\def\BIT@label@classification{分~~类~~号}
%\def\BIT@label@confidential{密~~~~级}
\def\BIT@label@confidential{学~~~~~~~~号}
\def\BIT@label@UDC{UDC分类号}
\def\BIT@label@serialnumber{编号}
\def\BIT@label@institutenumber{单位代码}
\def\BIT@label@thesis{学位论文}
\def\BIT@label@major{专{\kern 3.2pt}业{\kern 3.2pt}学{\kern 3.2pt}位{\kern 3.2pt}领 {\kern 3.2pt}域{\kern 10pt}：}
\def\BIT@label@title{}

%\def\BIT@label@studentnumber{学~~~~~~~~~~~~~~~~~~~~号{\kern 10pt}：}
\def\BIT@label@author{申~~~~~~~~请~~~~~~~~人{\kern 10pt}：}
\def\BIT@label@advisor{指~~~~导~~~~教~~~~师{\kern 10pt}：}

\def\BIT@label@degree{专{\kern 3.2pt}业{\kern 3.2pt}学{\kern 3.2pt}位{\kern 3.2pt}类 {\kern 3.2pt}别{\kern 10pt}：}
\def\BIT@label@submitdate{论文提交日期}
%\def\BIT@label@defenddate{{\kern 10pt}}
\def\BIT@label@defenddate{}
\def\BIT@label@institute{学~~~~院~~~~名~~~~称}
\def\BIT@label@interest{研~~~~究~~~~方~~~~向}
\def\BIT@label@school{申{\kern 2.4pt}请{\kern 2.4pt}学{\kern 2.4pt}位{\kern 2.4pt}类{\kern 2.4pt}别{\kern 10pt}：}

%% 中文封面内容
\def\BIT@value@classification{}
\def\BIT@value@confidential@confidential{}
\def\BIT@value@UDC{}
\def\BIT@value@serialnumber{}
\def\BIT@value@institutenumber{}
\def\BIT@value@school{}
\def\BIT@value@degree{}
\def\BIT@value@title{~~~~~（论~文~题~目）~~~~~}
\def\BIT@value@titlemark{\BIT@value@title}
\def\BIT@value@author{（姓~名）}
\def\BIT@value@advisor{（姓名、专业技术职务、学位）}
\def\BIT@value@advisorinstitute{（单位）}
\def\BIT@value@major{}
\def\BIT@value@interest{}
%\def\BIT@value@studentnumber{}
\def\BIT@value@submitdate{}
\def\BIT@value@defenddate{}
\def\BIT@value@institute{}
\def\BIT@value@chairman{}
\def\BIT@label@statement{}

%% 设置圆圈的格式 或使用\textcircled
\usepackage{tikz}
\usepackage{etoolbox}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep = 1pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}

%% 论文原创性声明
\def\BIT@label@original{\textbf{独{\kern 10pt}创{\kern 10pt}性{\kern 10pt}声{\kern 10pt}明}}
\def\BIT@label@authorization{\textbf{关于论文使用授权的说明}}
%\def\BIT@label@underfraduatenumber{研究生学号}：
\def\BIT@label@authorsign{作者签名：}
\def\BIT@label@Supervisorsign{导师签名：}
\def\BIT@label@originalDate{日期：}
\def\BIT@label@originalcontent{\BITspace\BITspace\zihao{-4} 本人郑重声明：所呈交的学位论文是我个人在导师
指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其
他人已经发表或撰写的研究成果，也不包含为获得河南师范大学或其它教育机构的学位或证书而使用过的材料。
与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。}
\def\BIT@label@authorizationcontent{\BITspace\BITspace 本人完全了解河南师范大学有关保留、使用学位论文的规定，即：有权保留并向国家有关部门或机构送论文的复印件和磁盘，允许论文被查阅和借阅。本人授权河南师范大学可以将学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。\textbf{（保密的学位论文在解密后适用本授权书）} }

%% 英语封面标题
\def\BIT@label@englishadvisor{Supervisor:}
\def\BIT@label@englishstatement{Submitted in total fulfilment
  of the requirements for the degree of \BIT@value@englishdegree \\
  in \BIT@value@englishmajor}
\def\BIT@label@englishauthor{Candidate Name:}
\def\BIT@label@englishadvisor{Faculty Mentor:}
\def\BIT@label@englishchairman{Chair, Thesis Committee:}
\def\BIT@label@englishinstitute{School or Department:}
\def\BIT@label@englishdegree{Degree Applied:}
\def\BIT@label@englishmajor{Major:}
\def\BIT@label@englishschool{Degree by:}
\def\BIT@label@englishdate{The Date of Defence:}

%% 英语封面内容
\def\BIT@value@englishtitle{(English Title of Thesis)}
\def\BIT@value@englishauthor{(Author Name)}
\def\BIT@value@englishadvisor{(Supervisor Name)}
\def\BIT@value@englishinstitute{(Institute Name)}
\def\BIT@value@englishscholl{(BIT)}
\def\BIT@value@englishchair{(someone)}
\def\BIT@value@englishdate{}
\def\BIT@value@englishdegree{}
\def\BIT@value@englishmajor{}

%%其他特殊含义的标签说明
\def\BIT@label@abstract{摘要}
\def\BIT@label@englishabstract{Abstract}
\def\BIT@label@keywords{关键词：}
\def\BIT@label@englishkeywords{Key Words:~}
\def\BIT@label@conclusion{结论}
\def\BIT@label@appendix{附录}
\def\BIT@label@publications{攻读硕士学位期间发表的学术论文}
\def\BIT@label@projects{攻读硕士学位期间参与的科研项目}
\def\BIT@label@resume{作者简介}     %博士学位论文用到
\def\BIT@label@reference{参考文献！！！！}
\def\BIT@label@thanks{致~~谢}
\def\BIT@value@templateversion{v1.2}

%% label in the head 页眉页脚
\def\BIT@label@headschoolname{河南师范大学硕士学位论文}

%% 当前模板的版本
\newcommand{\version}{\BIT@value@templateversion}

%%==============引用geometry 宏包设置纸张和页面========================
%设置版面:上3cm，下2.5cm，左2.5cm，右2.5cm，页眉2.2cm，页脚1.75cm，装订线0cm
\usepackage[%
paper=a4paper,%纸张采用A4纸
top=3cm,% 上 3cm %
bottom=2.5cm,% 下 2.5cm %
left=2.5cm,% 左 2.5cm %
right=2.5cm,% 右 2.5cm %
headheight=2.2cm,% 页眉 2.2cm %
footskip=1.75cm% 没用页脚,将正文底部到页脚底部的距离 0cm %
]{geometry} % 页面设置 %
%% =================================================================

\parskip 0.5ex plus 0.25ex minus 0.25ex    %段落间距离,ex表示小写字母x的高度
%% Command -- Clear Double Page
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%设置行距，大概为22pt/磅对应
\RequirePackage{setspace}
\setstretch{1.523}

%% 设置章节格式, 宋体小二号加粗居中，行距22磅，与正文或节标题的间距设定为段后间距1行。章序号与章名间空一格。
\ctexset{chapter={
      name = {{第},{章}},
      number = {\chinese{chapter}},
      format = {\centering \bfseries \songti \zihao{-2}},
      %format = {\centering \bfseries \songti \zihao{-2}},
      %format = {\bfseries \sffamily \centering \zihao{3}},
      pagestyle = {BIT@headings},
      beforeskip = 16 bp,
      afterskip = 32 bp,
      fixskip = true,
  }
}
%% 设置一级章节格式， 宋体小三号加粗顶左，行距22磅，与上一节的间距为1行，与下面正文或节标题的段间间距为0.5行。序号与题目间空一格。
\ctexset{section={
  format={\raggedright \bfseries \songti \zihao{-3}},
  %format={\raggedright \bfseries \sffamily \zihao{4}},
  beforeskip = 28bp plus 1ex minus .2ex,
  afterskip = 24bp plus .2ex,
  fixskip = true,
  }
}
%% 设置二级标题格式， 黑体四顶左，行距22磅，与上一节的间距为1行，与下面正文或节标题的段间间距为0.5行。序号与题目间空一格。
\ctexset{subsection={
   format = {\raggedright \heiti \zihao{4}},
   %format = {\raggedright \bfseries \songti \zihao{4}},
   beforeskip =28bp plus 1ex minus .2ex,
   afterskip = 24bp plus .2ex,
   fixskip = true,
   }
}
%% 设置三节标题格式
\ctexset{subsubsection={
      format={\raggedright \heiti \zihao{-4}},
      beforeskip=28bp plus 1ex minus .2ex,
      afterskip=24bp plus .2ex,
      fixskip=true,
  }
}

%% 设定目录格式。目录颜色更改黑色
\addtocontents{toc}{\protect\hypersetup{hidelinks}}      % 目录的格式
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\bfseries \heiti \zihao{5}}
    {\bfseries \heiti \thecontentslabel\hspace{\ccwd}}{}     %{\bf}  粗体
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[2\ccwd]{\songti \zihao{5}}
    { \songti \thecontentslabel\hspace{\ccwd}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4\ccwd]{\songti \zihao{5}}
    {\thecontentslabel\hspace{\ccwd}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{figure}[0pt]{\songti\zihao{5}}                                 % 图标索引的格式
    {\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
    {\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{table}[0pt]{\songti\zihao{5}}
    {\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}                     % 表格索引的格式
    {\hspace{.5em}\titlerule*{.}\contentspage}

%% 选择编译
\RequirePackage{ifthen}

%% check pdfTeX mode
\RequirePackage{ifpdf}

%% fancyhdr宏包-页眉页脚控制
\RequirePackage{fancyhdr}

%% 空 页眉页脚
\fancypagestyle{BIT@empty}{%
  \fancyhf{}}

%======正文页眉页脚=================
\fancypagestyle{BIT@headings}{
  \fancyhf{}
  \fancyfoot[LE]{\songti\zihao{5} \thepage}
  \fancyfoot[RO]{\songti\zihao{5} \thepage}
  \fancyhead[CE]{\songti\zihao{5} {\BIT@value@title}}       %页眉左边设置为论文标题
  \fancyhead[CO]{\songti\zihao{5} \leftmark}     %页眉右边设置为章节标题
  %\fancyhead[L]{\ifBIT@master\zihao{5}{\songti 河南师范大学硕士研究生学位论文}     %页眉左边设置为headschoolname
    %            \else\zihao{5}{\songti 河南师范大学硕士研究生学位论文}\fi}
  %\fancyhead[L]{\ifBIT@master\zihao{5}{\songti 河南师范大学硕士研究生学位论文}     %页眉左边设置为headschoolname
  %              \else\zihao{5}{\songti 河南师范大学硕士研究生学位论文}\fi}
}

%==================对于openright 选项，必须保证章页右开，且如果前章末页内容须清空其页眉页脚。===================
\let\BIT@cleardoublepage\cleardoublepage
\newcommand{\BIT@clearemptydoublepage}{%
	\clearpage{\pagestyle{BIT@empty}\BIT@cleardoublepage}}
\let\cleardoublepage\BIT@clearemptydoublepage

%================修该frontmatter 的页码为大写罗马格式，并调整页面风格===============
\renewcommand{\frontmatter}{
 \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{BIT@empty}
}
%=======================修改mainmatter 的页码为阿拉伯格式，并调整页面风格========================
\renewcommand{\mainmatter}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{BIT@headings}
}


%% 复杂表格
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}


%% 定义几个常用的数学常量符号
\newcommand{\me}{\mathrm{e}} %定义 对数常数e，虚数符号i,j以及微分算子d为直立体。
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\,\mathrm{d}}

\theoremstyle{plain}
  \newtheorem{algo}{算法~}[chapter]
  \newtheorem{thm}{定理~}[chapter]
  \newtheorem{lem}[thm]{引理~}
  \newtheorem{prop}[thm]{命题~}
  \newtheorem{cor}[thm]{推论~}
\theoremstyle{definition}
  \newtheorem{defn}{定义~}[chapter]
  \newtheorem{conj}{猜想~}[chapter]
  \newtheorem{exmp}{例~}[chapter]
  \newtheorem{rem}{注~}
  \newtheorem{case}{情形~}
\renewcommand{\proofname}{\bf 证明}

%% 英文字体默认使用 Times New Roman
\RequirePackage{xltxtra} % \XeTeX Logo
\setmainfont{Times New Roman}   % 衬线字体
\setsansfont{Arial}             % 无衬线字体
\setmonofont{Courier New}       % 等宽字体，一般是打印字体
%% 中文字体默认使用宋体
%\setCJKmainfont{songti}
\setCJKfamilyfont{hwxk}{STXingkai} %设置字体华文行楷
\newcommand{\stxk}{\CJKfamily{hwxk}}
\setCJKfamilyfont{zhsong}[AutoFakeBold = {2.17}]{SimSun} %设置字体华文行楷
\renewcommand{\songti}{\CJKfamily{zhsong}}

%% graphics packages
\RequirePackage{graphicx}
%% 并列子图
\RequirePackage{subfigure}

\RequirePackage{wrapfig}
%%===========================设置图表标题选项==========================
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\zihao{5}}
\captionsetup{
  font = {fontsize},
  labelsep = zhspace,
}
\captionsetup[table]{
  position = top,
  aboveskip = 6bp,
  belowskip = 6bp,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
  position = bottom,
  aboveskip = 6bp,
  belowskip = 6bp,
}

%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
% ccaption -- bicaption
%\RequirePackage{ccaption}
%\captiondelim{\ }
%\captionnamefont{\songti\zihao{5}}
%\captiontitlefont{\songti\zihao{5}}


%% sort and compress citations
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}


% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


% 定公式、图、表编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}

% 颜色宏包
\RequirePackage{xcolor}


% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% listings 源代码显示宏包
\RequirePackage{listings}
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle=\footnotesize, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头


%% hyperref package
\definecolor{navyblue}{RGB}{0,0,128}
\RequirePackage{hyperref}
\hypersetup{
  bookmarksnumbered,%
  linktoc=all,
  colorlinks=true,
  citecolor=navyblue,
  filecolor=cyan,
  linkcolor=navyblue,
  linkbordercolor=navyblue,
  urlcolor=navyblue,
  plainpages=false,%
  pdfstartview=FitH
}

%% enumerate 列表环境间距调节
\usepackage{enumitem}
% \setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
% \setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
% \setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}

%_  参考文献风格 
\bibliographystyle{GBT7714-2005NLang}

%_ BITspace
%\newcommand\BITspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\newcommand{\BITspace}[1][1]{\hspace{#1\ccwd}}

\def\BIT@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\BITfiledate{#1}%
  \def\BITfileversion{#2}%
  \def\BITfileinfo{#3}}%
\expandafter\ifx\csname ver@bitmaster-xetex.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_bitmaster-xetex.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@bitmaster-xetex.cls\endcsname}
\fi
\expandafter\BIT@getfileinfo\reserved@a\relax? ? \relax\relax
\def\BIT@underline[#1]#2{%
  \underline{\hbox to #1{\hfill#2\hfill}}}
\def\BITunderline{\@ifnextchar[\BIT@underline\underline}

%%%%中文标题页的可用命令
\newcommand\classification[1]{\def\BIT@value@classification{#1}}
%\newcommand\studentnumber[1]{\def\BIT@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\BIT@value@confidential{#1}}
\newcommand\UDC[1]{\def\BIT@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\BIT@value@serialnumber{#1}}
\newcommand\institutenumber[1]{\def\BIT@value@institutenumber{#1}}
\newcommand\school[1]{\def\BIT@value@school{#1}}
\newcommand\degree[1]{\def\BIT@value@degree{#1}}
\renewcommand\title[2][\BIT@value@title]{%
  \def\BIT@value@title{#2}
  \def\BIT@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\BIT@value@author{#1}}
\newcommand\advisor[1]{\def\BIT@value@advisor{#1}}
\newcommand\advisorinstitute[1]{\def\BIT@value@advisorinstitute{#1}}
\newcommand\major[1]{\def\BIT@value@major{#1}}
\newcommand\submitdate[1]{\def\BIT@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\BIT@value@defenddate{#1}}
\newcommand\institute[1]{\def\BIT@value@institute{#1}}
\newcommand\interest[1]{\def\BIT@value@interest{#1}}


%% 第一页和第二页
%% “绘制”中文标题页
\renewcommand\maketitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{60mm}
    {\heiti\zihao{-2} \BIT@value@title}
    \vskip 40mm
    {\heiti \zihao{-3} \BIT@value@author} %黑体 小三
     \vskip 4mm
    {\heiti \zihao{-3} \BIT@value@defenddate} %黑体 小三
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
 }

\newcommand\makeInfo[1]%
 {
  \newpage
  \cleardoublepage
  \thispagestyle{empty}

%udc ltz
\begin{flushleft}
  \begin{tabular}{|c|c|}
    \hline
    {\songti \zihao{-4} \noindent \BIT@label@institutenumber} & \BIT@value@institutenumber \\
    \hline
    {\songti \zihao{-4} \BIT@label@confidential} & \BIT@value@confidential \\
    \hline
    {\songti \zihao{-4} \BIT@label@classification} & \BIT@value@classification \\
    \hline
  \end{tabular}
\end{flushleft}

%{ %
%  {\songti \zihao{-4} \noindent \BIT@label@institutenumber} \BITunderline[60pt] \BIT@value@institutenumber ~
%  {\songti \zihao{-4} \BIT@label@confidential} \BITunderline[60pt] \BIT@value@confidential
%}
    \vskip \stretch{0.1}
    \begin{figure}[H]
    \centering
        \includegraphics[width=0.6\textwidth]{coverfig/f1}
    \end{figure}
    \begin{center}
      {\songti \zihao{0} \pmb{ 硕~~士~~学~~位~~论~~文}}
    \end{center}
    %\begin{figure}[H]
   % \centering
    %    \includegraphics[width=0.15\textwidth]{coverfig/f2}
    %\end{figure}

   \begin{center}{
    \vskip \stretch{0.5}
       %{\songti\zihao{-2} \BIT@value@title}
       {\heiti\zihao{-2}\textbf \BIT@label@title {\BIT@value@title}}   %修改标题长度
    \vskip \stretch{0.5}

    {\fangsong\zihao{4}}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}

	%黑体 小三
    {\heiti\zihao{4}
    \begin{spacing}{1.5}
     \begin{tabular}{l p{3mm} l}
     % \BIT@label@studentnumber & & \BITunderline[180pt]{\songti\zihao{3} \BIT@value@studentnumber}

    \\
     {\heiti\zihao{-3}  \BIT@label@major} & & {\heiti\zihao{-3} \BIT@value@major}
    \\
    %{\heiti\zihao{-3}   \BIT@label@interest } & & {\heiti\zihao{-3} \BIT@value@interest}
     {\heiti\zihao{-3}  \BIT@label@degree} & &{\heiti\zihao{-3} \BIT@value@degree}
    \\
     {\heiti\zihao{-3}  \BIT@label@author }& & {\heiti\zihao{-3} \BIT@value@author}
    \\
     {\heiti\zihao{-3}  \BIT@label@advisor }& & {\heiti\zihao{-3} \BIT@value@advisor}
    \\
\\
       %{\heiti\zihao{-3}  \BIT@label@defenddate} & & {\heiti\zihao{-3} \BIT@value@defenddate}

     \end{tabular}
    \end{spacing}}

    {\heiti\zihao{-3} \BIT@value@defenddate}


    }
  \end{center}



  %\vskip \stretch{0.5}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

% English Title Page
% 英文标题页可用命令
\newcommand\englishtitle[1]{\def\BIT@value@englishtitle{\textbf{#1}}}
\newcommand\englishauthor[1]{\def\BIT@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\BIT@value@englishadvisor{#1}}
\newcommand\englishschool[1]{\def\BIT@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\BIT@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\BIT@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\BIT@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\BIT@value@englishmajor{#1}}
\newcommand\englishchairman[1]{\def\BIT@value@englishchairman{#1}}

% "绘制"英文标题页
\newcommand\makeEnglishInfo[1]{%
  \cleardoublepage
  \thispagestyle{empty}

   \begin{center}


   \vspace*{5em}
   %\vskip \stretch{0.5}
    %论文题目	  Times New Roman 二 加粗
   {\zihao{2}\rm{\BIT@value@englishtitle}}
   %\bfseries
   \vskip \stretch{0.5}
   \begin{spacing}{1.5}{
   {\zihao{-2}{A Dissertation Submitted to \\
   the Graduate School of Henan Normal University \\
in Partial Fulfillment of the Requirements\\
for the Degree of \\
   Master of Engineering \\}}}
   \end{spacing}
   \vskip \stretch{0.5}
   %\begin{figure}[H]
    %\centering
     %   \includegraphics[width=0.15\textwidth]{coverfig/f2}
   %\end{figure}

    \vskip \stretch{0.5}
    % Times New Roman 三
   \begin{spacing}{1.5}
   {\zihao{3} {By
    \\
      {\BIT@value@englishauthor}
    \\
      Supervisor:~{\BIT@value@englishadvisor}
    \\
      {\BIT@value@englishdate} \\}}
    \end{spacing}

  \end{center}

  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
  \thispagestyle{empty}
   \cleardoublepage
  \fi
}

%绘制树立排放的论文题目和学校名称
\newcommand\makeVerticalTitle{
   \cleardoublepage
   \thispagestyle{empty}
   \vskip 5cm
   \begin{center}
    \setstretch{1.1}
    \begin{minipage}{1em}
        {\heiti\zihao{3}\BIT@value@vtitle}
        \vskip 2cm
        {\heiti\zihao{3}\BIT@value@school}
    \end{minipage}
   \end{center}
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi}

% 原创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \pdfbookmark[0]{声明}{statement}
  \thispagestyle{empty}
  \begin{center}
  \vspace*{4em}
  {\bf\zihao{-2} \BIT@label@original}
  \end{center}
  \vskip 10pt
  {\zihao{-4}\BIT@label@originalcontent}
  \vskip 40pt
  %{\zihao{-4}\BIT@label@underfraduatenumber}
  %\BITunderline[6em]{}
  \begin{flushright}
    \hspace{0.5em}{\zihao{-4}\BIT@label@authorsign} \BITunderline[6em]{}
    \hspace{0.5em}{\zihao{-4}\BIT@label@originalDate} \BITunderline[6em]{}
  \end{flushright}


  \vskip 30mm

  \begin{center}
  {\bf\zihao{-2} \BIT@label@authorization}
  \end{center}
  \vskip 10pt
  {\zihao{-4} \BIT@label@authorizationcontent}
  \vskip 40pt
  \begin{flushright}
    {\zihao{-4}\BIT@label@authorsign} \BITunderline[6em]{} \hspace{0.5em} {\zihao{-4}\BIT@label@Supervisorsign} \BITunderline[6em]{} \hspace{0.5em}
    {\zihao{-4}\BIT@label@originalDate} \BITunderline[6em]{}
  \end{flushright}

  \vskip 15pt
  %\hspace{8em}{\zihao{4}\BIT@label@originalDate} \BITunderline[6em]{} \hspace{2em} {\zihao{4}\BIT@label@originalDate} \BITunderline[6em]{}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

 % 中文摘要
 \newenvironment{abstract}
 {
  \cleardoublepage
  \pagestyle{empty}
  \chapter{\BIT@label@abstract}
 }
 {}
%下一页从偶数页开始
 \newcommand\beginatevenpage{
 \clearpage
  \if@twoside
    \cleardoublepage
    \pagestyle{empty}
  \fi
 }
 % 中文摘要关键词
 \newcommand\keywords[1]{%
   \vspace{2ex}\noindent{\bf \songti \BIT@label@keywords} #1}

 % 英文摘要
 \newenvironment{englishabstract}
 {
  \clearpage
  \chapter{\BIT@label@englishabstract}
 }
 {}

 % 英文摘要关键词
 \newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf \BIT@label@englishkeywords} #1}


%_ 目录
\renewcommand\tableofcontents{%
  \if@twocolumn
  \@restonecoltrue\onecolumn
  \else
  \@restonecolfalse
  \fi
  \chapter*{\contentsname}%目录里显示“目录”，否则\chapter*
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \pdfbookmark[0]{目录}{bittoc}
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}

% 正文页眉页脚
%\pagestyle{fancy}
%\fancyhf{}
%\fancyhead[L]{\songti \zihao{5} \BIT@label@headschoolname}  % 奇数页左页眉
%\fancyfoot[R]{\songti \zihao{5} {\thepage}}      % 页脚

\pagestyle{fancy}
\fancyhf{}
\fancyhead[CE]{\songti \zihao{5} {\BIT@value@title}}  % 奇数页左页眉
\fancyhead[CO]{\songti\zihao{5} {\leftmark}}
\fancyfoot[LE]{\songti \zihao{5} {\thepage}}      % 页脚
\fancyfoot[RO]{\songti \zihao{5} {\thepage}}      % 页脚


\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
  \fancyhf{}%
  \fancyhead[CE]{\songti \zihao{5} {\BIT@value@title}}
  \fancyhead[CO]{\songti\zihao{5} {\leftmark}}
  \fancyfoot[LE]{\songti \zihao{5} ~---~{\thepage}~---~} %%首页页脚格式
  \fancyfoot[RO]{\songti \zihao{5} ~---~{\thepage}~---~} %%首页页脚格式
}

%_ 参考文献环境
\renewenvironment{thebibliography}[1]
     {\zihao{5}
      \chapter*{\bibname}
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \addcontentsline{toc}{chapter}{参考文献}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \setlength{\parsep}{1mm}
            \setlength{\labelsep}{0.5em}
            \setlength{\itemsep}{0.05pc}
            \setlength{\listparindent}{0in}
            \setlength{\itemindent}{0in}
            \setlength{\rightmargin}{0in}
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%%发表论文与研究成果清单环境
\newenvironment{publications}[1]
     {\chapter{\BIT@label@publications}%
      \@mkboth{\MakeUppercase\BIT@label@publications}
              {\MakeUppercase\BIT@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \setlength{\parsep}{1mm}
            \setlength{\labelsep}{0.5em}
            \setlength{\itemsep}{0.05pc}
            \setlength{\listparindent}{0in}
            \setlength{\itemindent}{0in}
            \setlength{\rightmargin}{0in}
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}

%%攻读学位期间参与项目环境
\newenvironment{projects}[1]
     {\chapter{\BIT@label@projects}%
      \@mkboth{\MakeUppercase\BIT@label@projects}
              {\MakeUppercase\BIT@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}

    \newenvironment{resume}
  {\chapter{\BIT@label@resume}}
  {}

\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
   {\endlist}

\newenvironment{resumeli}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
   {\endlist}

\newenvironment{conclusion}
  {\chapter*{结论}
    \@mkboth{结论}{结论}%
    \addcontentsline{toc}{chapter}{结论}}
  {}

\renewenvironment{thanks}
  {\chapter{\BIT@label@thanks}
  \fangsong
  }
  {}

\newenvironment{DeclareOriginal}
  {\chapter*{\heiti{独创性声明}}
    \@mkboth{独创性声明和关于论文使用授权的说明}{独创性声明和关于论文使用授权的说明}%
    \addcontentsline{toc}{chapter}{独创性声明和关于论文使用授权的说明}}
  {}



\newenvironment{symbolnote}
  {\chapter{\BIT@label@symbolnote}
  \fangsong}
  {}

  %%%============================术语=====================
  \newcommand{\bit@denotation@name}{主要符号对照表}
  \newenvironment{denotation}[1][4cm]{
      \chapter{\bit@denotation@name} % no tocline
      \noindent\begin{list}{}%
      {\vskip-30bp\zihao{-4}
       \renewcommand\makelabel[1]{##1\hfil}
       \setlength{\labelwidth}{#1} % 标签盒子宽度
       \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
       \setlength{\itemindent}{2cm} % 标签缩进量
       \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
       \setlength{\rightmargin}{0cm}
       \setlength{\parsep}{0cm} % 段落间距
       \setlength{\itemsep}{0cm} % 标签间距
      \setlength{\listparindent}{0cm} % 段落缩进量
      \setlength{\topsep}{0pt} % 标签与上文的间距
     }}{\end{list}}

  \newcommand{\bit@abbreviation@name}{缩略语表}
  \newenvironment{abbreviation}[1][4cm]{
      \chapter{\bit@abbreviation@name}
      \noindent\begin{list}{}%
      {\vskip-30bp\zihao{-4}
       \renewcommand\makelabel[1]{##1\hfil}
       \setlength{\labelwidth}{#1} % 标签盒子宽度
       \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
       \setlength{\itemindent}{2cm} % 标签缩进量
       \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
       \setlength{\rightmargin}{0cm}
       \setlength{\parsep}{0cm} % 段落间距
       \setlength{\itemsep}{0cm} % 标签间距
      \setlength{\listparindent}{0cm} % 段落缩进量
      \setlength{\topsep}{0pt} % 标签与上文的间距
     }}{\end{list}}
%====增加化学、国际单位宏包
     \RequirePackage[version=4]{mhchem}
     \RequirePackage{siunitx}
\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)

\endinput

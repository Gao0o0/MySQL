## git 
* 安装 git : sudo apt-get install git 
* 基本命令：
  * 建立文件夹（将此设为本地仓库）： mkdir fielname
  * 初始化仓库： git init
  * 将文件添加到仓库： git add fiel
  * 提交到本地： git commit
  * 查看现存提交信息： git log
  * 查看所有提交信息： git reflog
  * 查看仓库状态： git status
  * 移除关注（仅从仓库删除，本地文件并未删除）： git rm feil
  * 配置用户名： git config --global user.name name
  * 配置用户邮箱 : git config --global user.email email
  * 配置编辑提交信息的编辑器: git config --global core.editor vim
  * 比较两次提交信息的差异： diff commitID commitId(如若不写则比较本次提交与上次提交的差异)
  * 未提交文件误删恢复：git checkout feil
  * 版本回退： git resert --hard commitID
  * 文件忽略： touch .gitignore,编辑该文件，写入待忽略文件名；
  * 生成patch： git format-patch -pn
  * 打patch： git am patch-nam（包括路径）
* 本地仓库与github
  * 将本地仓库与远程github仓库相连： git remote add origin 远程仓库URL（先在github建立仓库）
  * 将远程的仓库的信息同步到本地： git fetch origin
  * 将远程仓库拉取到本地: git clone url
  * 将本地分支推到远程： git push origin 分支名（一般为master）
  * 将远程分支拉到本地： git pull origin 分支名;

export XDG_CONFIG_HOME="$HOME/.config"
set termencoding=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp
# bash
source ~/.bash_profile
export TERM=xterm-256color
export BUNDLER_EDITOR=/usr/local/bin/vim
# HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# LANG設定 rootの場合はCに設定
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac
bindkey '^r' peco_select_history
# プロンプトの設定
autoload -U colors
colors
local p_mark="%B%(?, %F{green}, %F{red})%#%f%b"
if [ -n "$SSH_CONNECTION" ]; then
    PROMPT="%F{green]}[%F{magenta}%n%F{green}@%F{cyan}%m%F{green}:%c]$p_mark"
else
    PROMPT="%F{green}[%c]$p_mark"
fi
PROMPT2="%F{magenta}%_->%f"
RPROMPT="%F{yellow}[%d]%f"
SPROMPT="%F{yellow}%r is correct? [(n)o, (y)es, (a)bort, (e)dit]:%f"
# 補完入力の有効化
autoload -U compinit
compinit
# ls 補完リスト色設定
export LSCOLORS=gxfxcxdhbxegehabahhfhg
export LS_COLORS="di=36;49:ln=35;49:so=32;49:pi=33;47:ex=31;49:bd=34;46:cd=34;47:su=30;41:sg=30;47:tw=37;45:ow=37;46"
zstyle ':completion:*' list-colors 'di=36;49' 'ln=35;49' 'so=32;49' 'pi=33;47' 'ex=31;49' 'bd=34;46' 'cd=34;47' 'su=30;41' 'sg=30;47'  'tw=37;45' 'ow=37;46'
# エイリアス設定
case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias grep='grep --color'
alias less='less -X -R'
function find_cd() {
    cd "$(find . -type d | peco)"
}
alias fc="find_cd"
# エイリアスを拡張する(D)
setopt ALIASES
# 以降、定義されたすべての変数は自動的にexportされる
unsetopt ALL_EXPORT
# 補完候補など表示する時はその場に表示し、終了時に画面から消す
setopt ALWAYS_LAST_PROMPT
# 補完時に文字列末尾へカーソル移動
setopt ALWAYS_TO_END
# コマンドを終了した順序でヒストリファイルに追加
setopt APPEND_HISTORY
# コマンドがディレクトリの名前の時に自動的にcdコマンドとして実行する
setopt AUTO_CD
# disownコマンドでジョブテーブルから削除されストップしたジョブには自動的に CONT シグナルが送られ、実行するようになる
setopt AUTO_CONTINUE
# 補完のリストアップ
setopt AUTO_LIST
# 2度目の連続する補完の要求で自動的にメニュー補完を使う
setopt AUTO_MENU
# ディレクトリの絶対パスがセットされた変数は、そのディレクトリの名前となる
setopt AUTO_NAME_DIRS
# 変数名が補完され自動的に文字が入力されたあと、次の文字が変数名の直後に来るべきものであるなら自動的に付加された文字が削除され、入力された文字が変数名の直後に来る
setopt AUTO_PARAM_KEYS
# 中味がディレクトリ名である変数を補完すると、末尾がスペースのかわりにスラッシュとなる
setopt AUTO_PARAM_SLASH
# cdすると古いディレクトリがディレクトリスタックに積まれる
setopt AUTO_PUSHD
# 補完の結果として得られる最後の文字がスラッシュで次に入力した文字が単語の区切文字、スラッシュ、もしくはコマンドを終端する文字のとき、そのスラッシュを取り除く
setopt AUTO_REMOVE_SLASH
# サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt AUTO_RESUME
# ファイル名生成のパターンがフォーマット違反の時、エラーメッセージを表示する
setopt BAD_PATTERN
# cshスタイルのヒストリ拡張を使う '!' 文字を特別に扱う
setopt BANG_HIST
# グロブパターンにおいて、末尾にあって'|'も'('も'~'も含まないならば、修飾子とみなす
unsetopt BARE_GLOB_QUAL
# 曖昧な補完の場合、補完関数が二度連続で呼ばれると自動的に選択肢をリストアップする このオプションは AUTO_LIST よりも強い優先度を持つ
unsetopt BASH_AUTO_LIST
# ZLE のエラー時にビープ音を発する
unsetopt BEEP
# 全てのバックグラウンドジョブを低優先度で実行する
unsetopt BG_NICE
# ブレース内の式が正しくない形式のとき、個々の文字の辞書順リストとなる
unsetopt BRACE_CCL
# 組み込みコマンド echo を、 BSD echo(1) コマンドと互換性のある動作にする
setopt BSD_ECHO
# グロッビング(ファイル名生成)で大文字小文字を区別する
setopt CASE_GLOB
# 16進数を C 言語形式で出力する
setopt C_BASES
# cd コマンドに与えられる引数がディレクトリではなく、スラッシュから開始されない場合には、先頭が'~' で開始されるように拡張される
unsetopt CDABLE_VARS
# パスの一部に'..'が含まれているもの、つまりひとつ前のディレクトリ名をキャンセルしたものに移動するとき、実際のディレクトリ名に移動する
unsetopt CHASE_DOTS
# ディレクトリ移動時のシンボリックリンクを真の値に変換する
unsetopt CHASE_LINKS
# バックグラウンドジョブとサスペンドしたジョブのステータスが、ジョブ制御をしたシェルの終了前に報告される
setopt CHECK_JOBS
# '>'のリダイレクションで存在するファイルを指定した場合に削除し、'>>' で存在しないファイルを指定した場合に新しいファイルを作成する
unsetopt CLOBBER
# 補完を行う前に内部的にコマンド行のエイリアスを置き換える作業を抑制する
unsetopt COMPLETE_ALIASES
# カーソルの位置に補なうことで単語を完成させようとする
setopt COMPLETE_IN_WORD
# コマンドのスペルの訂正を試みる
setopt CORRECT
# コマンド行の全ての引数に対してスペルミスの訂正を試みる
unsetopt CORRECT_ALL
# イベント識別子なしのヒストリ参照はつねに直前のコマンドとみなされる
setopt CSH_JUNKIE_HISTORY
# ループの中味として'do list; done'ではなく'list; end'の形式を許可する
setopt CSH_JUNKIE_LOOPS
# シングルクォートやダブルクォートの文字列のルールを、や csh のものと一致させる
unsetopt CSH_JUNKIE_QUOTES
# コマンドなしにリダイレクトを実行したとき、 NULLCMD および READNULLCMD の値を使わない
unsetopt CSH_NULLCMD
# ファイル名生成のパターンがマッチしないとき、引数リストからそのパターンを取り除く コマンド中の全てのパターンがマッチしない時でなければエラーを出力しない
unsetopt CSH_NULL_GLOB
# CORRECT、CORRECTALLの両オプション、およびspell-wordエディタコマンドでのスペルミス推定で、Dvorak配列を使う
unsetopt DVORAK
# = のファイル名生成が利用される
setopt EQUALS
# あるコマンドが非ゼロの終了コードとなったとき、このオプションがセットされていると、ZERRトラップを実行して終了する
unsetopt ERR_EXIT
# あるコマンドが非ゼロの終了コードとなったとき、そのコマンドの外の関数から脱出する
unsetopt ERR_RETURN
# コマンドを実行する このオプションなしには、コマンドが読み込まれて構文エラーをチェックうするだけで、実行されない
setopt EXEC
# '#' '~' '^' といった文字をファイル名生成のパターンの一部として扱う
unsetopt EXTENDED_GLOB
# コマンドの開始時のタイムスタンプ(エポックからの秒数)と実行時間(秒単位)をヒストリに含める
setopt EXTENDED_HISTORY
# このオプションが解除されていると、シェルエディタにおけるスタート／ストップ文字(通常は ^S/^Q) によるフロー制御の出力が無効化される
setopt FLOW_CONTROL
# シェル関数やスクリプトの source 実行時に、 $0 を一時的にその関数／スクリプト名にセットする
setopt FUNCTION_ARGZERO
# ファイル名生成(グロッビング)を実行する
setopt GLOB
# このオプションがセットされていると、 declare、float、integer、readonly、および typeset(ただし local は除く)に -x フラグが与えられると、 -g フラグもオンになる
setopt GLOBAL_EXPORT
# このオプションが解除されると、起動時に /etc/zprofile、/etc/zshrc、/etc/zlogin、/etc/zlogout は実行されなくなる
setopt GLOBAL_RCS
# このオプションがセットされると、スカラ変数代入の形式の'name=pattern'の右辺でもファイル名生成が実行される
unsetopt GLOB_ASSIGN
# 現在の単語がグロブパターンのとき、その結果の単語すべてを挿入するのではなく、 MENU_COMPLETE のように補完にマッチしたものを生成し、サイクルする
setopt GLOB_COMPLETE
# '.' で開始するファイル名にマッチさせるとき、先頭に明示的に '.' を指定する必要がなくなる
unsetopt GLOB_DOTS
# 変数の結果を置換して得られた文字を、ファイル拡張やファイル名生成として扱う
setopt GLOB_SUBST
# 個々のコマンドの位置を、最初に実行したときに記憶する
setopt HASH_CMDS
# コマンド名がハッシュされるときに、それを含むディレクトリもハッシュする
setopt HASH_DIRS
# コマンド補完が行われたとき、コマンドパスが最初にハッシュされるようにする
setopt HASH_LIST_ALL
# ヒストリにおいて、出力リダイレクションに '|' を加える
setopt HIST_ALLOW_CLOBBER
# 存在しないヒストリエントリにアクセスしようとしたときにビープを出す
unsetopt HIST_BEEP
# 現在のコマンド行をヒストリに追加することによって、内部のヒストリの末尾が削られるときに、ユニークなものの前に、全く同じイベントがヒストリ中に存在する、最も古いものが削除される
unsetopt HIST_EXPIRE_DUPS_FIRST
# ラインエディタでヒストリのエントリを探索するときに、一度見たことのあるエントリと同じものは、それが連続していなければ表示しない
unsetopt HIST_FIND_NO_DUPS
# コマンド行からヒストリリストに追加されたものが古いものと全く同じ場合に、古いものをリストから削除する
unsetopt HIST_IGNORE_ALL_DUPS
# 直前のイベントと全く同じものの場合、コマンド行をヒストリリストに加えない
unsetopt HIST_IGNORE_DUPS
# 行の最初の文字がスペースの場合、もしくはスペースから開始される拡張エイリアスの場合に、コマンド行をヒストリリストから削除する
unsetopt HIST_IGNORE_SPACE
# ヒストリリストから関数定義を除く
unsetopt HIST_NO_FUNCTIONS
# history (fc -l) コマンドをヒストリリストから取り除く
unsetopt HIST_NO_STORE
# ヒストリリストに追加するときに、各コマンド行の余計な空白を取り除く
setopt HIST_REDUCE_BLANKS
# ヒストリファイルに書き出すときに、古いコマンドと同じものは無視する
unsetopt HIST_SAVE_NO_DUPS
# ヒストリ拡張から行に持ってきた場合、それを直接は実行しない ヒストリ拡張を行い、行をバッファに読み込む
setopt HIST_VERIFY
# シェル終了時に、起動中のジョブに HUP シグナルを送る
setopt HUP
# ブレース拡張を行わない
unsetopt IGNORE_BRACES
# ファイル終端で終了しない exit か logout の実行を要求する
unsetopt IGNORE_EOF
# このオプションがセットされると、APPEND_HISTORYのように、新しいヒストリ行は$HISTFILEにインクリメンタルに(入力されるとすぐに)追加されるようになる
unsetopt INC_APPEND_HISTORY
# 対話的なシェルであることを意味する
# unsetopt INTERACTIVE
# 対話的なシェルでもコメントを有効にする
setopt INTERACTIVE_COMMENTS
# ksh っぽい配列の扱いをできるだけエミュレートする
unsetopt KSH_ARRAYS
# ksh の関数オートロードをエミュレートする
unsetopt KSH_AUTOLOAD
# パターンマッチにおいて、カッコの解釈は直前の '@'、'*'、'+'、'?'、'!' によって異なる
unsetopt KSH_GLOB
# オプション設定の表示方法を変える
unsetopt KSH_OPTION_PRINT
# typeset 系のコマンド、 declare、 export、 float、 integer、 local、 readonly などの引数の処理方法を変える
unsetopt KSH_TYPESET
# コマンド行から入力したプレフィクスに曖昧さがないとき、補完リストを表示することなく補完する
setopt LIST_AMBIGUOUS
# 曖昧な補完の時にビープ音を発する
setopt LIST_BEEP
# 異なる幅のカラムを使うことで、補完リストを小さく(なるべく少ない行数に)しようとする
setopt LIST_PACKED
# 補完リストを水平にソートする
setopt LIST_ROWS_FIRST
# 補完対象となるファイルをリストアップするとき、ファイルの末尾に識別マークをつけて種類を提示する
setopt LIST_TYPES
# このオプションがセットされると、シェル関数の終了時に、すべての(このオプションを含む)オプションは復帰される
unsetopt LOCAL_OPTIONS
# このオプションがセットされていて、関数内でシグナルのトラップが設定されているとき、関数の終了時にそのシグナルの元のトラップに復帰する
unsetopt LOCAL_TRAPS
# ログインシェルであることを示す
# setopt LOGIN
# ジョブリストがデフォルトでロングフォーマットになる
unsetopt LONG_LIST_JOBS
# コマンド名のあとに表われる、クォートされていない'anything=expression' という形式の引数は、 expression のところがパラメタ割り当てであるかのように、ファイル名拡張を行う
unsetopt MAGIC_EQUAL_SUBST
# シェルが最後にチェックした後でメールファイルがアクセスされていると、警告メッセージを表示する
unsetopt MAIL_WARNING
# ファイル名生成(グロッビング)の結果のディレクトリ名に対して、 '/' を末尾に追加する
unsetopt MARK_DIRS
# 曖昧な補完の際に、可能なリストを表示してビープを鳴らすのではなく、最初にマッチしたものをいきなり挿入する
unsetopt MENU_COMPLETE
# ジョブ制御を可能にする。対話的なシェルではデフォルトでセットされる
# setopt MONITOR
# 複数のリダイレクションが行われるときに、暗黙に tee や cat が実行される
setopt MULTIOS
# ファイル名生成のパターンにマッチするものがない場合、引数リストをそのままにするのではなく、エラーを表示する
setopt NOMATCH
# バックグラウンドジョブの状態の報告を、次のプロンプトを表示するまで待つのではなく、即座に行う
setopt NOTIFY
# ファイル名生成のパターンにマッチするものがないときは、エラーを報告するのではなく、その引数リストのパターンを除去する
unsetopt NULL_GLOB
# ファイル名生成パターンから数値ファイル名がマッチしたら、ファイル名を辞書順ではなく数値順にソートする
unsetopt NUMERIC_GLOB_SORT
# 0から開始される整数は、 IEEE Std 1003.2-1992 (ISO 994502:1993) に従って8進数として解釈する
unsetopt OCTAL_ZEROES
# ラインエディタをオーバストライクモードで起動する
unsetopt OVERSTRIKE
# コマンド名にスラッシュが含まれていても、パス探索を行う
unsetopt PATH_DIRS
# このオプションがセットされているとき、組み込みコマンド command によってシェルの組み込みコマンドを実行できる
setopt POSIX_BUILTINS
# 補完リストその他でも8ビット文字を表示する
unsetopt PRINT_EIGHT_BIT
# セットされているとき、 '!' をプロンプト拡張で特殊文字として扱う
setopt PROMPT_BANG
# ラインエディタのプロンプトを表示する直前に復帰文字を出力する
setopt PROMPT_CR
# セットされているとき、 '%' をプロンプト拡張で特殊文字として扱う
setopt PROMPT_PERCENT
# セットされているとき、プロンプトで変数拡張、コマンド置換、計算拡張が実行される
setopt PROMPT_SUBST
# ディレクトリスタックに同じディレクトリの複数のコピーを push しない
unsetopt PUSHD_IGNORE_DUPS
# ディレクトリスタックに数を与えるとき、 '+' と '-' の意味を交換する
unsetopt PUSHD_MINUS
# pushd と popd で、ディレクトリスタックを表示しない
unsetopt PUSHD_SILENT
# pushd に引数を与えないと、 'pushd $HOME' として動作する
unsetopt PUSHD_TO_HOME
# 'foo${xx}bar' の形式で配列を置換するとき、たとえば xx の値が (a b c) だったとすると
unsetopt RC_EXPAND_PARAM
# シングルクォートで囲まれた文字列内部でシングルクォート自身を表現する時に '''' による表現を許可する
unsetopt RC_QUOTES
# 起動時に /etc/zshenv を読み込んだあとで、 .zshnv、/etc/zprofile、.zprofile、/etc/zshrc、.zshrc、/etc/zlogin、.zlogin、.zlogout など、 'Files' の章で記述されたファイルを読み込む
setopt RCS
# 補完において、曖昧さがあっても正確なマッチを認識する
unsetopt REC_EXACT
# 制限モードになる
# setopt RESTRICTED
# 'rm *' や 'rm path/*' を実行しようとする前にユーザに確認を求めない
unsetopt RM_STAR_SILENT
# 'rm *' や 'rm path/*' の実行の前のユーザへの確認時に、10秒間だけ待ち、その間のいかなる入力も無視する
unsetopt RM_STAR_WAIT
# このオプションはヒストリファイルから新しいコマンドをインポートするのと、入力したコマンドをヒストリファイルに書き出すのの両方を行う
unsetopt SHARE_HISTORY
# ファイル名拡張(~拡張など)は、変数拡張やコマンド置換、計算拡張やブレース拡張の前に行う
unsetopt SH_FILE_EXPANSION
# 変数やコマンド置換結果得られたグロッビングにおいて、またシェルがパターンを受け付ける他の場所のいくつかで、 '('、'|'、')' および '<' の特殊な意味を無効化する
unsetopt SH_GLOB
# 変数やコマンド置換結果得られたグロッビングにおいて、またシェルがパターンを受け付ける他の場所のいくつかで、 '('、'|'、')' および '<' の特殊な意味を無効化する
# setopt SHIN_STDIN
# リダイレクションの差異に NULLCMD や READNULLCMD の値を使うのではなく、 ':' コマンドを使う
unsetopt SH_NULLCMD
# このオプションがセットされると、シェルは単一文字オプション(set や setopt で利用される)を ksh のように解釈する
unsetopt SH_OPTION_LETTERS
# for、repeat、select、if、function などの短形式を許す
setopt SHORT_LOOPS
# クォートされていない変数拡張が行われたあとで、フィールド分割を行う
unsetopt SH_WORD_SPLIT
# シェルが標準入力から読み込んでいるとき、1つのコマンドを実行したら終了する。また、コマンド行から INTERACTIVE オプションが明示的に指定されない限り、シェルは対話的でなくなる
unsetopt SINGLE_COMMAND
# 複数行ではなく、単一コマンド行編集にする
unsetopt SINGLE_LINE_ZLE
# 行がバッククォートで終端し、この行に奇数個のバッククォートがあるとき、末尾のバッククォートを無視する
unsetopt SUN_KEYBOARD_HACK
# コマンド行を受け入れたときに、右プロンプトを削除する
unsetopt TRANSIENT_RPROMPT
# 解除されていると、オプションなしで 'typeset' 系のコマンドを実行したり、割当てる値なしに既存の変数名のリストを渡したりすると、その変数の値を表示する
unsetopt TYPESET_SILENT
# 置換するときに、内容のない変数を空白として扱う
setopt UNSET
# 入力された行を表示する
unsetopt VERBOSE
# 実行されるコマンドと引数を表示する
unsetopt XTRACE
# zsh line editor を利用する
setopt ZLE
# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst
# vcsの表示
zstyle ':vcs_info:*' formats '%s][* %F{green}%b%f'
zstyle ':vcs_info:*' actionformats '%s][* %F{green}%b%f(%F{red}%a%f)'
# プロンプト表示直前にvcs_info呼び出し
precmd() { vcs_info }
# プロンプト表示
PROMPT='[${vcs_info_msg_0_}]:%~/%f '
alias g='git'
alias s='tig status'
alias t='tig'
alias gg='git grep'
alias routes='bundle exec rake routes'
alias render='git grep render'
alias c='bundle exec rails c'
alias gb="git branch"
alias run="./manage.py runserver"
alias workon1="workon env1"
alias ci="bundle exec rubocop -a && bundle exec slim-lint app/**/*.slim && bundle exec rspec spec/"
alias fb="open 'https://www.facebook.com/'"
alias puma="ps aux |grep 'puma' | grep -grepv grep  | awk '{ print \"kill -9\", \$2 }' | sh"

function gcop() {
    git branch | peco | xargs git checkout
}

function gbdp () {
    git branch | peco | xargs git branch -d
}
function gbda () {
    git branch | while read -r branch; do
        git brach -d "$branch"
    done
}
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
setopt nonomatch

eval "$(direnv hook zsh)"
setopt HIST_IGNORE_DUPS     # ignore duplication command history list
setopt SHARE_HISTORY        # share command history data
setopt EXTENDED_HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

function exists { which $1 &> /dev/null }
function peco_select_history() {
  local tac
  exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
  BUFFER=$(history -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER         # move cursor
  zle -R -c               # refresh
}

zle -N peco_select_history

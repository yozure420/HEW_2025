// 分割表示を開始（既に表示中なら何もしない）
function openSplitView() {
  if (document.body.classList.contains('split-open')) return;

  const main = document.querySelector('main');
  if (!main) return;

  // main の実サイズを取得し、画面に収まるようにクランプ
  const rect = main.getBoundingClientRect();
  const padding = 24; // 画面端の余白
  const maxW = Math.min(rect.width, window.innerWidth - padding * 2);
  const maxH = Math.min(rect.height, window.innerHeight - padding * 2);

  // CSS変数を更新（:root に設定）
  const rootStyle = document.documentElement.style;
  rootStyle.setProperty('--main-w', `${Math.max(240, Math.floor(maxW))}px`);
  rootStyle.setProperty('--main-h', `${Math.max(200, Math.floor(maxH))}px`);

  // 右側パネルを生成（未作成の場合）
  let panel = document.querySelector('.side-panel');
  if (!panel) {
    panel = document.createElement('div');
    panel.className = 'side-panel';
    panel.innerHTML = `
      <div style="padding:16px 18px;">
        <h3 style="margin:0 0 8px;font-size:18px;">詳細</h3>
        <p style="margin:0;color:rgba(255,255,255,.85);font-size:14px;">
          ここに右側パネルの内容を入れてください。
        </p>
      </div>`;
    document.body.appendChild(panel);
    // レイアウト確定のため強制リフロー
    panel.getBoundingClientRect();
  }

  // 分割表示を有効化
  document.body.classList.add('split-open');
}

// リサイズ時もサイズを保つ
function updateSplitSizeOnResize() {
  if (!document.body.classList.contains('split-open')) return;
  const main = document.querySelector('main');
  if (!main) return;
  const rect = main.getBoundingClientRect();
  const padding = 24;
  const maxW = Math.min(rect.width, window.innerWidth - padding * 2);
  const maxH = Math.min(rect.height, window.innerHeight - padding * 2);
  const rootStyle = document.documentElement.style;
  rootStyle.setProperty('--main-w', `${Math.max(240, Math.floor(maxW))}px`);
  rootStyle.setProperty('--main-h', `${Math.max(200, Math.floor(maxH))}px`);
}

// .content-info をクリックで開始
document.addEventListener('click', (e) => {
  const ci = e.target.closest('.content-info');
  if (ci) openSplitView();
});

// ウィンドウサイズ変化に追従
window.addEventListener('resize', updateSplitSizeOnResize);
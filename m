From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the drm tree
Date: Tue, 29 Aug 2017 11:44:13 +1000
Message-ID: <20170829114413.43692976@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Thomas Hellstrom <thellstrom@vmware.com>, Sinclair Yeh <syeh@vmware.com>
List-Id: linux-next.vger.kernel.org

Hi Dave,

Commits

  461e60ea1119 ("drm/exynos/decon5433: use mode info stored in CRTC to detect i80 mode")
  ac60944ccf23 ("drm/exynos: consistent use of cpp")
  e300173f0616 ("drm/vmwgfx: Don't use drm_irq_[un]install")
  ef369904aaf7 ("drm/vmwgfx: Move irq bottom half processing to threads")
  65b97a2bec2f ("drm/vmwgfx: Restart command buffers after errors")
  5f55be5f306a ("drm/vmwgfx: Support the NOP_ERROR command")
  1f1a36cc4d49 ("drm/vmwgfx: Fix incorrect command header offset at restart")

are missing a Signed-off-by from their committers.

-- 
Cheers,
Stephen Rothwell

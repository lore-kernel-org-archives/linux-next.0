From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slabh tree
Date: Mon, 29 Mar 2010 16:39:13 +1100
Message-ID: <20100329163913.75f2da8f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Tejun,

After merging the slabh tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/usb/pcm.c: In function 'snd_usb_pcm_check_knot':
sound/usb/pcm.c:751: error: implicit declaration of function 'kmalloc'
sound/usb/pcm.c:751: warning: assignment makes pointer from integer without a cast

Caused by commit d103d3b3e8512312b5254950035366d4422a479a ("percpu: don't
implicitly include slab.h from percpu.h") from the slabh tree interacting
with commit e5779998bf8b70e48a6cc208c8b61b33bd6117ea ("ALSA: usb-audio:
refactor code") from the sound tree.

I applied the following merge fixup patch which should be applied to the
sound tree (see Documentation/SubmitChecklist Rule #1 :-)).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Mar 2010 16:37:58 +1100
Subject: [PATCH] sound: usb pcm: use of kmalloc requires the include of slab.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/usb/pcm.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 630e220..2bf0d77 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/slab.h>
 #include <linux/usb.h>
 #include <linux/usb/audio.h>
 #include <linux/usb/audio-v2.h>
-- 
1.7.0.3

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

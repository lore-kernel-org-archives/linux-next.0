From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slabh tree
Date: Mon, 29 Mar 2010 16:59:41 +1100
Message-ID: <20100329165941.027a7fee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60452 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753858Ab0C2GNq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 02:13:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@caiaq.de>, Takashi Iwai <tiwai@suse.de>

Hi Tejun,

After merging the slabh tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/usb/helper.c: In function 'snd_usb_ctl_msg':
sound/usb/helper.c:97: error: implicit declaration of function 'kfree'

Caused by commit d103d3b3e8512312b5254950035366d4422a479a ("percpu: don't
implicitly include slab.h from percpu.h") from the slabh tree interacting
with commit e5779998bf8b70e48a6cc208c8b61b33bd6117ea ("ALSA: usb-audio:
refactor code") from the sound tree.

I applied the following merge fixup patch which should be applied to the
sound tree (see Documentation/SubmitChecklist Rule #1 :-)).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Mar 2010 16:58:16 +1100
Subject: [PATCH] sound: usb helper: use of kfree requires the include of slab.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/usb/helper.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/sound/usb/helper.c b/sound/usb/helper.c
index ba7dba4..d48d6f8 100644
--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/slab.h>
 #include <linux/usb.h>
 
 #include "usbaudio.h"
-- 
1.7.0.3

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

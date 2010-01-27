From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build failure
Date: Wed, 27 Jan 2010 17:59:17 +1100
Message-ID: <20100127175917.5d690f52.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33717 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753961Ab0A0G7T (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jan 2010 01:59:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Devin Heitmueller <dheitmueller@kernellabs.com>

Hi Mauro,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/media/video/cx18/cx18-alsa-pcm.c: In function 'snd_pcm_alloc_vmalloc_buffer':
drivers/media/video/cx18/cx18-alsa-pcm.c:234: error: implicit declaration of function 'vfree'
drivers/media/video/cx18/cx18-alsa-pcm.c:236: error: implicit declaration of function 'vmalloc'

Caused by commit 5e9a302853301e0a2bb6671036daac3366fd85f4 ("V4L/DVB: cx18: overhaul ALSA PCM device handling so it works").

I applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 27 Jan 2010 17:53:39 +1100
Subject: [PATCH] V4L/DVB: using vmalloc requires include of linux/vmalloc.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/video/cx18/cx18-alsa-pcm.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/media/video/cx18/cx18-alsa-pcm.c b/drivers/media/video/cx18/cx18-alsa-pcm.c
index 6e56df9..b9f42b1 100644
--- a/drivers/media/video/cx18/cx18-alsa-pcm.c
+++ b/drivers/media/video/cx18/cx18-alsa-pcm.c
@@ -25,6 +25,7 @@
 
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/vmalloc.h>
 
 #include <media/v4l2-device.h>
 
-- 
1.6.6

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

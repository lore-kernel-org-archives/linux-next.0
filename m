From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (sound tree
 related)
Date: Tue, 11 Jan 2011 13:20:30 +1100
Message-ID: <20110111132030.3179e682.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43976 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753504Ab1AKCUf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Jan 2011 21:20:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>

Hi all,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

sound/pci/oxygen/xonar_dg.c: In function 'dg_output_enable':
sound/pci/oxygen/xonar_dg.c:138: error: implicit declaration of function 'msleep'

Caused by commit 66410bfdf14f7c2ad3b2d4a8adeab41d368b6f05 ("ALSA: oxygen:
add Xonar DG support").

See Rule 1 in Documentation/SubmitChecklist.

I added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 11 Jan 2011 13:17:16 +1100
Subject: [PATCH] ALSA: include delay.h for msleep in Xonar DG support

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/pci/oxygen/xonar_dg.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/sound/pci/oxygen/xonar_dg.c b/sound/pci/oxygen/xonar_dg.c
index cc610ac1..dd45cf4 100644
--- a/sound/pci/oxygen/xonar_dg.c
+++ b/sound/pci/oxygen/xonar_dg.c
@@ -40,6 +40,7 @@
  */
 
 #include <linux/pci.h>
+#include <linux/delay.h>
 #include <sound/control.h>
 #include <sound/core.h>
 #include <sound/info.h>
-- 
1.7.2.3

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

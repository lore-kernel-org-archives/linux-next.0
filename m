From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sound tree build failure
Date: Fri, 31 Oct 2008 14:41:06 +1100
Message-ID: <20081031144106.f66b7084.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56649 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750950AbYJaDlM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Oct 2008 23:41:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Troy Kisky <troy.kisky@boundarydevices.com>

Hi Takashi,

Today's linux-next build (x86_64 allmodconfig) failed like this:

sound/soc/soc-dapm.c: In function 'snd_soc_dapm_sys_add':
sound/soc/soc-dapm.c:828: error: 'ret' undeclared (first use in this function)

Caused by commit 12ef193d5817504621e503e78d641265f6a86ac4 ("ASoC: Allow
setting codec register with debugfs filesystem") which removed the
declaration.

I applied the following patch.  More care required.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 31 Oct 2008 14:39:03 +1100
Subject: [PATCH] ALSA: restore removeed variable declaration

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/soc/soc-dapm.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 407092c..7bf3c40 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -822,6 +822,8 @@ static DEVICE_ATTR(dapm_widget, 0444, dapm_widget_show, NULL);
 
 int snd_soc_dapm_sys_add(struct device *dev)
 {
+	int ret;
+
 	if (!dapm_status)
 		return 0;
 
-- 
1.5.6.5

From: Manuel Lauss <manuel.lauss@googlemail.com>
Subject: [PATCH] MIPS/sound: DB1200 audio support depends on MIPS arch.
Date: Thu, 10 Nov 2011 12:20:59 +0100
Message-ID: <1320924059-4142-1-git-send-email-manuel.lauss@googlemail.com>
References: <20111110122241.eed1e785e4c015a51b9ef585@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:41273 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755826Ab1KJLVJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2011 06:21:09 -0500
In-Reply-To: <20111110122241.eed1e785e4c015a51b9ef585@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: alsa-devel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Manuel Lauss <manuel.lauss@googlemail.com>

DB1200 audio support should only be visible if MIPS/Alchemy arch is
selected.  Fixes an x86-allmodconfig build failure in linux-next.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>
---
 sound/soc/au1x/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/soc/au1x/Kconfig b/sound/soc/au1x/Kconfig
index c620cbf9..a561040 100644
--- a/sound/soc/au1x/Kconfig
+++ b/sound/soc/au1x/Kconfig
@@ -52,7 +52,7 @@ config SND_SOC_DB1000
 
 config SND_SOC_DB1200
 	tristate "DB1200/DB1300/DB1550 Audio support"
-	select SND_SOC_AU1XPSC
+	depends on SND_SOC_AU1XPSC
 	select SND_SOC_AU1XPSC_AC97
 	select SND_SOC_AC97_CODEC
 	select SND_SOC_WM9712
-- 
1.7.7.2

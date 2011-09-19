From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree with the mips tree
Date: Mon, 19 Sep 2011 15:29:21 +1000
Message-ID: <20110919152921.56ed0465d1060b50f4c1cf6a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:47226 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750928Ab1ISF3Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2011 01:29:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Manuel Lauss <manuel.lauss@googlemail.com>, Ralf Baechle <ralf@linux-mips.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

Hi Takashi,

Today's linux-next merge of the sound tree got a conflict in
sound/mips/Kconfig between commit 9d7dec27ace1 ("MIPS: Alchemy: remove
all CONFIG_SOC_AU1??? defines") from the mips tree and commit
7137c6bcb7ff ("ALSA: deprecate MIPS AU1X00 AC97 driver") from the sound
tree.

Just context changes.  I fixed it up (see below) anc can carry the fix
as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc sound/mips/Kconfig
index 0a0d501,77dd0a1..0000000
--- a/sound/mips/Kconfig
+++ b/sound/mips/Kconfig
@@@ -23,8 -23,8 +23,8 @@@ config SND_SGI_HAL
  
  
  config SND_AU1X00
- 	tristate "Au1x00 AC97 Port Driver"
+ 	tristate "Au1x00 AC97 Port Driver (DEPRECATED)"
 -	depends on SOC_AU1000 || SOC_AU1100 || SOC_AU1500
 +	depends on MIPS_ALCHEMY
  	select SND_PCM
  	select SND_AC97_CODEC
  	help

From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Temporary ASoC tree for next
Date: Mon, 16 Aug 2010 17:34:57 +0100
Message-ID: <20100816163457.GF3276@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60286 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754693Ab0HPQe7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Aug 2010 12:34:59 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, alsa-devel@alsa-project.org

Hi Stephen,

Liam has recently done some work on ASoC to enhance the ability to work
with multiple external devices which we're expecting to get in for .37.
Since this work required some architecture modifications and we've had a
bit of trouble getting testers we're expecting a higher than average
degree of cross-tree issues this cycle so in order to avoid affecting
all other ALSA work we'd like to have a separate ASoC-specific tree in
-next for this release cycle if possible:

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound-2.6.git for-next

Please also include Liam as a contact for the tree.

Thanks,
Mark

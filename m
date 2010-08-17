From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound-asoc tree with the samsung
 tree
Date: Tue, 17 Aug 2010 12:21:37 +1000
Message-ID: <20100817122137.aa6f269e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52337 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753750Ab0HQCVj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Aug 2010 22:21:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in
arch/arm/mach-s3c64xx/mach-smdk6410.c between commit
96e9d908a7b5b5be774ba26aca0d6633e7c97f63 ("ARM: SMDK6410: Register AC97
controller") from the samsung tree and commit
f0fba2ad1b6b53d5360125c41953b7afcd6deff0 ("ASoC: multi-component - ASoC
Multi-Component Support") from the sound-asoc tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Stephen Rothwell <sfr@canb.auug.org.au>

diff --cc arch/arm/mach-s3c64xx/mach-smdk6410.c
index c0f46e0,ecbddd3..0000000
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@@ -284,7 -283,7 +284,8 @@@ static struct platform_device *smdk6410
  	&s3c_device_fb,
  	&s3c_device_ohci,
  	&s3c_device_usb_hsotg,
 +	&s3c64xx_device_ac97,
+ 	&s3c_device_pcm,
  	&s3c64xx_device_iisv4,
  	&samsung_device_keypad,
  

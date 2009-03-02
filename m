From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree with the  tree
Date: Mon, 2 Mar 2009 14:11:06 +1100
Message-ID: <20090302141106.7e14b17d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54724 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752497AbZCBDLL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Mar 2009 22:11:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, "David S. Miller" <davem@davemloft.net>, Takashi Iwai <tiwai@suse.de>

Hi David,

Today's linux-next merge of the firmware tree got a conflict in
firmware/Makefile between commit 06e1f9ffa023c030bc87491e75f625f5da4e7d97
("tehuti: Use request_firmware()") from the net tree and commit
f2fd247da0abaa330c39922aa1f6729eff051f73 ("ALSA: wavefront - Always use 
request_firmware()") from the firmware tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.

David, is there any chance that (some of) these changes could be
distributed to their respective maintainers?

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc firmware/Makefile
index aa2e02d,bf8445e..0000000
--- a/firmware/Makefile
+++ b/firmware/Makefile
@@@ -49,10 -55,9 +55,11 @@@ fw-shipped-$(CONFIG_SND_SB16_CSP) += sb
  				     sb16/ima_adpcm_capture.csp
  fw-shipped-$(CONFIG_SND_YMFPCI) += yamaha/ds1_ctrl.fw yamaha/ds1_dsp.fw \
  				   yamaha/ds1e_ctrl.fw
+ fw-shipped-$(CONFIG_SND_WAVEFRONT) += yamaha/yss225_registers.bin
 +fw-shipped-$(CONFIG_TEHUTI) += tehuti/bdx.bin
  fw-shipped-$(CONFIG_TIGON3) += tigon/tg3.bin tigon/tg3_tso.bin \
  			       tigon/tg3_tso5.bin
 +fw-shipped-$(CONFIG_TYPHOON) += 3com/typhoon.bin
  fw-shipped-$(CONFIG_USB_DABUSB) += dabusb/firmware.fw dabusb/bitstream.bin
  fw-shipped-$(CONFIG_USB_EMI26) += emi26/loader.fw emi26/firmware.fw \
  				  emi26/bitstream.fw

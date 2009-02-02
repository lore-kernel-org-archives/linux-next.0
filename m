From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree with the sound tree
Date: Mon, 2 Feb 2009 16:02:05 +1100
Message-ID: <20090202160205.8d62e871.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51392 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750698AbZBBFCM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2009 00:02:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Krzysztof Helt <krzysztof.h1@wp.pl>, Takashi Iwai <tiwai@suse.de>

Hi David,

Today's linux-next merge of the firmware tree got a conflict in
sound/isa/Kconfig between commit f6c6383502751ceb6f2f3579ad22578ca44f91f5
("ALSA: Turtle Beach Multisound Classic/Pinnacle driver") from the sound
tree and commit f2fd247da0abaa330c39922aa1f6729eff051f73 ("ALSA:
wavefront - Always use request_firmware()") from the firmware tree.

Just overlapping addition/removal.  I fixed it up (see below) and can
carry the fix as necessary.

David, is the above firmware tree commit going anywhere - it has only
been in linux-next since Jan 12, but the commit is dated Aug 28 2008 ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc sound/isa/Kconfig
index 3409677,7658bcd..0000000
--- a/sound/isa/Kconfig
+++ b/sound/isa/Kconfig
@@@ -406,46 -401,5 +406,36 @@@ config SND_WAVEFRON
  	  To compile this driver as a module, choose M here: the module
  	  will be called snd-wavefront.
  
- config SND_WAVEFRONT_FIRMWARE_IN_KERNEL
- 	bool "In-kernel firmware for Wavefront"
- 	depends on SND_WAVEFRONT
- 	default y
- 	help
- 	  Say Y here to include the static firmware for FX DSP built in
- 	  the kernel for the Wavefront driver.  If you choose N here,
- 	  you need to install the firmware files from the
- 	  alsa-firmware package.
- 
 +config SND_MSND_PINNACLE
 +	tristate "Turtle Beach MultiSound Pinnacle/Fiji driver"
 +	depends on X86 && EXPERIMENTAL
 +	select FW_LOADER
 +	select SND_MPU401_UART
 +	select SND_PCM
 +	help
 +	  Say Y to include support for Turtle Beach MultiSound Pinnacle/
 +	  Fiji soundcards.
 +
 +	  To compile this driver as a module, choose M here: the module
 +	  will be called snd-msnd-pinnacle.
 +
 +config SND_MSND_CLASSIC
 +	tristate "Support for Turtle Beach MultiSound Classic, Tahiti, Monterey"
 +	depends on X86 && EXPERIMENTAL
 +	select FW_LOADER
 +	select SND_MPU401_UART
 +	select SND_PCM
 +	help
 +	  Say M here if you have a Turtle Beach MultiSound Classic, Tahiti or
 +	  Monterey (not for the Pinnacle or Fiji).
 +
 +	  See <file:Documentation/sound/oss/MultiSound> for important information
 +	  about this driver.  Note that it has been discontinued, but the
 +	  Voyetra Turtle Beach knowledge base entry for it is still available
 +	  at <http://www.turtlebeach.com/site/kb_ftp/790.asp>.
 +
 +	  To compile this driver as a module, choose M here: the module
 +	  will be called snd-msnd-classic.
 +
  endif	# SND_ISA
  

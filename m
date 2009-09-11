From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: drivers/staging/vme/Kconfig:5:warning: type of 'VME' redefined from
	'boolean' to 'tristate'
Date: Fri, 11 Sep 2009 16:26:36 +0200
Message-ID: <10f740e80909110726x313e3e3coe2321c683163e3a5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f184.google.com ([209.85.222.184]:43442 "EHLO
	mail-pz0-f184.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752109AbZIKO0d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Sep 2009 10:26:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>

http://kisskb.ellerman.id.au/kisskb/buildresult/1221192/:
drivers/staging/vme/Kconfig:5:warning: type of 'VME' redefined from
'boolean' to 'tristate'
drivers/staging/vme/Kconfig:5:warning: type of 'VME' redefined from
'boolean' to 'tristate'

We already have:

arch/m68k/Kconfig:config VME
arch/m68k/Kconfig:      bool "VME (Motorola and BVM) support"
arch/m68k/Kconfig:        Say Y here if you want to build a kernel for
a 680x0 based VME
arch/m68k/Kconfig:      depends on VME
arch/m68k/Kconfig:        Say Y to include support for early Motorola
VME boards.  This will
arch/m68k/Kconfig:      depends on VME
arch/m68k/Kconfig:        Say Y to include support for Motorola VME
boards.  This will build a
arch/m68k/Kconfig:      depends on VME
arch/m68k/Kconfig:        Say Y to include support for VME boards from
BVM Ltd.  This will
arch/m68k/Kconfig:      depends on (AMIGA || ATARI || MAC || SUN3 ||
SUN3X || VME || APOLLO) && (ATARI_MFPSER=y || ATARI_SCC=y || AT
fs/partitions/Kconfig:  default y if VME

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

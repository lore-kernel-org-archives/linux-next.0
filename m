From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mtd tree with Linus' tree
Date: Fri, 27 May 2011 14:00:39 +1000
Message-ID: <20110527140039.9bce4a2d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37846 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751089Ab1E0EAm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 May 2011 00:00:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jamie Iles <jamie@jamieiles.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, Marc Zyngier <Marc.Zyngier@arm.com>, Russell King <rmk@arm.linux.org.uk>

Hi David,

Today's linux-next merge of the mtd tree got a conflict in
drivers/mtd/maps/physmap.c between commit b7281ca2a4b0 ("ARM: 6904/1:
MTD: Add integrator-flash feature to physmap") from Linus' tree and
commit 984e6d8ec5ab ("mtd: physmap: convert to mtd_device_register()")
from the mtd tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/mtd/maps/physmap.c
index 1a9b94f,d205926..0000000
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@@ -92,10 -65,7 +81,8 @@@ static const char *rom_probe_types[] = 
  					"qinfo_probe",
  					"map_rom",
  					NULL };
- #ifdef CONFIG_MTD_PARTITIONS
 -static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
 +static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", "afs",
 +					  NULL };
- #endif
  
  static int physmap_flash_probe(struct platform_device *dev)
  {

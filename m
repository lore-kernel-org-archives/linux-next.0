From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the l2-mtd tree with the mips tree
Date: Fri, 12 Jun 2015 20:50:20 +1000
Message-ID: <1434106220.20648.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52950 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750893AbbFLKu2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Jun 2015 06:50:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>

Hi Brian,

Today's linux-next merge of the l2-mtd tree got a conflict in MAINTAINE=
RS
between commit 68c2d21d0126 "MIPS: BCM47xx: Move NVRAM driver to the
drivers/firmware/" from the mips tree and commit 02787daadbda "MAINTAIN=
ERS: add
entry for new brcmnand/ directory" from the l2-mtd tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

diff --cc MAINTAINERS
index 85dc5bd76c38,ad9f36875372..d848473e184f
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -2320,12 -2257,12 +2320,18 @@@ S:   Supporte
  F:    drivers/gpio/gpio-bcm-kona.c
  F:    Documentation/devicetree/bindings/gpio/gpio-bcm-kona.txt
 =20
 +BROADCOM NVRAM DRIVER
 +M:    Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
 +L:    linux-mips@linux-mips.org
 +S:    Maintained
 +F:    drivers/firmware/broadcom/*
 +
+ BROADCOM STB NAND FLASH DRIVER
+ M:    Brian Norris <computersforpeace@gmail.com>
+ L:    linux-mtd@lists.infradead.org
+ S:    Maintained
+ F:    drivers/mtd/nand/brcmnand/
+=20
  BROADCOM SPECIFIC AMBA DRIVER (BCMA)
  M:    Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
  L:    linux-wireless@vger.kernel.org

cheers

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the mfd tree
Date: Tue, 14 Sep 2010 12:25:10 +1000
Message-ID: <20100914122510.99c3e3b3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Murthy <arun.murthy@stericsson.com>, Samuel Ortiz <sameo@linux.intel.com>, Masayuki Ohtak <masa-korg@dsn.okisemi.com>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/misc/Makefile between commit
03f582a93ecca6e9584b622570022abf08ed03ec ("misc: Add ab8500 pwm driver")
from the mfd tree and commit b6de6c8f5a6fc18c5c67bb4e53f3d0cfd266b07b
("add Packet hub driver for Topcliff Platform controller hub") from the
driver-core tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

P.S. Greg, I noticed that the driver-core patch above does not have a SOB
from its author.

diff --cc drivers/misc/Makefile
index 33bc441,21b4761..0000000
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@@ -35,4 -35,4 +35,5 @@@ obj-y				+= eeprom
  obj-y				+= cb710/
  obj-$(CONFIG_VMWARE_BALLOON)	+= vmware_balloon.o
  obj-$(CONFIG_ARM_CHARLCD)	+= arm-charlcd.o
 +obj-$(CONFIG_AB8500_PWM)	+= ab8500-pwm.o
+ obj-$(CONFIG_PCH_PHUB)		+= pch_phub.o

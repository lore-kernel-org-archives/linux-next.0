From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with the input tree
Date: Wed, 5 Aug 2009 13:31:06 +1000
Message-ID: <20090805133106.03c8e64e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933587AbZHEDbP@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@openedhand.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

Hi Samuel,

Today's linux-next merge of the mfd tree got a conflict in
drivers/input/misc/Kconfig between commit
4832958218f96f98009c5e01729fbe2b48c7124c ("Input: add Blackfin rotary
input driver") from the input tree and commit
f45c2fa48317249892af5b63f4b35c7c90191df3 ("input: Add support for the
WM831x ON pin") from the mfd tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/input/misc/Kconfig
index cbe21bc,c8e7d8a..0000000
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@@ -270,13 -270,14 +270,23 @@@ config INPUT_DM355EV
  	  To compile this driver as a module, choose M here: the
  	  module will be called dm355evm_keys.
  
 +config INPUT_BFIN_ROTARY
 +	tristate "Blackfin Rotary support"
 +	depends on BF54x || BF52x
 +	help
 +	  Say Y here if you want to use the Blackfin Rotary.
 +
 +	  To compile this driver as a module, choose M here: the
 +	  module will be called bfin-rotary.
 +
+ config INPUT_WM831X_ON
+ 	tristate "WM831X ON pin"
+ 	depends on MFD_WM831X
+ 	help
+ 	  Support the ON pin of WM831X PMICs as an input device
+ 	  reporting power button status.
+ 
+ 	  To compile this driver as a module, choose M here: the module
+ 	  will be called wm831x_on.
+ 
  endif

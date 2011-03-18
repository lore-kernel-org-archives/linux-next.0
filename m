From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the spi tree with the mfd tree
Date: Fri, 18 Mar 2011 15:40:17 +1100
Message-ID: <20110318154017.e45aa888.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Denis Turischev <denis@compulab.co.il>, Samuel Ortiz <sameo@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

Hi Grant,

Today's linux-next merge of the spi tree got a conflict in
drivers/gpio/Kconfig between commit 390ff13830e5 ("gpio: Add Tunnel Creek
support to sch_gpio") from the mfd tree and commit 61ab3fe57e45 ("gpio;
Make Intel chipset gpio drivers depend on x86") from the spi tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.  I am assuming that the Tunnel Creek stuff should also depend
on X86?
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpio/Kconfig
index 7ef9108,b46442d..0000000
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@@ -100,8 -100,8 +100,8 @@@ config GPIO_VR41X
  	  Say yes here to support the NEC VR4100 series General-purpose I/O Uint
  
  config GPIO_SCH
 -	tristate "Intel SCH GPIO"
 +	tristate "Intel SCH/TunnelCreek GPIO"
- 	depends on GPIOLIB && PCI
+ 	depends on GPIOLIB && PCI && X86
  	select MFD_CORE
  	select LPC_SCH
  	help

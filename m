From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mux tree with the arm-soc tree
Date: Fri, 31 Mar 2017 15:18:36 +1100
Message-ID: <20170331151836.5d89c03a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the mux tree got conflicts in:

  drivers/Kconfig
  drivers/Makefile

between commit:

  967c9cca2cc5 ("tee: generic TEE subsystem")

from the arm-soc tree and commit:

  1fc1dd988186 ("mux: minimal mux subsystem and gpio-based mux controller")

from the mux tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/Kconfig
index ba2901e76769,a7ea13e1b869..000000000000
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@@ -204,6 -204,6 +204,8 @@@ source "drivers/fpga/Kconfig
  
  source "drivers/fsi/Kconfig"
  
+ source "drivers/mux/Kconfig"
+ 
 +source "drivers/tee/Kconfig"
 +
  endmenu
diff --cc drivers/Makefile
index 5db9aa6beeaf,c0436f6dd5a9..000000000000
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@@ -177,4 -177,4 +177,5 @@@ obj-$(CONFIG_ANDROID)		+= android
  obj-$(CONFIG_NVMEM)		+= nvmem/
  obj-$(CONFIG_FPGA)		+= fpga/
  obj-$(CONFIG_FSI)		+= fsi/
+ obj-$(CONFIG_MULTIPLEXER)	+= mux/
 +obj-$(CONFIG_TEE)		+= tee/

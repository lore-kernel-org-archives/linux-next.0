From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with Linus' tree
Date: Tue, 11 Jul 2017 10:04:25 +1000
Message-ID: <20170711100425.3faaf38b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@imgtec.com>, Tero Kristo <t-kristo@ti.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  drivers/clk/Kconfig

between commit:

  b745c0794e2f ("clk: keystone: Add sci-clk driver support")

from Linus' tree and commit:

  5e2722808156 ("clk: boston: Add a driver for MIPS Boston board clocks")

from the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/clk/Kconfig
index d406b087553f,251a22139e73..000000000000
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@@ -221,7 -219,7 +221,8 @@@ config COMMON_CLK_VC
  
  source "drivers/clk/bcm/Kconfig"
  source "drivers/clk/hisilicon/Kconfig"
+ source "drivers/clk/imgtec/Kconfig"
 +source "drivers/clk/keystone/Kconfig"
  source "drivers/clk/mediatek/Kconfig"
  source "drivers/clk/meson/Kconfig"
  source "drivers/clk/mvebu/Kconfig"

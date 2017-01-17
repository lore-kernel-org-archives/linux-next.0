From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Wed, 18 Jan 2017 09:49:29 +1100
Message-ID: <20170118094929.7d79bb55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Russell King <rmk@armlinux.org.uk>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  arch/arm/mach-ux500/platsmp.c

between commit:

  6996cbb23721 ("ARM: 8641/1: treewide: Replace uses of virt_to_phys with __pa_symbol")

from the arm tree and commit:

  9e634cae7256 ("ARM: ux500: simplify secondary boot")

from the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/mach-ux500/platsmp.c
index 8c8f26389067,e0ee139fdebf..000000000000
--- a/arch/arm/mach-ux500/platsmp.c
+++ b/arch/arm/mach-ux500/platsmp.c
@@@ -92,7 -73,19 +73,19 @@@ static void __init ux500_smp_prepare_cp
  
  static int ux500_boot_secondary(unsigned int cpu, struct task_struct *idle)
  {
- 	wakeup_secondary();
+ 	/*
+ 	 * write the address of secondary startup into the backup ram register
+ 	 * at offset 0x1FF4, then write the magic number 0xA1FEED01 to the
+ 	 * backup ram register at offset 0x1FF0, which is what boot rom code
+ 	 * is waiting for. This will wake up the secondary core from WFE.
+ 	 */
 -	writel(virt_to_phys(secondary_startup),
++	writel(__pa_symbol(secondary_startup),
+ 	       backupram + UX500_CPU1_JUMPADDR_OFFSET);
+ 	writel(0xA1FEED01,
+ 	       backupram + UX500_CPU1_WAKEMAGIC_OFFSET);
+ 
+ 	/* make sure write buffer is drained */
+ 	mb();
  	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
  	return 0;
  }

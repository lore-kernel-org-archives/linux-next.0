From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kspp tree with the arm-soc tree
Date: Wed, 8 Feb 2017 12:34:15 +1100
Message-ID: <20170208123415.35b5425d@canb.auug.org.au>
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
To: Kees Cook <keescook@google.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
List-Id: linux-next.vger.kernel.org

Hi Kees,

Today's linux-next merge of the kspp tree got a conflict in:

  arch/arm/configs/aspeed_g5_defconfig

between commit:

  0e81eb77f5f8 ("ARM: configs: Update Aspeed with new drivers")

from the arm-soc tree and commit:

  0f5bf6d0afe4 ("arch: Rename CONFIG_DEBUG_RODATA and CONFIG_DEBUG_MODULE_RONX")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/configs/aspeed_g5_defconfig
index ae4295ec5c3e,05a16d53d03c..000000000000
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@@ -26,8 -26,6 +26,7 @@@ CONFIG_ARCH_MULTI_V6=
  # CONFIG_ARCH_MULTI_V7 is not set
  CONFIG_ARCH_ASPEED=y
  CONFIG_MACH_ASPEED_G5=y
- CONFIG_DEBUG_RODATA=y
 +CONFIG_VMSPLIT_2G=y
  CONFIG_AEABI=y
  CONFIG_UACCESS_WITH_MEMCPY=y
  CONFIG_SECCOMP=y
@@@ -116,8 -80,8 +115,9 @@@ CONFIG_DEBUG_LL_UART_8250=
  CONFIG_DEBUG_UART_PHYS=0x1e784000
  CONFIG_DEBUG_UART_VIRT=0xe8784000
  CONFIG_EARLY_PRINTK=y
- CONFIG_DEBUG_SET_MODULE_RONX=y
+ CONFIG_STRICT_MODULE_RWX=y
+ CONFIG_STRICT_KERNEL_RWX=y
 +CONFIG_CRYPTO_ECHAINIV=y
  # CONFIG_XZ_DEC_X86 is not set
  # CONFIG_XZ_DEC_POWERPC is not set
  # CONFIG_XZ_DEC_IA64 is not set

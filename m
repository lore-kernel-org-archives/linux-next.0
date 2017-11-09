From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the arm-soc
 tree
Date: Thu, 9 Nov 2017 13:26:32 +1100
Message-ID: <20171109132632.480f1050@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
List-Id: linux-next.vger.kernel.org

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  arch/arm64/boot/dts/amlogic/Makefile

between commit:

  593d311d9f17 ("ARM64: dts: meson-gxm: Add Vega S96 board")

from the arm-soc tree and commit:

  4408a86af32e ("kbuild: handle dtb-y and CONFIG_OF_ALL_DTBS natively in Makefile.lib")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/amlogic/Makefile
index b503e9b00cd3,4eb8f829472e..000000000000
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@@ -22,8 -19,3 +22,4 @@@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-n
  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q200.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
- 
- always		:= $(dtb-y)
- subdir-y	:= $(dts-dirs)
- clean-files	:= *.dtb

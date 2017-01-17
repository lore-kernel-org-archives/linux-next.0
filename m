From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the amlogic tree with the arm-soc tree
Date: Wed, 18 Jan 2017 09:55:31 +1100
Message-ID: <20170118095531.37f33df0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the amlogic tree got a conflict in:

  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi

between commit:

  f7bcd4b6f698 ("ARM64: dts: meson-gxbb-odroidc2: Disable SCPI DVFS")

from the arm-soc tree and commit:

  47961f1353b8 ("ARM64: dts: meson-gx: move the SCPI and SRAM nodes to meson-gx")

from the amlogic tree.

I fixed it up (the latter moved the code modified by the former into
another file, but also incorporated the change from the former) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

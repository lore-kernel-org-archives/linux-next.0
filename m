From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the watchdog tree with the arm-soc tree
Date: Mon, 11 Sep 2017 10:58:40 +1000
Message-ID: <20170911105840.55eee273@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@iguana.be>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Matthias Brugger <mbrugger@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Wim,

Today's linux-next merge of the watchdog tree got a conflict in:

  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt

between commit:

  275e85971b7d ("ARM: mediatek: dts: Cleanup bindings documentation")

from the arm-soc tree and commit:

  e8a7fc711c9a ("dt-bindings: watchdog: mediatek: add support for MediaTek MT7623 and MT7622 SoC")

from the watchdog tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 20ada673ab0c,096bbfbbae1b..000000000000
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@@ -3,9 -3,11 +3,11 @@@ Mediatek SoCs Watchdog time
  Required properties:
  
  - compatible should contain:
 -	* "mediatek,mt2701-wdt" for MT2701 compatible watchdog timers
 -	* "mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
 -	* "mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
 -	* "mediatek,mt6589-wdt" for all compatible watchdog timers (MT2701,
 -		MT6589)
 +	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
++	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
++	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
 +	"mediatek,mt6589-wdt": for MT6589
 +	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
  
  - reg : Specifies base physical address and size of the registers.
  

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mediatek tree with Linus' tree
Date: Wed, 24 Apr 2019 09:09:07 +1000
Message-ID: <20190424090907.4221e701@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/I7hSmkFkp/1rA4Ou4IxaiMY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Erin Lo <erin.lo@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabien Parent <fparent@baylibre.com>
List-Id: linux-next.vger.kernel.org

--Sig_/I7hSmkFkp/1rA4Ou4IxaiMY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mediatek tree got a conflict in:

  Documentation/devicetree/bindings/serial/mtk-uart.txt

between commit:

  898a737c8a43 ("dt-bindings: serial: Add compatible for Mediatek MT8183")

from Linus' tree and commit:

  61a640143f68 ("dt-bindings: serial: mtk-uart: add support for MT8516")

from the mediatek tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/serial/mtk-uart.txt
index bcfb13194f16,ca7e9dc83087..000000000000
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@@ -16,7 -17,7 +17,8 @@@ Required properties
    * "mediatek,mt8127-uart" for MT8127 compatible UARTS
    * "mediatek,mt8135-uart" for MT8135 compatible UARTS
    * "mediatek,mt8173-uart" for MT8173 compatible UARTS
 +  * "mediatek,mt8183-uart", "mediatek,mt6577-uart" for MT8183 compatible =
UARTS
+   * "mediatek,mt8516-uart" for MT8516 compatible UARTS
    * "mediatek,mt6577-uart" for MT6577 and all of the above
 =20
  - reg: The base address of the UART register bank.

--Sig_/I7hSmkFkp/1rA4Ou4IxaiMY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly/mxMACgkQAVBC80lX
0GxRjgf/Y2cCmcpfixc9SDG1DVUNeDtLOm9wRvXAcXb2RpuDfV1Wj+TcM76fMnrK
1DedmtBb3OQ9STbPahjG5zbAocNiUSNBidhqjK5hbirSXIO6vFO8Q7CbdOsdGBtj
wAGhM99DJ+uwNqMMbPeHVLX3EWEO9LgVYF5YFJkJShsDmsbDPggWoYahWowiDRFg
KIl+ZgZgRmX4l7RGeTAMCuzFE1Ck6c/0lEn2zxsgUrXAT7nfx0rmkzK8cXHTufuN
xRx+D//0THDXEgQUXNGpKCYit8n876OT1BWot6IuqzHIgwrKJbf7OFSGI1++FTXM
beJTNp283i7ZCRalwyj+CngRnANrMg==
=3rE4
-----END PGP SIGNATURE-----

--Sig_/I7hSmkFkp/1rA4Ou4IxaiMY--

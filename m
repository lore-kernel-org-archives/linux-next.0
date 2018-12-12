From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the phy-next tree with Linus' tree
Date: Wed, 12 Dec 2018 15:16:47 +1100
Message-ID: <20181212151647.71a5befe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PJBKlUCSWZt2TdamJ_Z6RR_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Evan Green <evgreen@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/PJBKlUCSWZt2TdamJ_Z6RR_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt

between commit:

  7243ec72b902 ("dt-bindings: phy-qcom-qmp: Fix several mistakes from prior=
 commits")

from Linus' tree and commit:

  91fdc9b127c9 ("dt-bindings: phy-qcom-qmp: Fix register underspecification=
")

from the phy-next tree.

I fixed it up (I just used the latter veriosn of the conflicting line)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index fbc198d5dd39,68c67eeef775..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@@ -82,19 -66,23 +78,23 @@@ Required nodes
   - Each device node of QMP phy is required to have as many child nodes as
     the number of lanes the PHY has.
 =20
- Required properties for child node:
+ Required properties for child nodes of PCIe PHYs (one child per lane):
   - reg: list of offset and length pairs of register sets for PHY blocks -
- 	- index 0: tx
- 	- index 1: rx
- 	- index 2: pcs
- 	- index 3: pcs_misc (optional)
+ 	tx, rx, pcs, and pcs_misc (optional).
+  - #phy-cells: must be 0
 =20
+ Required properties for a single "lanes" child node of non-PCIe PHYs:
+  - reg: list of offset and length pairs of register sets for PHY blocks
+ 	For 1-lane devices:
+ 		tx, rx, pcs, and (optionally) pcs_misc
+ 	For 2-lane devices:
+ 		tx0, rx0, pcs, tx1, rx1, and (optionally) pcs_misc
   - #phy-cells: must be 0
 =20
- Required properties child node of pcie and usb3 qmp phys:
+ Required properties for child node of PCIe and USB3 qmp phys:
   - clocks: a list of phandles and clock-specifier pairs,
  	   one for each entry in clock-names.
 - - clock-names: Must contain following for pcie and usb qmp phys:
 + - clock-names: Must contain following:
  		 "pipe<lane-number>" for pipe clock specific to each lane.
   - clock-output-names: Name of the PHY clock that will be the parent for
  		       the above pipe clock.
@@@ -103,12 -90,13 +102,15 @@@
  		- "pcie20_phy0_pipe_clk"	Pipe Clock parent
  			(or)
  		  "pcie20_phy1_pipe_clk"
+  - #clock-cells: must be 0
+     - Phy pll outputs pipe clocks for pipe based PHYs. These clocks are t=
hen
+       gate-controlled by the gcc.
 =20
 +Required properties for child node of PHYs with lane reset, AKA:
 +	"qcom,msm8996-qmp-pcie-phy"
   - resets: a list of phandles and reset controller specifier pairs,
  	   one for each entry in reset-names.
 - - reset-names: Must contain following for pcie qmp phys:
 + - reset-names: Must contain following:
  		 "lane<lane-number>" for reset specific to each lane.
 =20
  Example:

--Sig_/PJBKlUCSWZt2TdamJ_Z6RR_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwQi68ACgkQAVBC80lX
0Gzwngf/ZZPmjE7xRMcSDoQJjc/dWgYHHJkDdssYdbYAIt5kaFooFaw6h/cEWXk1
fTX1HrC/XcpN2FmOi1mn4p6sMnlETRDndz38mkKYAxZbR48dNLhIl7+A0pawYe8/
HaLdXsNfeRlKElA9CKA5iy0AxTr0LJ6VXO7uV/d6BCuPxe6ZBoto6HF3tIsaiV9l
icYfdROii+W4mtasD9VscRIOHJLyVU55pqmHjXERiQV8dM9qyf4fLNRyhg7sSjL6
5s2DYzPlIL1uQpwQgvre7aHssxmZvFuFgyRgSyyY933pJkydoQQhAt6//o/4P/ol
zU+kyhwA63a3xRhFNW0vo9Rp9Xsvmw==
=wdjE
-----END PGP SIGNATURE-----

--Sig_/PJBKlUCSWZt2TdamJ_Z6RR_--

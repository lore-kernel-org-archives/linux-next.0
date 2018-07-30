From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the net-next
 tree
Date: Mon, 30 Jul 2018 14:37:22 +1000
Message-ID: <20180730143645.7bcd563b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bvAwNpaLdF0NX7E6RjKubJt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anssi Hannula <anssi.hannula@bitwise.fi>
List-Id: linux-next.vger.kernel.org

--Sig_/bvAwNpaLdF0NX7E6RjKubJt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/net/can/xilinx_can.txt

between commit:

  7cb0f17f5252 ("dt-bindings: can: xilinx_can: add Xilinx CAN FD bindings")

from the net-next tree and commit:

  791d3ef2e111 ("dt-bindings: remove 'interrupt-parent' from bindings")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/net/can/xilinx_can.txt
index ae5c07e96ad5,9264d2f6a89d..000000000000
--- a/Documentation/devicetree/bindings/net/can/xilinx_can.txt
+++ b/Documentation/devicetree/bindings/net/can/xilinx_can.txt
@@@ -2,26 -2,19 +2,25 @@@ Xilinx Axi CAN/Zynq CANPS controller De
  ---------------------------------------------------------
 =20
  Required properties:
 -- compatible		: Should be "xlnx,zynq-can-1.0" for Zynq CAN
 -			  controllers and "xlnx,axi-can-1.00.a" for Axi CAN
 -			  controllers.
 -- reg			: Physical base address and size of the Axi CAN/Zynq
 -			  CANPS registers map.
 +- compatible		: Should be:
 +			  - "xlnx,zynq-can-1.0" for Zynq CAN controllers
 +			  - "xlnx,axi-can-1.00.a" for Axi CAN controllers
 +			  - "xlnx,canfd-1.0" for CAN FD controllers
 +- reg			: Physical base address and size of the controller
 +			  registers map.
  - interrupts		: Property with a value describing the interrupt
  			  number.
- - interrupt-parent	: Must be core interrupt controller
 -- clock-names		: List of input clock names - "can_clk", "pclk"
 -			  (For CANPS), "can_clk" , "s_axi_aclk"(For AXI CAN)
 +- clock-names		: List of input clock names
 +			  - "can_clk", "pclk" (For CANPS),
 +			  - "can_clk", "s_axi_aclk" (For AXI CAN and CAN FD).
  			  (See clock bindings for details).
  - clocks		: Clock phandles (see clock bindings for details).
 -- tx-fifo-depth		: Can Tx fifo depth.
 -- rx-fifo-depth		: Can Rx fifo depth.
 +- tx-fifo-depth		: Can Tx fifo depth (Zynq, Axi CAN).
 +- rx-fifo-depth		: Can Rx fifo depth (Zynq, Axi CAN, CAN FD in
 +                          sequential Rx mode).
 +- tx-mailbox-count	: Can Tx mailbox buffer count (CAN FD).
 +- rx-mailbox-count	: Can Rx mailbox buffer count (CAN FD in mailbox Rx
 +			  mode).
 =20
 =20
  Example:

--Sig_/bvAwNpaLdF0NX7E6RjKubJt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltelgIACgkQAVBC80lX
0Gz2BggAmD+uRdeDhdmU9aBIGayob3Pg4iKHJRCNBE/cXAiogMJOQfivCGL9So05
9pO7aQ5s5opiCB+jAEPC8yUfGI7CvBaih6zZ2lEvN4pIF4qoEm2NOW55KMFTbbsf
vag73QmCTnBdcULcOmT3GeL3TNf+rC1VgMvwhoetf6Qi1o2+lL0vZvQ+a3HnAR9n
NBM6126sSWPTIbVkELdSHWvtd382xVCDYQebeQDfRbgHQWTdklcgKteAA6F9OxEp
KYjTQ/f2m6/3N9iAkRvt0YnLGKijeVYz3V1gIei+NYm8kGzgE9RU5kWWTZaRy8bt
z/P+MpJUz7yrr7+sGUuNUyx8SkTkDQ==
=JtaR
-----END PGP SIGNATURE-----

--Sig_/bvAwNpaLdF0NX7E6RjKubJt--

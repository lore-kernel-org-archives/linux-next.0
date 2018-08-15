From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 net-next tree
Date: Wed, 15 Aug 2018 13:14:02 +1000
Message-ID: <20180815131402.271492d4@canb.auug.org.au>
References: <20180730143645.7bcd563b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eRuCqZV7WcAk3=1A0PnXURk"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180730143645.7bcd563b@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Rob Herring <robherring2@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anssi Hannula <anssi.hannula@bitwise.fi>
List-Id: linux-next.vger.kernel.org

--Sig_/eRuCqZV7WcAk3=1A0PnXURk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 30 Jul 2018 14:37:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/net/can/xilinx_can.txt
>=20
> between commit:
>=20
>   7cb0f17f5252 ("dt-bindings: can: xilinx_can: add Xilinx CAN FD bindings=
")
>=20
> from the net-next tree and commit:
>=20
>   791d3ef2e111 ("dt-bindings: remove 'interrupt-parent' from bindings")
>=20
> from the devicetree tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc Documentation/devicetree/bindings/net/can/xilinx_can.txt
> index ae5c07e96ad5,9264d2f6a89d..000000000000
> --- a/Documentation/devicetree/bindings/net/can/xilinx_can.txt
> +++ b/Documentation/devicetree/bindings/net/can/xilinx_can.txt
> @@@ -2,26 -2,19 +2,25 @@@ Xilinx Axi CAN/Zynq CANPS controller De
>   ---------------------------------------------------------
>  =20
>   Required properties:
>  -- compatible		: Should be "xlnx,zynq-can-1.0" for Zynq CAN
>  -			  controllers and "xlnx,axi-can-1.00.a" for Axi CAN
>  -			  controllers.
>  -- reg			: Physical base address and size of the Axi CAN/Zynq
>  -			  CANPS registers map.
>  +- compatible		: Should be:
>  +			  - "xlnx,zynq-can-1.0" for Zynq CAN controllers
>  +			  - "xlnx,axi-can-1.00.a" for Axi CAN controllers
>  +			  - "xlnx,canfd-1.0" for CAN FD controllers
>  +- reg			: Physical base address and size of the controller
>  +			  registers map.
>   - interrupts		: Property with a value describing the interrupt
>   			  number.
> - - interrupt-parent	: Must be core interrupt controller
>  -- clock-names		: List of input clock names - "can_clk", "pclk"
>  -			  (For CANPS), "can_clk" , "s_axi_aclk"(For AXI CAN)
>  +- clock-names		: List of input clock names
>  +			  - "can_clk", "pclk" (For CANPS),
>  +			  - "can_clk", "s_axi_aclk" (For AXI CAN and CAN FD).
>   			  (See clock bindings for details).
>   - clocks		: Clock phandles (see clock bindings for details).
>  -- tx-fifo-depth		: Can Tx fifo depth.
>  -- rx-fifo-depth		: Can Rx fifo depth.
>  +- tx-fifo-depth		: Can Tx fifo depth (Zynq, Axi CAN).
>  +- rx-fifo-depth		: Can Rx fifo depth (Zynq, Axi CAN, CAN FD in
>  +                          sequential Rx mode).
>  +- tx-mailbox-count	: Can Tx mailbox buffer count (CAN FD).
>  +- rx-mailbox-count	: Can Rx mailbox buffer count (CAN FD in mailbox Rx
>  +			  mode).
>  =20
>  =20
>   Example:

This is now a conflict between Linus' tree and the net-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/eRuCqZV7WcAk3=1A0PnXURk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltzmnoACgkQAVBC80lX
0GwsfAf/QBzY8MOdmPMAIi1qVMd2lEB4oHaLJedfvRyg713C/dLjcgrOgcCPQkZZ
7iCVfNpM1fSzd0lgqKznd3UaCvYGLw+wMo1FvEiXu9LFdyyTTt40ZyH8uVSyS/k6
qeKdtItoKAEtrrN4A9qzbeAevNWu4MeVIPgRajcl/dJt9lQpqAl/IgCR4r0+tAQh
Z7OPmuCebxjkScS6geZ7mCaOhD7uM0fM+HwHrNgygtXRRAg0Abk3CKXN7yn8Dize
nRwR2lwGp/Ls7w+FAwHvvdTlftxNBXlzW7dLVS9LsGx79/eLloXiFB6BOUgTsAqJ
FZHOhSKvVCmDx4k+t+eQfkrMCASgrg==
=pSFu
-----END PGP SIGNATURE-----

--Sig_/eRuCqZV7WcAk3=1A0PnXURk--

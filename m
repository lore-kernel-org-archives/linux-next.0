From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pinctrl tree with the devicetree
 tree
Date: Tue, 31 Jul 2018 15:42:43 +1000
Message-ID: <20180731154243.203068c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2n_oiD8D16eSY/rV4f/cylq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robherring2@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ludovic Barre <ludovic.barre@st.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2n_oiD8D16eSY/rV4f/cylq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pinctrl tree got a conflict in:

  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt

between commit:

  791d3ef2e111 ("dt-bindings: remove 'interrupt-parent' from bindings")

from the devicetree tree and commit:

  de1d08b22974 ("dt-bindings: pinctrl: add syscfg mask parameter")

from the pinctrl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
index a8bb36b4f9fd,046a3de026d4..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
@@@ -37,9 -37,12 +37,10 @@@ Required properties
 =20
  Optional properties:
   - reset:	  : Reference to the reset controller
-  - st,syscfg: Should be phandle/offset pair. The phandle to the syscon no=
de
-    which includes IRQ mux selection register, and the offset of the IRQ m=
ux
-    selection register.
 - - interrupt-parent: phandle of the interrupt parent to which the external
 -   GPIO interrupts are forwarded to.
+  - st,syscfg: Should be phandle/offset/mask.
+ 	-The phandle to the syscon node which includes IRQ mux selection registe=
r.
+ 	-The offset of the IRQ mux selection register
+ 	-The field mask of IRQ mux, needed if different of 0xf.
   - gpio-ranges: Define a dedicated mapping between a pin-controller and
     a gpio controller. Format is <&phandle a b c> with:
  	-(phandle): phandle of pin-controller.

--Sig_/2n_oiD8D16eSY/rV4f/cylq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltf9tMACgkQAVBC80lX
0Gy3qggAmTga7himmgQEmBYbj7JanhYTvlGJoJR4xePb0gWwOWLq4WZLeXRwtWkk
et/P6vqqpiDwbaReYYkxbMKMCFBRQefRTHq9c3W/pgsMX5GzUHl935kmywQPs7xf
rSm0dhMvqucS0FYPMMkUaswfk/JHJvLWyAcZpoJ9MHoNj8xfpst9wRhLjR/hVU0U
cvO748FKhreiQa6YOPpviHdjpmHjzbTQbqDQ0ZGTrxILv6up8POQvNCI8pKGDDLM
rKB231C/qz+SQSvFYuq2AAfkVxKSOyZ20CBSfYW3BpkoC+NenSAVrS60sMhlhloV
BN7XpsABC4XOq0U3rer1gUkjsdZF1w==
=7UXy
-----END PGP SIGNATURE-----

--Sig_/2n_oiD8D16eSY/rV4f/cylq--

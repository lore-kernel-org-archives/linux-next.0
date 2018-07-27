From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the devicetree
 tree
Date: Fri, 27 Jul 2018 17:53:13 +1000
Message-ID: <20180727175300.0a1fb512@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WNBfMglvghU829apFzZsnTg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Rob Herring <robherring2@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Brian Masney <masneyb@onstation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/WNBfMglvghU829apFzZsnTg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  Documentation/devicetree/bindings/iio/pressure/bmp085.txt

between commit:

  791d3ef2e111 ("dt-bindings: remove 'interrupt-parent' from bindings")

from the devicetree tree and commit:

  d2b863baf1c7 ("iio: pressure: bmp280: remove unused options from device t=
ree documentation")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/iio/pressure/bmp085.txt
index 5498b0688b6f,abcab02504fb..000000000000
--- a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
+++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
@@@ -8,10 -8,7 +8,6 @@@ Required properties
    "bosch,bme280"
 =20
  Optional properties:
- - chip-id: configurable chip id for non-default chip revisions
- - temp-measurement-period: temperature measurement period (milliseconds)
- - default-oversampling: default oversampling value to be used at startup,
-   value range is 0-3 with rising sensitivity.
 -- interrupt-parent: should be the phandle for the interrupt controller
  - interrupts: interrupt mapping for IRQ
  - reset-gpios: a GPIO line handling reset of the sensor: as the line is
    active low, it should be marked GPIO_ACTIVE_LOW (see gpio/gpio.txt)

--Sig_/WNBfMglvghU829apFzZsnTg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltaz2kACgkQAVBC80lX
0GypHwf8DfJTFkjZktIrpfFPyhqZ9GIkAEAQUTpP1FgzxJTLwoomihxtC8k4uR06
pZt8dDC6cXNByDJNSsqOqm6Dc7e4Sq23vicRLsCoRPXCM/DAquPaze530B7aEfL5
TtLg9KU23rwIPi1MgoFvU/SYCvwNDAfjS78aL2Bx1kSHaAV5HQYyTYiLBTnDICht
IiiKch1pPerr18FXrLudZuqzKJLnWFxCfGhrg5VcQqcn1nV6p4S10C49pw+dgvoO
ezJs6abFxJYnRD3zvG28wRTo73MGYOibdMV85KykhJ6rL3gy0QaNGhOM37WQxcAa
JgOrG7Q1oQRk5zzt1A0NixlOKisusg==
=vSgt
-----END PGP SIGNATURE-----

--Sig_/WNBfMglvghU829apFzZsnTg--

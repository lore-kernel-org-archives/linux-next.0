From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the input tree
Date: Thu, 3 May 2012 14:44:21 +1000
Message-ID: <20120503144421.bce525fdec4a9b2d3b7557d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__3_May_2012_14_44_21_+1000_sfomwIAOppHfWH=Y"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Chris Bagwell <chris@cnpbagwell.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__3_May_2012_14_44_21_+1000_sfomwIAOppHfWH=Y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/input/tablet/wacom_wac.c between commit eb71d1bb270e ("Input:
wacom - use dev_xxx() instead of naked printk()s and dbg()s") from the
input tree and commit 3b6aee237e88 ("USB: wacom: remove dbg() usage")
from the usb tree.

I just used the input tree's version (which used "input->dev.parent"
instead of "&input->dev").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__3_May_2012_14_44_21_+1000_sfomwIAOppHfWH=Y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPog0lAAoJEECxmPOUX5FEQykP/0gjfYU6vrTc/ujsW3Er67nN
jVa/WydV725yXPERVbIvTUg9LV72zc3mqBSX3+xGrLxTpDCu+KMj3KtGaahHpWmT
L0J7EPl/5V0gCLeXqjwn1u015AuZmobIathTse8XXjYxQUxsi7pTb53hA+pieOhZ
wKDkJoxkH4+hSSFofX6HSa2jwRcMVNNKzq7bNWOVXr5vBAx0zARCuXGskR7crT3X
3j9cySm4RgBkLQw3Ek1v0OaVHiEsXVerMrHD2C3gf7vASuFHi7Cddg0u4uaN3HMj
blMjxi4iKbGOP+2DoDAhAVKzyYdFfxJhCWZo5VvHaZ41xGSB/moID/Z383Bm+A9f
TKOfxpAojPoffgEZ3x2rEohNsj26Ms4RXG1MVUQjZcaVtT3qyg2DL6FUVgBo69Q6
oALDqYEHHL0A2naPq9VYabhDzWwNK3ADxbAeELv8FtE14r8HZaKIJDZw5hXgFhD4
FhCw0S+IpOFgtRuzdil8kPzP2D1ZfabpPtSZs2yKoPVxThu86NN63+BKOEoYaP5n
mR6PM7ygR/VpieLKgdSxo7vy5C4HYFdMH35Lp3S5BDceAm6UwskKhFF9PDUbQhNk
Xa6TRkgXha5GtdrNVcyCkGq9NIuXVUohdqyooxbsTRopEJAnZJNgwM5sAWV0poH8
fPWf7yfFTKX+TS82TSah
=lKa6
-----END PGP SIGNATURE-----

--Signature=_Thu__3_May_2012_14_44_21_+1000_sfomwIAOppHfWH=Y--

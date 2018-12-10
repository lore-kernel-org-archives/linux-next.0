From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the pm tree
Date: Mon, 10 Dec 2018 16:14:54 +1100
Message-ID: <20181210161454.1c8ca97f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GFox2QnFl7jy/bYo5QoCNtH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/GFox2QnFl7jy/bYo5QoCNtH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/base/platform.c
u
between commit:

  2d51ac9086fd ("driver core: platform: Remove duplicated device_remove_pro=
perties() call")

from the pm tree and commit:

  99fef587ff98 ("driver core: platform: Respect return code of platform_dev=
ice_register_full()")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/base/platform.c
index 0fb5f140f1b0,e1ba610482c0..000000000000
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@@ -447,7 -447,8 +447,7 @@@ void platform_device_del(struct platfor
  {
  	int i;
 =20
- 	if (pdev) {
+ 	if (!IS_ERR_OR_NULL(pdev)) {
 -		device_remove_properties(&pdev->dev);
  		device_del(&pdev->dev);
 =20
  		if (pdev->id_auto) {

--Sig_/GFox2QnFl7jy/bYo5QoCNtH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwN9k4ACgkQAVBC80lX
0GzwiQf9F94ki0jSuhlmKg36TIsKQWGgSgfPcxiJCNldyURKVy06OvL22wOB+9Bv
dGxV3LK3s5JbwzAP1lw0i52RhY8nHt4Nz0j0xwZkoVM6B6igQLkeJOfXApzed4W0
NWCYcxMn1qaDLL3nK4H+a2PlwmU+6X6LV0XcwWJ4QOKy5Qo8Dyy8FwLfvA2QSO/D
Qb13eAZhwH2PDNX1YDMy+3RAdD14yNJVZDHhElsM4tGJyOWVez49ATLoTztFkbM+
w1Y9PvguyUGrbgzNL03nkyl10NqFoAiHyCOB9n2eNXWM6EzrJAjwrVcPVi/jDGY9
i/9PH4V0OfnAbhvzK47WN8sJezTSdQ==
=INHs
-----END PGP SIGNATURE-----

--Sig_/GFox2QnFl7jy/bYo5QoCNtH--

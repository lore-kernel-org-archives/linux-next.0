From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Mon, 8 Apr 2019 13:02:12 +1000
Message-ID: <20190408130212.0a41f2a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p70eTziV7_X5O6WDD_8LHup"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-next.vger.kernel.org

--Sig_/p70eTziV7_X5O6WDD_8LHup
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/iio/industrialio-buffer.c

between commit:

  20ea39ef9f2f ("iio: Fix scan mask selection")

from the staging.current tree and commit:

  3862828a903d ("iio: buffer: Switch to bitmap_zalloc()")

from the staging tree.

I fixed it up (I just used the staging tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/p70eTziV7_X5O6WDD_8LHup
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyqubQACgkQAVBC80lX
0GyEVwf+L3iLA/ah+KrLo74edL+x9cSVgb1NT/g2yBFQYdp+cA1ZMoLw280rsvhN
Iq6qti5DUj/Zi2XxWN+MFVyyMUBHEtU7natiLK7N9uApcodg7uR3/wU34vmUQ6Ci
3W5rxgzSjyX4ZQ4aCT6KDTcDsZwqEgd49LQeg9E3VrDJAxDI0orP9gM4Vh98zA5Y
c2zk58fu3qQYRctdY6UnGVmHUc5/l0WTc27LWxV7wlLP5f11DJq35Rl+0YE2Nxrf
fktymUWXQOEoxOZF0CF/3nHWueXCHudeDh0uCdZkH2GrXHw5I3r7Q2YswENa4Nhp
HW12SJUlC9sQmMewXecNK6mb0yuxFg==
=7ixT
-----END PGP SIGNATURE-----

--Sig_/p70eTziV7_X5O6WDD_8LHup--

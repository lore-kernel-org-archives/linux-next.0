From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xarray tree with the nvdimm tree
Date: Mon, 23 Jul 2018 16:51:34 +1000
Message-ID: <20180723165115.4c96278b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/arOsxl+6MdhuZX6xEIj6HGW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>, Dan Williams <dan.j.williams@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ross Zwisler <zwisler@kernel.org>, Dave Jiang <dave.jiang@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/arOsxl+6MdhuZX6xEIj6HGW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

Today's linux-next merge of the xarray tree got a conflict in:

  MAINTAINERS

between commits:

  30153e5ba54d ("MAINTAINERS: update Ross Zwisler's email address")
  212a28b4dae9 ("MAINTAINERS: Add Jan Kara for filesystem DAX")

from the nvdimm tree and commit:

  40c8f8eed61c ("Update email address")

from the xarray tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 7afb9ad5a85c,9bcfd5caa248..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -4330,9 -4272,8 +4330,9 @@@ S:	Maintaine
  F:	drivers/i2c/busses/i2c-diolan-u2c.c
 =20
  FILESYSTEM DIRECT ACCESS (DAX)
- M:	Matthew Wilcox <mawilcox@microsoft.com>
+ M:	Matthew Wilcox <willy@infradead.org>
 -M:	Ross Zwisler <ross.zwisler@linux.intel.com>
 +M:	Ross Zwisler <zwisler@kernel.org>
 +M:	Jan Kara <jack@suse.cz>
  L:	linux-fsdevel@vger.kernel.org
  S:	Supported
  F:	fs/dax.c

--Sig_/arOsxl+6MdhuZX6xEIj6HGW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltVevYACgkQAVBC80lX
0GxIwAf9E1gQXy0MwWvVyOuJNlIoZlv+8GrlQIJLmNT39iq712spd8zAonNFnRCP
iqOfKQSWkCVkDKwInuyR9m5lpnyEGdVS0FW8bjOg7t9DV2ZSmf32dKmwNmNW3UaL
g3d6S92y83mAGzQYgEtND4piqoLBjR/sA4gnepxG2A3zC+PeB3sOoCZswKqQ3UkO
96kY4JdbiknwtpGdzmf54vcidPwjarIHrPqSq/CcQW22qfiUo71VH53or+T3iDg9
uhhXlK+iTcY+qiSO6ezXkwI+watkFbiYB/CZvAIXYJitfgsNbPUaSXY5spliZQzc
PHuafseGslugf0Jqx/T1FuoE3eWygw==
=LsyE
-----END PGP SIGNATURE-----

--Sig_/arOsxl+6MdhuZX6xEIj6HGW--

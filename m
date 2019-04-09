From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the printk tree with Linus' tree
Date: Wed, 10 Apr 2019 09:24:07 +1000
Message-ID: <20190410092407.4ed718b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GPuOcJ0TjSNjC=9LYTU4wu6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Joe Perches <joe@perches.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/GPuOcJ0TjSNjC=9LYTU4wu6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the printk tree got conflicts in:

  drivers/base/power/main.c

between commit:

  7a5bd1279bce ("PM: Add and use pr_fmt()")

from Linus' tree and commit:

  d75f773c86a2 ("treewide: Switch printk users from %pf and %pF to %ps and =
%pS, respectively")

from the printk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/base/power/main.c
index f80d298de3fa,c88f56b9ae5b..000000000000
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@@ -2063,7 -2062,7 +2063,7 @@@ EXPORT_SYMBOL_GPL(dpm_suspend_start)
  void __suspend_report_result(const char *function, void *fn, int ret)
  {
  	if (ret)
- 		pr_err("%s(): %pF returns %d\n", function, fn, ret);
 -		printk(KERN_ERR "%s(): %pS returns %d\n", function, fn, ret);
++		pr_err("%s(): %pS returns %d\n", function, fn, ret);
  }
  EXPORT_SYMBOL_GPL(__suspend_report_result);
 =20

--Sig_/GPuOcJ0TjSNjC=9LYTU4wu6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlytKZcACgkQAVBC80lX
0GyH/gf/fuxtr4BM8vb+NfNB6K8sffpJAwGRe3IaLYujL4ud+5AQzR+pyTlerQRO
VYM4KBB+XnpNdbWGiMPx1d+BWZSHnWYRiw3VPIDaAIH3U9SG2+xrdZuXzSTjchQ/
vgG10U1xK1dVR89o3VralZFrkgeWGDGIWVWcZgR6AP9ylTWQqqrub2fjVhpF2QJZ
p8noJlmZdRT5Eidu/5oo/qOnKf2pQUnYxAYHY/qvDLVtZLDMOB4DC9HBcsWazfcG
2PVX2jC6CMBwznlXjqPuQBfZ2yKE9NYJTGzV79joTfyUjKCjOTCDnayI59mCkMZ6
NTVBmFRZsBF3jB9mB6WE44cmGDlerQ==
=81Gy
-----END PGP SIGNATURE-----

--Sig_/GPuOcJ0TjSNjC=9LYTU4wu6--

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xarray tree with Linus' tree
Date: Tue, 2 Oct 2018 16:39:34 +1000
Message-ID: <20181002163934.32aeee62@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vw9bzuR363NXV3RCgNa3_ua"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Dan Williams <dan.j.williams@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/vw9bzuR363NXV3RCgNa3_ua
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

Today's linux-next merge of the xarray tree got a conflict in:

  fs/dax.c

between commit:

  f52afc93cd01 ("dax: Fix deadlock in dax_lock_mapping_entry()")

from Linus' tree and commit:

  a31521132da6 ("dax: Convert dax_lock_mapping_entry to XArray")

from the xarray tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/vw9bzuR363NXV3RCgNa3_ua
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluzEqYACgkQAVBC80lX
0Gy1owf7BJ3gob7WbtYou4hmlpB0yfKArPQ1QJonX0fV4550sz59XJ209qpSodo+
++DdNXeUjFsrgPdkHjDKCdOw3GP78UVCbXXPrueHWe8VmrfQuo+UMLHEPnXwFLQL
fnDCNLQUhRweh037pXLIihU8xAmVxiyyaBys48EV04/CnWMqCafzP4hTeMurKUvT
HyxWDjEy82jfuSfYkluFJkwzyqPFnB97GPXCUnFqIy5TUkn+VwuPwTH85PhVVJmU
cYuRKWdTzDUC2exQjqte2EHmgTMDRN8EzgTmv/n7nO0ycnI1sXeT/4YhIC+kVERr
xlSPo9Ce6QELPP8O1Rz+3cKw3uyFNg==
=ReJk
-----END PGP SIGNATURE-----

--Sig_/vw9bzuR363NXV3RCgNa3_ua--

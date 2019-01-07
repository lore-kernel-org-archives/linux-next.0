From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Mon, 7 Jan 2019 13:16:00 +1100
Message-ID: <20190107131600.4a33b1df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IgU6laMv6xfhT4VrJeoT8Ra"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huang Ying <ying.huang@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/IgU6laMv6xfhT4VrJeoT8Ra
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/mincore.c

between commit:

  574823bfab82 ("Change mincore() to count "mapped" pages rather than "cach=
ed" pages")

from Linus' tree and commit:

  86ee23ad82b6 ("mm: fix race between swapoff and mincore")

from the akpm-current tree.

I fixed it up (the former removed the code modified by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/IgU6laMv6xfhT4VrJeoT8Ra
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwytmAACgkQAVBC80lX
0GysVgf+JzcYJQ9CEc5VC9M/QTL9a5C5y3Q7wkeshfYzFj/3ybJLRkL+4cM/Gl1Z
yGafNUEWL2WJkmYEx/Q+g4jPHHM0T4M/rlBafnJXwCHqsBYqGMNi+pWh+BYH1ILI
p0JnZ6GUHiJnIKPd0NwmhRuCMruZmlF0RfzwrQa7kVRou49WOCMuIouXZAx/vLxi
oA991CsB04TnWzunukLgVVEsvyo25Fv/8oQkf7M6mHg969Oy7nZDQnCok9a76RqQ
SFCD5ogf3Ckx1w/q2A3EWOGCUreDRPF+t/u4gIR+3R8BPQx5ywEDTkQs1GRw0qMA
jnaa06WkGySakwefcMQH9fpvBX0Ygw==
=9RDF
-----END PGP SIGNATURE-----

--Sig_/IgU6laMv6xfhT4VrJeoT8Ra--

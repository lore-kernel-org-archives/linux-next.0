From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the amdgpu
 tree
Date: Tue, 19 Mar 2019 15:24:03 +1100
Message-ID: <20190319152403.41570130@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j+tJL_kw4Tm17VEcFezTcpn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/j+tJL_kw4Tm17VEcFezTcpn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/hmm.c

between commit:

  e811b0a79998 ("mm/hmm: use reference counting for HMM struct")

from the amdgpu tree and commit:

  e0ed7d6bb0c5 ("mm/hmm: use reference counting for HMM struct")

and following commits from the akpm-current tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/j+tJL_kw4Tm17VEcFezTcpn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyQbuMACgkQAVBC80lX
0Gyb7Qf/TQxNnjwXMss+AiF6aYhuzG5NrAZ61t/8/IXFdIFIJGBnhSGBBvc0WlzJ
KFc4XPYkw5aO/9b0BD1uRmv3dQhm63VZfMzROUmMO13moylM+YqafQXR5u0SOQLT
74XElhfHBsrsGpv5kkOjF2NuwIChZaijGOUzNQsjmbZ+2ZF+Il4XqEh16pIdGED8
OzFsDDG8E4owTj8bYn6OQYhtaG6uB3Z4xJ2Bfc/DkZ0wSyBVfLhR1XjsCHNA6mK6
NecCGHcyBVhjQsEA3lAgagvbqlMRHOP4lVMigGTXIiClvwtglfibc7D3WdG41cAr
yfYqt4W/Aqyo4TQJPD0VMxrBOXmf9A==
=Yx/A
-----END PGP SIGNATURE-----

--Sig_/j+tJL_kw4Tm17VEcFezTcpn--

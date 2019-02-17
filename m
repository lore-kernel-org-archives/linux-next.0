From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the net tree
Date: Mon, 18 Feb 2019 00:52:03 +1100
Message-ID: <20190218005203.5ac3473e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VA06HLo6cQnKKBHv6kwGPJ2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hauke Mehrtens <hauke.mehrtens@intel.com>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/VA06HLo6cQnKKBHv6kwGPJ2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a40061ea2e39 ("net: systemport: Fix reception of BPDUs")

Fixes tag

  Fixes: 4e8aedfe78c7 ("net: systemport: Turn on offloads by default")

has these problem(s):

  - Target SHA1 does not exist
    Did you mean

  Fixes: b5061778f822 ("net: systemport: Turn on offloads by default")?

In commit

  3b89ea9c5902 ("net: Fix for_each_netdev_feature on Big endian")

Fixes tag

  Fixes: fd867d51f ("net/core: generic support for disabling netdev feature=
s down stack")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/VA06HLo6cQnKKBHv6kwGPJ2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxpZwMACgkQAVBC80lX
0GxBsgf9EBROBBV550yn6EKnHtKW6p8tbXNFQU5KQJ+kyQ95gXzcRGnmKkb7n9MV
6T3IxbISKBxrJqdxXf9lKJf07JidLT+hI2eb5aCeEqwxZ1P2ZfcGcLBDHatZqrpq
ewgksDmeJRhkdsIwE8DnSz2YP03MaDIbcUCpNAgVUmMIscB3czbqKdtgj/kouRYc
GZJj2UlK7ESN05SR5Rp3zvx8qBmdqAOY32lfHyJS4uIWhr9m3TbPQg1sLXYE3kFS
nLFwsqeSYAD5tiXaBbI/sSkGJ2yrUPFbRzlCurqou60iGknasv9Dj3XIxPMIWHwX
XNv3O9czCbTQxumnSPF/us2dvGpjdw==
=saU4
-----END PGP SIGNATURE-----

--Sig_/VA06HLo6cQnKKBHv6kwGPJ2--

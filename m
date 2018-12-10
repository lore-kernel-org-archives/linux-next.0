From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the crypto tree
Date: Mon, 10 Dec 2018 15:47:44 +1100
Message-ID: <20181210154744.3b35b1c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Sp=m+yLKQPSA2bvAXElh/JG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paulo Flabiano Smorigo <pfsmorigo@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Sp=m+yLKQPSA2bvAXElh/JG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  MAINTAINERS

between commit:

  c97e4df573f2 ("MAINTAINERS: change NX/VMX maintainers")

from the crypto tree and commit:

  1dfddcdb95c4 ("MAINTAINERS: Update from @linux.vnet.ibm.com to @linux.ibm=
.com")

from the rcu tree.

I fixed it up (I used the crypto tree version of teh changes) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Sp=m+yLKQPSA2bvAXElh/JG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwN7/AACgkQAVBC80lX
0Gz51AgAoaYhnPYoNsLPgwkdHBZERlcgjqF2QIkgo9VQxnU3ac9nw3MWnR1TQTAh
foU9VWFyqnpcsUb/AKp7rKYV8ldQ5L9Zp/VrZ/lcocSO5/k0fvjp2Pf/HyKtqqfi
PTBqBN95vmH3R2o9vf2k3LfigAN9Ty1QpNdWLnKbiJRHuoMFrMD3vEUfyNkbHgTH
Oek65avHoVtn2wKpmy+MnmG4G7wLRbcJZ+SA/VdyGFW3NyKzFDW+E9+PhMWY3gh4
fHceBt0nmSfXwaTHb+mDNp/PrHyIsVD9cD/YyNSBfrRRt49HzOHBpALDXh2tMBCU
PZvzTOqzrsezk3XfwwxpNuLCj+zOXg==
=zZNT
-----END PGP SIGNATURE-----

--Sig_/Sp=m+yLKQPSA2bvAXElh/JG--

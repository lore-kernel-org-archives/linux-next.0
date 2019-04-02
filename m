From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with Linus' tree
Date: Wed, 3 Apr 2019 09:56:50 +1100
Message-ID: <20190403095650.0ded75e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/K6G1/X+k_XFOqI_fehCuh=8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neil@brown.name>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/K6G1/X+k_XFOqI_fehCuh=8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/staging/mt7621-eth/mtk_eth_soc.c

between commit:

  bd31342f0046 ("staging: remove mt7621-eth")

from Linus' tree and commit:

  6b16f9ee89b8 ("net: move skb->xmit_more hint to softnet data")

from the net-next tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/K6G1/X+k_XFOqI_fehCuh=8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyj6LIACgkQAVBC80lX
0GxwkAf/WgDx6mwhxeIoHB+tASIZB4NPDsOZLIwX3ovacdgRikfVkduGpIgTMXM9
LdAg0UAfyigTwMRFyaNq5tQJS5NSDWLZIiwcWVAhY4lyEMOAYEAKOWZ1B8rreO99
7+Ji8+JVVKqTF2VUUzIa2Ax7WUjyq7hO8LMgXCZ4XCHEl56ScePi1vMzPMuXZElq
NpbhaUxei+fGSkkxyJLDol1+PT+X10gPkox8GVSVGyaoFeE1KGuXa0U7mhIJT5+h
IR9h5TcL+PGh5iYkuEtkImvqh5GcofMJgCcMEA+yN9F8f69CPWIoxfBBQBcs24Wo
7nJEMTvVeyyiHH1tiCEehJ9DXkjx/A==
=bGuk
-----END PGP SIGNATURE-----

--Sig_/K6G1/X+k_XFOqI_fehCuh=8--

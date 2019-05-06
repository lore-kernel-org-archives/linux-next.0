From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the netfilter tree
Date: Mon, 6 May 2019 23:08:15 +1000
Message-ID: <20190506230816.22452c4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2dh7rGdDwXTz/NoDbDAJsn7"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kristian Evensen <kristian.evensen@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2dh7rGdDwXTz/NoDbDAJsn7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

n commit

  4ff6d55abba3 ("netfilter: ctnetlink: Resolve conntrack L3-protocol flush =
regression")

Fixes tag

  Fixes: 59c08c69c278 ("netfilter: ctnetlink: Support L3 protocol-filter

has these problem(s):

  - Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/2dh7rGdDwXTz/NoDbDAJsn7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzQMcAACgkQAVBC80lX
0Gxu7AgAjLH7b+D21AAun/ybz1JFuzbsjqUZM2urJFjKvGkFqvqIZMR+BiQ3NaR7
RIKpUH3MUVVj1GrbA+eOCZiaWhL9yy59hZrLAdwJZO51NUdq1Z0Y+XuZaBEQjRR4
kgqHjbteAMiY5EzrN2P5V/AMXg+nhcCROEAnINc0UfJHIVSw4YOxfry32DleYWbE
ATfk0UL++vCIzF+FJE26g2zErza3vizazroIoUsQjdhkp2IaY6QrO0oewCx/pGpM
Fbtgry3PpQY25AdVJyhKyOEIlIILKNKWB6S5NazFHXJ6NJcxU+R6uE7OjWfOUIFm
3nBErmWA1Hh16rdIxL+f+CDKrYOrMg==
=mrha
-----END PGP SIGNATURE-----

--Sig_/2dh7rGdDwXTz/NoDbDAJsn7--

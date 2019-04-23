From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Tue, 23 Apr 2019 11:32:27 +1000
Message-ID: <20190423113227.3dd68989@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kWc9vZT6BWDaAW2K4bbmfho"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/kWc9vZT6BWDaAW2K4bbmfho
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

net/socket.c: In function 'sock_ioctl':
net/socket.c:1173:10: warning: this statement may fall through [-Wimplicit-=
fallthrough=3D]
    err =3D sock->ops->gettstamp(sock, argp,
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          cmd =3D=3D SIOCGSTAMP_OLD,
          ~~~~~~~~~~~~~~~~~~~~~~
          !IS_ENABLED(CONFIG_64BIT));
          ~~~~~~~~~~~~~~~~~~~~~~~~~~
net/socket.c:1176:3: note: here
   case SIOCGSTAMP_NEW:
   ^~~~

Introduced by commit

  0768e17073dc ("net: socket: implement 64-bit timestamps")

I get this warning because I am building with -Wimplicit-fallthrough
in attempt to catch new additions early.  The gcc warning can be turned
off by adding a /* fall through */ comment at the point the fall through
happens (assuming that the fall through is intentional).

--=20
Cheers,
Stephen Rothwell

--Sig_/kWc9vZT6BWDaAW2K4bbmfho
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+aysACgkQAVBC80lX
0Gx74Af9EQr/Jmy5vXkadUq194+lVw9iMcHP9/4UNQyzjA3UNIDyII2c42Rzr3W7
v68yLk2+vEDSDMKzBSCarV5MmK+3xaaiTfpLW3pVjThj4ogflYwMMftx+zbULNi5
oTcoSft8xUe7wBmGHYxyeop2/BfPK7R8l30BZ0+5wEajA1G1B10URuRd+RNYx8cJ
daXXoHDrTFKbNzkfnjDYK3ePm3g1agVed3ZZzjk3c28ronPMy/W8UVVQmk3aT1/B
DGEUpn2kWECStgzZaxG6XN4goWqatlODxkzHhnFnZR+rhc+FipYCHI37mU1mZFOD
esmZMxDnxzLdwhQmUvK0PPUAa1kq+Q==
=hDj1
-----END PGP SIGNATURE-----

--Sig_/kWc9vZT6BWDaAW2K4bbmfho--

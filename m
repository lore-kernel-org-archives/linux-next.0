From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Fri, 22 Feb 2019 12:06:44 +1100
Message-ID: <20190222120644.0bdc4da8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iD/TIP7C/mu/zcBX8zXSOhU"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/iD/TIP7C/mu/zcBX8zXSOhU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/net/ethernet/rocker/rocker_main.c: In function 'rocker_port_attr_se=
t':
drivers/net/ethernet/rocker/rocker_main.c:2083:9: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
   err =3D rocker_world_port_attr_pre_bridge_flags_set(rocker_port,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              attr->u.brport_flags,
              ~~~~~~~~~~~~~~~~~~~~~
              trans);
              ~~~~~~
drivers/net/ethernet/rocker/rocker_main.c:2086:2: note: here
  case SWITCHDEV_ATTR_ID_PORT_BRIDGE_FLAGS:
  ^~~~

Introduced by commit

  93700458ff63 ("rocker: Check Handle PORT_PRE_BRIDGE_FLAGS")

I get this warning because I am building with -Wimplicit-fallthrough
in attempt to catch new additions early.  The gcc warning can be turned
off by adding a /* fall through */ comment at the point the fall through
happens (assuming that the fall through is intentional).

--=20
Cheers,
Stephen Rothwell

--Sig_/iD/TIP7C/mu/zcBX8zXSOhU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxvSyQACgkQAVBC80lX
0Gyyhwf/ThDtCpjEQD7WOsLHSwnY+L3DGVPLmqquMJpFN9NaTU98Y2OHfTsQw8Y4
NouV/6S7gVSublUPU29TDMKzmHqX1hRULVjmulL2Z1KJRMvCD5A12DFqijJBmc+L
KsuK4OUDbooA0vRf3vFM+1OabO8e48+/cqbvWPeD1P4arpELGf4keWpyGw6IEKRC
/SAz8EnOp4lNdkxuB3FQB1yjanA/7cvHe+CS61MWvzEx/K70kcK3yOaeCsSlnlCz
LITfZk4nwFpOiqPj10yE9MkZFvosaKO6QV0ZAL3A0plvyqmUg7Exvea+OHxt5mlN
aNXuqs88S19pkIAeijqvETy44qm/iw==
=yTtA
-----END PGP SIGNATURE-----

--Sig_/iD/TIP7C/mu/zcBX8zXSOhU--

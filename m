From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the net-next tree
Date: Tue, 9 Apr 2019 08:00:51 +1000
Message-ID: <20190409080051.3cc54e1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1nioSGE/ngx_G5KfUGe8bw3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eli Britstein <elibr@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/1nioSGE/ngx_G5KfUGe8bw3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  6fca9d1e603a ("net/mlx5e: Allow VLAN rewrite of prio field with the same =
match")

Fixes tag

  Fixes: 37410902874c ("net/mlx5e: Support VLAN modify action")

has these problem(s):

  - Target SHA1 does not exist

In commit

  bf2f3bca1c5d ("net/mlx5e: Deny VLAN rewrite if there is no VLAN header ma=
tch")

Fixes tag

  Fixes: 37410902874c ("net/mlx5e: Support VLAN modify action")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: bdc837eecf73 ("net/mlx5e: Support VLAN modify action")

--=20
Cheers,
Stephen Rothwell

--Sig_/1nioSGE/ngx_G5KfUGe8bw3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyrxJMACgkQAVBC80lX
0Gz7fggAkoBgU9zhYPP4JYUuabGM8rj0MGmi0PdToMvoYuB2OPsMlULWOdgWOaiX
nwsFovdVSMMQf0+31/t3h2l+9NuiOQaCV+eQ/e5p2iVxxTMIO10aRRHCKoUB1p8q
0Y8UMi0VgrH/iD81YOVmW1YVRSnXjugXCGZ8RzEU6PfEXho78z/kqHBpC3twejEw
G5Oq4LLam5k5yApyEVMOfjDqkI74RgB+bCrvH0zVFx7OE/Vd9f+oRHV+FMG2Zder
vGoKWPOAgZ7eL6gqF4KRcjbd9Z5QuHAEz0rUFg14KWi93qe8g9D0a8be8xlpEhO/
4ejPo3bFN1J5cmk8py1fVvhj1+PUHg==
=8nP6
-----END PGP SIGNATURE-----

--Sig_/1nioSGE/ngx_G5KfUGe8bw3--

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Wed, 13 Feb 2019 11:49:16 +1100
Message-ID: <20190213114916.1a83a363@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Qr1i51w24dKLDRzBusQo9Hm"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Qr1i51w24dKLDRzBusQo9Hm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c: In function 'mlxs=
w_sp_port_attr_get':
drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c:438:19: warning: u=
nused variable 'mlxsw_sp' [-Wunused-variable]
  struct mlxsw_sp *mlxsw_sp =3D mlxsw_sp_port->mlxsw_sp;
                   ^~~~~~~~

Introduced by commit

  1ecb195753a1 ("mlxsw: spectrum_switchdev: Remove getting PORT_BRIDGE_FLAG=
S")

--=20
Cheers,
Stephen Rothwell

--Sig_/Qr1i51w24dKLDRzBusQo9Hm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxjaYwACgkQAVBC80lX
0Gxtfgf/e+HeBhwdrpTIevYtSAfXAW6b1DWClvLiRulOZT05slhwUbtjq0dPLZSJ
bkP0XnJ/slZefnKEwmieI1muaTQrK33EJZOSxgsaGYXVgWJ2xXeevjrZaXSb5VOi
uF1U4ZpkC/IemDpl3WrbJ0DjcMbT/86h5/Kl/q9TYt0K6X054TJEMK6szYqlDQ44
jPGO05ZK23Ibudj/hN18+yVlCCaySg+x0V7aa5hnYR4tF3dyvXwjMnawjr8318cf
y19Gh/jG801PSoPPpgoeyWwRllFteRjmaLLW5RT/ecJE0aMUWDqNlr+lxs5Dj0ZA
pTTsPhvlN4Sabm5ET2RRZ3xFgVSWNA==
=WBVG
-----END PGP SIGNATURE-----

--Sig_/Qr1i51w24dKLDRzBusQo9Hm--

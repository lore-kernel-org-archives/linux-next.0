From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net tree
Date: Wed, 22 Aug 2018 08:04:49 +1000
Message-ID: <20180822080449.5887e244@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/u73I2CAj_0XHU31A_03DG_W"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Cong Wang <xiyou.wangcong@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/u73I2CAj_0XHU31A_03DG_W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net tree, today's linux-next build (KCONFIG_NAME)
produced this warning:

drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c: In function 'tc_fill_actio=
ns':
drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:64:6: warning: unused varia=
ble 'i' [-Wunused-variable]
  int i;
      ^

Introduced by commit

  244cd96adb5f ("net_sched: remove list_head from tc_action")

--=20
Cheers,
Stephen Rothwell

--Sig_/u73I2CAj_0XHU31A_03DG_W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt8jIEACgkQAVBC80lX
0Gy9rggAmgoFDJxS7tbYirshdBLQulKP16+xv8mZTJ6WJgM59HmkaodNsvjYgQfj
lJ7derYeOUQHMglKON+nNzMKWcSC1r8GGW/LudBY2CI7jr6V7C1o+FTtHUB80n8O
dY0i4lFu/R/K6/bYFiDBdl825Obr08JP8bZkdQDOE/zcSEgSxios51CTMjv4e79/
f7h/gmiW4p5obZNkqTIP3YXQrj5r2NEQQwN4G9OQW1lqjG1gwLJSB7f+1uaFEFsP
uiTvukh257mgGHDl1u3Z7C4lYigzMHwzgnc+ButCJrzoR6SOZ5J/9oqTwxdhfDr/
3z5XakXJ47ssLtHX/PdmmrJQN5neww==
=3oaR
-----END PGP SIGNATURE-----

--Sig_/u73I2CAj_0XHU31A_03DG_W--

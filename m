From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net-next tree
Date: Mon, 25 Feb 2019 19:00:34 +1100
Message-ID: <20190225190034.0cad4e3d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+eE9o=RAO22YcHqlnU8p7X7"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jian Shen <shenjian15@huawei.com>, Peng Li <lipeng321@huawei.com>, Huazhong Tan <tanhuazhong@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/+eE9o=RAO22YcHqlnU8p7X7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a638b1d8cc87 ("net: hns3: fix get VF RSS issue")

Fixes tag

  Fixes: 374ad291762a ("net: hns3: net: hns3: Add RSS general configuration=
 support for VF")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h (%s)'

--=20
Cheers,
Stephen Rothwell

--Sig_/+eE9o=RAO22YcHqlnU8p7X7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxzoKIACgkQAVBC80lX
0GxBpggAhgGK6bijkh0RiWclJTK1zRkfY1qhr3oqhxgdjnoZJbUFL/dPXlwB5/Fj
RZGnOTkvs/MsVC7tpGx34gWxKLM48/uxCbLgqRJ0iCtN4KN9uxS6wUsjbGrhAar6
5u0UniFTIpvXs1JvVGfEA2Px1B9FSisixH+khaciEgSsfoJpkojXiOcCcFWpwFpD
wEbUf/cQ87954Ve2m0pBP5MGz+FM+YEXlkTiyVdOFoJfw8sz+1s7v6Md73+9N7lE
JRyCnOYbCtWHY/Y//PnbR40MKaqeNaMKW0U9gE029cAQlqXj1L/n2+1pWcEWzJrm
mItJFqaFYFeSyFsQbfIl8IztpePVZw==
=Nmow
-----END PGP SIGNATURE-----

--Sig_/+eE9o=RAO22YcHqlnU8p7X7--

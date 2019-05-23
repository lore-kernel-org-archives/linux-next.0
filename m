From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Fri, 24 May 2019 09:47:09 +1000
Message-ID: <20190524094709.3f9830f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Cuiezi5g/cA/rbWtws0fruG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Esben Haabendal <esben@geanix.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Cuiezi5g/cA/rbWtws0fruG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/net/ethernet/xilinx/ll_temac_main.c: In function 'temac_set_multica=
st_list':
drivers/net/ethernet/xilinx/ll_temac_main.c:490:8: warning: 'i' may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
  while (i < MULTICAST_CAM_TABLE_NUM) {
        ^

Introduced by commit

  1b3fa5cf859b ("net: ll_temac: Cleanup multicast filter on change")

--=20
Cheers,
Stephen Rothwell

--Sig_/Cuiezi5g/cA/rbWtws0fruG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznMP0ACgkQAVBC80lX
0GwQ8Af/RkRDO+UFIoOiriK/aUKOPdJqRLyjf6YDn1Tdh8nuOp5JOfYf3WICpOWh
k69aiQKv/B+6M5jFNXAWJ7hAR+quQ2idw2VfqxetJLqWULLt2F1a+54ILN6k54oW
1aJ5rF4Su2+aU6hEdiKYB3DBcd1bk7Zt4o2a4OKFqTWxq0tPMJz3xqr/Z9HLoRPD
DV7362RJ1kGYs1cTnin+bCnBZUp0rC4YgDJ4eRb6yHV83ZKG/tm1tjK15l0s3Mv9
i2rxkxvOkKJOLdIHF5AgH4sEfy41iqo4DgQ16ErNzx1irRHmgdybejdAhkKyYCCV
Os9J3BZX1BbHd0VAuCb/4yia3jq4Fw==
=4eOT
-----END PGP SIGNATURE-----

--Sig_/Cuiezi5g/cA/rbWtws0fruG--

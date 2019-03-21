From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Fri, 22 Mar 2019 10:05:12 +1100
Message-ID: <20190322100512.51b5ea25@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/g8GA6XQIB7jGLEa/q1VShjD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <scott.branden@broadcom.com>
List-Id: linux-next.vger.kernel.org

--Sig_/g8GA6XQIB7jGLEa/q1VShjD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/net/phy/Kconfig:276:warning: prompt redefined

Introduced by commit

  17cc9821766c ("net: phy: Move Omega PHY entry to Cygnus PHY driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/g8GA6XQIB7jGLEa/q1VShjD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyUGKgACgkQAVBC80lX
0GzxTgf+L6z3IEpUU+OwKxIsoPP98Q2F0PNUEsrr5HJNL7P1tTaet384dgE6cGlp
zoJwp11YF1Bwjy+yIAfYeJM9HjpWcMjaCK9fiJtzCIDYrKBGaRStEcTEZCAUibF7
rmVndLMCf0beLV1LF7HiYa++OY+X6LLaC0eUfyAdRMmBB1tyEffipMQCJqubhWaa
iMzcK4sWknlLC3rGx8OeDNFqz4Ero9Vh9QsUcymXko8YDWcs4qGYDJiTHD/I2HEi
fLOBbKuzjfWTzJx1t1GRPtFAg541sZ3lMLcuTNEuF/miIMtLJW8VoYoes1nfbQv4
g5kOTuTKAMCBX+f7LiDRUqMU9YJaVA==
=hqRW
-----END PGP SIGNATURE-----

--Sig_/g8GA6XQIB7jGLEa/q1VShjD--

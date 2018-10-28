From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with Linus' tree
Date: Mon, 29 Oct 2018 10:08:31 +1100
Message-ID: <20181029100831.73b12672@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=_L/wC4xwxrC/ekk9rJ.mvS"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Niklas Cassel <niklas.cassel@linaro.org>, Andy Gross <andy.gross@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/=_L/wC4xwxrC/ekk9rJ.mvS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  drivers/soc/qcom/Kconfig

between commit:

  a978a5b8d83f ("net/kconfig: Make QCOM_QMI_HELPERS available when COMPILE_=
TEST")

from Linus' tree and commit:

  ccfb464cd106 ("soc: qcom: Allow COMPILE_TEST of qcom SoC Kconfigs")

from the arm-soc tree.

I fixed it up (I just used the version in Linus' tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/=_L/wC4xwxrC/ekk9rJ.mvS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvWQW8ACgkQAVBC80lX
0GycAQf/bAeaq8482QIDfTMaSVUId/AcgetXEXQqiqek1NffGeh3s13ZLo9vlH4/
Fg8iZ6JBLNfqam4H4T8n2tE9aaY/GSFsge2+NfaQaJR6T3k4SIh4CHuTWUR/p16B
oOveCZMlTk80IGuCBLSJwmiVj/fyIqXNV7/rXysTOj2xO4JqFt5wXIUD/KyeI6gL
8RL4atS+OcRSktfDnj6jyOw0ast4ubJ6OxzH22tFTpHSadSLakjoEj4++KnxpAGg
rlLGEXvLGw6WCFgDf/WrSAhSCjiWRImWkLzjFQxLR+CPkLFX0Xtgy6XB+ICK6S12
6lTPuvOcPPOyAvA2aWMwDD40ibfK7w==
=LPtz
-----END PGP SIGNATURE-----

--Sig_/=_L/wC4xwxrC/ekk9rJ.mvS--

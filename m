From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the arm-soc tree
Date: Mon, 16 Jul 2018 07:57:18 +1000
Message-ID: <20180716075718.4e5ef491@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SNo_UrQAryXNh9eCq+Jn1SD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Eric Anholt <eric@anholt.net>
List-Id: linux-next.vger.kernel.org

--Sig_/SNo_UrQAryXNh9eCq+Jn1SD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  b8ccf02a5014 ("ARM: dts: bcm283x: Add the PMU to the devicetree.")
  b7dd29b401f5 ("ARM: dts: bcm283x: Add Transposer block")
  74d1e007915f ("hwmon: Add support for RPi voltage sensor")
  70eea1bbb556 ("firmware: raspberrypi: Register hwmon driver")
  a1547e0bca51 ("firmware: raspberrypi: Remove VLA usage")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/SNo_UrQAryXNh9eCq+Jn1SD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltLwz4ACgkQAVBC80lX
0Gwf1Qf7B4Xn4xAMfPxVb0M+sskBPq51kCv/IbejqNZvlKN+TScnlQIvw+0sIDSf
pjEgCBc2Ep3IdJzwEyXAtd9RswCSoTwgTsWjxYNl5IcPJAy4k+0iPcVdcO30UVIA
W7GamnTTdq0Bzac8JwTKweI1RicgfjpNcsrDY+owCzv7UaBA/AoAmPzAUjOMp3lI
IaG5TXWPqHnSYm6+cHhoUf+gEazQh/bIQV7DOuiD3xYgo+6bHWsl65dqmWzjs0hw
0W4EH2RAmwkp2AjPRR3ojBmnkk1qXUx+l0vm3a10lKQNN/NzmhS0IEVOWrTsKt+X
KFpt0Fpn5WOhtYKhbDvXaXXHYnPtYg==
=sKqP
-----END PGP SIGNATURE-----

--Sig_/SNo_UrQAryXNh9eCq+Jn1SD--

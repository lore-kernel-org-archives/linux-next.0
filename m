From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the slave-dma tree
Date: Sun, 28 Apr 2019 17:17:01 +1000
Message-ID: <20190428171701.2a96cd3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gIT.vGV=8Z1cQK+Zum/=jgy"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/gIT.vGV=8Z1cQK+Zum/=jgy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9bd1be60f55b ("dmaengine: stm32-dma: Fix unsigned variable compared with =
zero")

Fixes tag

  Fixes: f4fd2ec08f17: ("dmaengine: stm32-dma: use platform_get_irq()")

has these problem(s):

  - The colon following the SHA1 is unexpected
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/gIT.vGV=8Z1cQK+Zum/=jgy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzFU20ACgkQAVBC80lX
0GyKlwf/bnf3VUpSUMuG3FQDj9yJjjOusJkAUFg4tXVu5DCN0enIwHfHpT/xE4Sn
x82OviM/UzfVriPYRkOVcpOCYMFzUVFLWuLYmHBo0IE6QkWmImn8qzGZ6tvFpf5Z
FGLmPTacZQIl9ffcLkGq+w1UhFK9SVjpQlgGKjUm2fgLAjpy+8QFXo6pFRtXva7s
m5F/X5TTqHCuPFX2P+bxs/kAytSn9UlUsI+3jBznODJIsAaRbP79FqMJYddnk+7x
mVNgQOeSL/0Ts8+/ppwH6gf5wOTTy5OqMg0UwdsBc4llxJCeOzyuvdWmqIZ9+pA+
R8FoPCT7NFX3OQbaQ5pCNoHX8Pcz+Q==
=uhnc
-----END PGP SIGNATURE-----

--Sig_/gIT.vGV=8Z1cQK+Zum/=jgy--

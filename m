From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-msm tree
Date: Mon, 4 Jun 2018 13:20:49 +1000
Message-ID: <20180604132049.117952be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wUgPFeLpZT0Y/Cu=kxnCwQY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sharat Masetty <smasetty@codeaurora.org>
List-Id: linux-next.vger.kernel.org

--Sig_/wUgPFeLpZT0Y/Cu=kxnCwQY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

After merging the drm-msm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/msm/adreno/a5xx_gpu.o: In function `a5xx_gpu_busy':
a5xx_gpu.c:(.text+0xcc): undefined reference to `__aeabi_uldivmod'

Caused by commit

  dd4ff3063899 ("drm/msm: re-factor devfreq code")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/wUgPFeLpZT0Y/Cu=kxnCwQY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsUsBEACgkQAVBC80lX
0GwwyAf9FIRSiZXmpBSwLztMljQDFRBNWMtC6yuEJ3jNvsCg+JuoMRHutoEvil/1
YLM7DndxEwZXnE1bwh76AlIWmEWQS5NyeEGuxHwU5GQPXPcv78yDbYpiiVhKB+T8
4HiEv25ygJp3H6zLBx3ynWbjh4WXhceLm2Y4kJsSsg8QzZEC/182Qhgnkg6C4ZVG
qq6aTx60c7phlxcxs+Pisuvyz+Qye9hTxdnlicYFOebB7jMCi/UtsBifuGslVb0b
IufAe0aErv+by1hOQvdMiERYHaqJTLOddK+aT5UjRF+u6bYZK10KJxaG7U5EJN1W
ZSYCirzVRm6hxpFGPKjykAdoXoIK4w==
=G44I
-----END PGP SIGNATURE-----

--Sig_/wUgPFeLpZT0Y/Cu=kxnCwQY--

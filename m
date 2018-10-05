From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-msm tree
Date: Fri, 5 Oct 2018 11:37:38 +1000
Message-ID: <20181005113738.2b7e4e1d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Oz9kFV2PSTN=zeTbT2o+FQo"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sharat Masetty <smasetty@codeaurora.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Oz9kFV2PSTN=zeTbT2o+FQo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

After merging the drm-msm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arm-linux-gnueabi-ld: drivers/gpu/drm/msm/adreno/a6xx_gpu.o: in function `a=
6xx_gpu_busy':
a6xx_gpu.c:(.text+0x70): undefined reference to `__aeabi_uldivmod'

Caused by commit

  a2c3c0a54d4c ("drm/msm/a6xx: Add devfreq support for a6xx")

I have used the drm-msm tree from next-20181004 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Oz9kFV2PSTN=zeTbT2o+FQo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu2wGIACgkQAVBC80lX
0Gxidgf+Ppqa+xCk9sv5wXIDA+911gYtrofBmnT5373qGExkr4Bwip1FDBXh0vTp
6Wx9POoVrR2OZoBhlWHKKyN7uLdMfpEEMncw+zh1rnZJehRey3b6O/0FM3PLkFxf
BEYGpp2X7+MbKVQM6w2OXcWMxYoJKMEdAV/+g/61kwOj3cu5K3P6E/QzNR+KJgOm
58nrml7s/Yu7arwYh8hteTRvpzb53fDx/htmvpREFCEjK/xn559r/BYN3ZYoKhvz
UO5tEqwR0/Sb3K/9udguObknzZwiE0zjfPV1nOQSZAW4zhMRIricXTRAG4S+6xtW
XxRHKqYF9iR3ArN1jUoBoavG9o6Hpg==
=tWOy
-----END PGP SIGNATURE-----

--Sig_/Oz9kFV2PSTN=zeTbT2o+FQo--

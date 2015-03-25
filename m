From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-panel tree
Date: Wed, 25 Mar 2015 17:20:56 +1100
Message-ID: <20150325172056.20be6ba2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qyGeNCsad063Z/qGMgMGLic"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Sig_/qyGeNCsad063Z/qGMgMGLic
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

After merging the drm-panel tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/video/fbdev/Kconfig:5:error: recursive dependency detected!
drivers/video/fbdev/Kconfig:5:	symbol FB is selected by DRM_KMS_FB_HELPER
drivers/gpu/drm/Kconfig:34:	symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HEL=
PER
drivers/gpu/drm/Kconfig:28:	symbol DRM_KMS_HELPER is selected by DRM_PTN3460
drivers/gpu/drm/bridge/Kconfig:6:	symbol DRM_PTN3460 depends on GPIOLIB
drivers/gpio/Kconfig:34:	symbol GPIOLIB is selected by ARCH_REQUIRE_GPIOLIB
drivers/gpio/Kconfig:23:	symbol ARCH_REQUIRE_GPIOLIB is selected by MCU_MPC=
8349EMITX
arch/powerpc/platforms/Kconfig:350:	symbol MCU_MPC8349EMITX depends on I2C
drivers/i2c/Kconfig:7:	symbol I2C is selected by FB_DDC
drivers/video/fbdev/Kconfig:59:	symbol FB_DDC is selected by FB_CYBER2000_D=
DC
drivers/video/fbdev/Kconfig:374:	symbol FB_CYBER2000_DDC depends on FB_CYBE=
R2000
drivers/video/fbdev/Kconfig:362:	symbol FB_CYBER2000 depends on FB

Introduced by commit 6a43766f6ef3 ("drm/bridge: ps8622 and ptn3460
depend on gpiolib").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/qyGeNCsad063Z/qGMgMGLic
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVElPPAAoJEMDTa8Ir7ZwVPUUQAIHfJQy6tvMGDZ3R7iS2ER+G
ON6vCA33JdcYnUKgnpTBoX30sw2gm6DNxXYvgwwdd5D9vc0cG5McuHEmmEsZ3ERl
LdKWEq8tY7cDJQw/G1scY4jsZzkFgiqIJfIfnDfLEHTv/NJkfNvz0A5uymzTB6m6
bAbPhtFtnFjb9xDSjuBf/6Pz8Y3I73H79qE8mfmdiaZTv41AgTcoKFKVYM8kmnXH
7rfKdzu0JMSG/H0mhp7guQYtUN3mf3qCHmQa8ewtmfKL1ZWul3W97ur6i2wtST8f
soKyrumK8dvW25GbH0ZNft/ZN0tkP3mE0EijX5Zt35h+ITAnWLQ40TZuM+zPsP/s
yacnVksbf/5hPbTCU9Uz1WRepsbnhzVnmSU8Oq3EN+WVH6ewowokOEkZoTHwuKa8
LbIb77wcIkwqqdvfii4ERPg46q/QKCLYICiMhMW3aTwI5fYLV750ovUs2PWhIKmx
IO+fFivG12R6IJ6KVIBmEloQ1BEho6Q1OMHK91+GeJ2GAt7wiSjpe2V8zQdb3KL/
UNQf31TyMp0ag/2Sz3knISTMcZhmWtkNogVsJrbkHyaNvbZT0HJq37dBbrQrg6+g
FbmuHrQ/fB1Zb0zxF/vArbeOqVBQvPjuCKXddD0MtxUaS1rwDSf8gtWutEWAJxy4
Zhi+dokdChikwJxH+XaN
=82cQ
-----END PGP SIGNATURE-----

--Sig_/qyGeNCsad063Z/qGMgMGLic--

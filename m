From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mfd tree
Date: Wed, 3 Apr 2019 11:40:50 +1100
Message-ID: <20190403114050.57053326@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4vUOT_NJGnO_..0Nn08EZfG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Wei-Ning Huang <wnhuang@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/4vUOT_NJGnO_..0Nn08EZfG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/mfd/cros_ec_dev.c: In function 'ec_device_probe':
drivers/mfd/cros_ec_dev.c:422:33: error: 'EC_FEATURE_FINGERPRINT' undeclare=
d (first use in this function); did you mean 'EC_FEATURE_HANG_DETECT'?
  if (cros_ec_check_features(ec, EC_FEATURE_FINGERPRINT)) {
                                 ^~~~~~~~~~~~~~~~~~~~~~
                                 EC_FEATURE_HANG_DETECT
drivers/mfd/cros_ec_dev.c:422:33: note: each undeclared identifier is repor=
ted only once for each function it appears in
drivers/mfd/cros_ec_dev.c:445:33: error: 'EC_FEATURE_TOUCHPAD' undeclared (=
first use in this function); did you mean 'EC_FEATURE_USB_PD'?
  if (cros_ec_check_features(ec, EC_FEATURE_TOUCHPAD)) {
                                 ^~~~~~~~~~~~~~~~~~~
                                 EC_FEATURE_USB_PD

Caused by commits

  4483a6f22432 ("mfd: cros_ec: Instantiate properly CrOS FP MCU device")
  a03871b9e9ea ("mfd: cros_ec: Instantiate properly CrOS Touchpad MCU devic=
e")

I have used the mfd tree from next-20190402 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/4vUOT_NJGnO_..0Nn08EZfG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlykARIACgkQAVBC80lX
0GxvEwf9ERi1vnhWLV2OwLwqyz6qDGQVtpKmK2+uNT13vVxr52cT3vIe9SX/+H5e
YuKZ5SEM4363ImI6yhtOMorU1upnJrqzyerJR6KIvYeoTAPeiq2B9vv5TJasqoiO
jTf8yK9g0xJzgQw9hifI6lZb32GEhXtIXnvf8V6//VBlypUVvqCBf9ajsuj9Krlp
MrUuutgNAr1GFGRqSmDydw5mXlSQI2GvbNbzTZ2JEqaJoDg5GHUPNjujrZWgbS/P
rCEMwtyBueHYm/Qoepa5heXfnRJ/tLYKCF/A7o+09BOmL1l9AWNq9xfk7JPr56Bw
i5L4H90ruBc4bMhXFlcB6AsBNVuOgw==
=yx2X
-----END PGP SIGNATURE-----

--Sig_/4vUOT_NJGnO_..0Nn08EZfG--

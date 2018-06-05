From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the mfd tree
Date: Tue, 5 Jun 2018 13:15:07 +1000
Message-ID: <20180605131507.3f217038@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1RNtq60.cfggJ2B5lzgeNCQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gwendal Grignou <gwendal@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/1RNtq60.cfggJ2B5lzgeNCQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/mfd/cros_ec_dev.c:265:13: warning: '__remove' defined but not used =
[-Wunused-function]
 static void __remove(struct device *dev) { }
             ^~~~~~~~

Introduced by commit

  3aa2177e4787 ("mfd: cros_ec: Use devm_kzalloc for private data")

--=20
Cheers,
Stephen Rothwell

--Sig_/1RNtq60.cfggJ2B5lzgeNCQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsWADsACgkQAVBC80lX
0Gy1cAgAoM4S48TPh77ODjF8H8yGrNb+Ev4h/LiQ0OeBTruXb5E/6Ian644hY42Q
MfmvRMoJvPPvoKTxzjkNY62vVYnxjl5A3G0QbfFUVwo5/NfnpJ+EksObHQQK/VZr
p8qQgWg0t3tR6J9r9U1/zYtcx4fFzTyPxOzq6HHsLbY6vbaY9PfTw/UVyNBnQieQ
U/ZbLZrXgijPgF5qh1cHWud31P1TpztYUS1jddAO7p9wtZuy8rX/VKCoewpBiqe0
6EQ+rhMiUYZ4Dk97Wvvd8oc1iYUp8jp/WYb8NRcs6RrTQNx38Rue3Sc7LJO1SxuP
9vcObUnD7Qd+msTXDYdB2YJEIMn/Eg==
=GD2C
-----END PGP SIGNATURE-----

--Sig_/1RNtq60.cfggJ2B5lzgeNCQ--

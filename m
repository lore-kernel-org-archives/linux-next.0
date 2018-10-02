From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the char-misc tree
Date: Tue, 2 Oct 2018 15:31:49 +1000
Message-ID: <20181002153149.2a312771@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/irOtuQOPhLavSwGr2qkY3n8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/irOtuQOPhLavSwGr2qkY3n8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/nvmem/lpc18xx_eeprom.c: In function 'lpc18xx_eeprom_remove':
drivers/nvmem/lpc18xx_eeprom.c:258:6: warning: unused variable 'ret' [-Wunu=
sed-variable]
  int ret;
      ^~~

Introduced by commit

  226014d13fa5 ("nvmem: lpc18xx_eeprom: use devm_nvmem_register()")

--=20
Cheers,
Stephen Rothwell

--Sig_/irOtuQOPhLavSwGr2qkY3n8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluzAsUACgkQAVBC80lX
0GytxAgAmDRpiVPYk/tReHOcZ70FO+s7MLVHlQNZi5jF5P2axIfTYHgzbHX6YxX2
DE4uPhPNnIva0JGGuF6utg3v51jdqhJDskJ95YofP5KofX/2r5O7iZxIBSC2C11K
+wMn3SknP7Y7GGShxDDVJyunPnv7N6dUYPjr+COGsjVZxVwL/kbCnQIpBpQEpywJ
PKglAOE4RFQDz0Y13qgKlOlzVD0pUsB+8nq9U3hOnyTJgYhSCi/k7k2ZwRhDTjWE
WKEMOtLmRPqwVUp8sZ1ZLBoo3NeUJEqhwNOPSTE1Ua5jPxW7kKvs/SD6Ubr40iT3
R0tJ6ec+3Al0rJtjwJYPk+I2R+omLA==
=U5lr
-----END PGP SIGNATURE-----

--Sig_/irOtuQOPhLavSwGr2qkY3n8--

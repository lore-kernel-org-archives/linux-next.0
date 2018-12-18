From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the gpio tree
Date: Tue, 18 Dec 2018 16:41:31 +1100
Message-ID: <20181218164131.7ecf23f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eLkytpj4ogzcuNbXQvkiUZl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/eLkytpj4ogzcuNbXQvkiUZl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpio/gpiolib-acpi.c: In function 'acpi_gpio_adr_space_handler':
drivers/gpio/gpiolib-acpi.c:911:8: warning: unused variable 'err' [-Wunused=
-variable]
    int err;
        ^~~

Introduced by commit

  21abf103818a ("gpio: Pass a flag to gpiochip_request_own_desc()")

--=20
Cheers,
Stephen Rothwell

--Sig_/eLkytpj4ogzcuNbXQvkiUZl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwYiIsACgkQAVBC80lX
0Gy9HQf/SKxwy/zpdCkX7IxHQ/7YlkjrwLeqQmtrQLNuA4h2K551MxyCPG/ZZu6K
M0g7NfixRXLFLyW3HZzZH6qeobgF8wJ4Sbr96n38Q7+/KJDnDcc/Tv+1c3RFHz/b
ddWV6y+h5TZ1X9yQLJhdCDDIK+Sn9OPUurYn8hm5njKWtPj4RW4tCTNWO82mCkIZ
NLxHaZd+jlZvXOErCWWXUnrjeLAx2n7LlPRu5AAf3kZPVo6KoTSZNBg7rMP3Ef6I
ptL5JRuGWIvfK9sSGGJRllyHB/GXR4rf5Al6iPrS13SAl/tPBWQsNwEEp+7nlot2
lM1HEy1o/bVVk6/Awe/HWhddAb63uw==
=iS+D
-----END PGP SIGNATURE-----

--Sig_/eLkytpj4ogzcuNbXQvkiUZl--

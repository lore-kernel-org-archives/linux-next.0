From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Mon, 8 Oct 2018 12:03:30 +1100
Message-ID: <20181008120330.5d63f54b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7BpRpp=xAc/De5PqaOGl6o1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/7BpRpp=xAc/De5PqaOGl6o1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "crypto_fpu_exit" [arch/x86/crypto/aesni-intel.ko] undefined!
ERROR: "crypto_fpu_init" [arch/x86/crypto/aesni-intel.ko] undefined!

Caused by commit

  944585a64f5e ("crypto: x86/aes-ni - remove special handling of AES in PCB=
C mode")

I have used the version of the crypto tree from next-20181005 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/7BpRpp=xAc/De5PqaOGl6o1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu6rOIACgkQAVBC80lX
0GyOngf+JoprrOZFMXVND6FwoU9wQwzYXvoEOHbDMqGk9borKOlh7KNhfDs9Ws8M
86cG2a7rMOpaGYL75UcZvZRHgGhHbUYHGIArJC4seiehKsVWzPM+oPA1NBHS/Xq2
urv5hKhZPAwn7Jj+76Z5oxTjyHcMBHr8PuhzwDNUKkjL0BR310XJ8vx9daLD4abW
zR58OF4bHZbr0VXl+zdDafQPNqVd+dVr59bsJHAFavEacGi7MHFgLgJVtmVm1eT7
6+mePhkxuN0MvUbC1QrJ0osQhUmU2m8S7w+DQvZZc8/D0N+0DU1gzDXuOuXHOzNM
CMTauMHM0AK1lhz4ezD+EjrYUbgOAA==
=FA30
-----END PGP SIGNATURE-----

--Sig_/7BpRpp=xAc/De5PqaOGl6o1--

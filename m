From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Tue, 6 Nov 2018 11:46:12 +1100
Message-ID: <20181106114612.7de37ce1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N6lF17XaqNoDIvuq=/eVQdC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/N6lF17XaqNoDIvuq=/eVQdC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

warning: include/asm-generic/atomic-instrumented.h is out-of-date.
warning: include/asm-generic/atomic-long.h is out-of-date.
warning: include/linux/atomic-fallback.h is out-of-date.

Exposed by commit

  8d32588077bd ("locking/atomics: Check generated headers are up-to-date")

--=20
Cheers,
Stephen Rothwell

--Sig_/N6lF17XaqNoDIvuq=/eVQdC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvg5FQACgkQAVBC80lX
0GwzrwgAhMwHEY0O0SoRXUoAooVfrZ2qjDJASJviFmmamTrwW8/ZlELKByNFgwEg
wqE8CfU2XVQszSFt/GJ+2t5eFoUW8ETnnDPTq54wD55Ux3PK9D/zzCI+jipMXBht
4M/LK4BB/UyJVlXonpAnW4WDFfP0ZCpZ2eLAyukmPwm5jCANV9JlvxwvW5VxVQvT
Ds2Q7upwkIodzD6cxwjLt/W+zFcKQ89IQwgsOP02SPDa+KGV0zYaBigl2hWcp5Wv
8Uoj34273ywDn6saTbBdndvzCIu7jnw2Wr5uzJCQ0PlhQWHqfDztKc1B9AxysHzK
flAVrng/xB8Anew1y8Nz/9xurayfYw==
=Z6vy
-----END PGP SIGNATURE-----

--Sig_/N6lF17XaqNoDIvuq=/eVQdC--

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Wed, 19 Dec 2018 11:55:44 +1100
Message-ID: <20181219115544.2b18def3@canb.auug.org.au>
References: <20181106114612.7de37ce1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RSeBU+aNVGBUlGdN8D9Fs6T"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181106114612.7de37ce1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/RSeBU+aNVGBUlGdN8D9Fs6T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 Nov 2018 11:46:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> warning: include/asm-generic/atomic-instrumented.h is out-of-date.
> warning: include/asm-generic/atomic-long.h is out-of-date.
> warning: include/linux/atomic-fallback.h is out-of-date.
>=20
> Exposed by commit
>=20
>   8d32588077bd ("locking/atomics: Check generated headers are up-to-date")

I am still getting these.  Are they expected?  To be ignored?

--=20
Cheers,
Stephen Rothwell

--Sig_/RSeBU+aNVGBUlGdN8D9Fs6T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwZlxAACgkQAVBC80lX
0Gxttgf+KJCuK1sKyNoMeUSaklzmlPUfEeK5V9yJpYb7rA3QvB2yB6gTUqoraEPG
j8v//uGtCGw288fJoq6QgON6twUytxuv4CvX3pkoyvrRvYS2bWzuDhI9bHjIXafg
cAnDZkP6x4qjpHCnGquvB3PVfht69eVf/VXkC0PnJhRFYJiovvjnB7ydT+EeTfyR
lJuwKm+7B89XTMAQm9Hea+vipjX9hPQ/cmb2X4Uv6GA/eibmd4rOpHs2Mz+n1eJw
VaeiHYt3+iYZ6sY64JqkFBtDCYybIuWJjae7dlL4Xl613d2Oh5UFUOWDh3JhxnYP
/6i9nH+09ehSY1QljYJ0ycSd5LqbtA==
=Q9SE
-----END PGP SIGNATURE-----

--Sig_/RSeBU+aNVGBUlGdN8D9Fs6T--

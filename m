From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Oct 15
Date: Wed, 17 Oct 2018 07:41:49 +1100
Message-ID: <20181017074149.4372a1a0@canb.auug.org.au>
References: <20181015192546.15faf3a1@canb.auug.org.au>
        <20181015182637.GA16445@roeck-us.net>
        <20181016071240.3f62816d@canb.auug.org.au>
        <20181016072439.42613abd@canb.auug.org.au>
        <20181015151319.3a443f0421c20bd7ed055cb9@linux-foundation.org>
        <20181016133656.GA10925@rapoport-lnx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pb3eVjDhw/.Jnl_hv2MTcRM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016133656.GA10925@rapoport-lnx>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Rob Herring <robherring2@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/pb3eVjDhw/.Jnl_hv2MTcRM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Tue, 16 Oct 2018 16:36:56 +0300 Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> After some more grepping and spatching I've found these:
>=20
> From 8b014bae53a78ab747dbb76b9aff7df4cefcb604 Mon Sep 17 00:00:00 2001
> From: Mike Rapoport <rppt@linux.ibm.com>
> Date: Tue, 16 Oct 2018 16:03:00 +0300
> Subject: [PATCH] memblock: fix missed uses of implicit aligment
>=20
> A couple of memblock*alloc uses were missed during conversion from implic=
it
> alignment setting with 'align =3D 0' to explictly using SMP_CACHE_BYTES.
> Fix them now.
>=20
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks.

I have added that to linux-next today as it should get rid of the stack
trace we are seeing in PowerPC boots.

--=20
Cheers,
Stephen Rothwell

--Sig_/pb3eVjDhw/.Jnl_hv2MTcRM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvGTQ0ACgkQAVBC80lX
0Gx71Qf+IGsZZmjIgk71d2ZkyIq2CE16ktyU4y8Z0t53j9oiVAtehFGc8uFztX1E
zXnhMX/f5FALESg+78Gzcy95CMrUPIZ44c9/sb+6hE0s4nYd5piERjMXMH5hB8gS
YiUm6B4SSiSk3Px1c0JNtY+1C+UwZIV9i+Ur9Snrb7vePlBEbQYj28rOBNN6mBOP
ofshJmbh/Yx5Bnad5iPet+vOYsHu9a78HP27LEJWZPcFYePXvhnEN5P5SWf84TvT
pE4cCByvjInZfTWkBzQwJqeihAI4LA7+Rts1w1qWc+PFP+CxrzaiDnRtesLZwnvJ
fasRUAMaep6nMStMx5nD+f2tAJYMQA==
=BIOR
-----END PGP SIGNATURE-----

--Sig_/pb3eVjDhw/.Jnl_hv2MTcRM--

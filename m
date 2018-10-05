From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 5 Oct 2018 22:46:06 +1000
Message-ID: <20181005224606.2372fece@canb.auug.org.au>
References: <20181005161406.73ef8727@canb.auug.org.au>
        <87d0sok3dm.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Vss.RuVkbVq2Ytp_cX61Awd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87d0sok3dm.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>
List-Id: linux-next.vger.kernel.org

--Sig_/Vss.RuVkbVq2Ytp_cX61Awd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Fri, 05 Oct 2018 22:02:45 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Ah fudge, what are the chances we add a new include of bootmem.h just as
> Mike's removing bootmem.

In my experience, it was almost certain ... almost every API removal
conflicts with new added uses.  :-)

> I could just apply that to my tree. memblock.h is where early_memtest() is
> actually defined anyway.

However min_low_pfn and max_low_pfn are defined in bootmem.h until
after it is removed.

--=20
Cheers,
Stephen Rothwell

--Sig_/Vss.RuVkbVq2Ytp_cX61Awd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu3XQ4ACgkQAVBC80lX
0GyI1Af/b457Gsh24moiyWRAUs9XuZnTCmO7kcIrjxJ2cDnqUnfYWL5Kewvzc+Pu
fs/MYPLiKZ80JOW6oVoCmmVjr1sRZbxcVHJNPmWk73KLIomsfHuYMPBU4u1secC6
kq8yXGA6AqdYkxOWOsnt36Z6V/WYb/vjr+m5h07AqfCkoNh4BxSx9DR3sX3qZDzo
U7VS7sY1LZ7t7J5TklQuoRbXkPfgZT3IXuQIjIJuYKtIPPoB8LwNrg9ZIIgo/d5u
nonuhc8IZjZvo8QSojKjJL9VG5VGI+g8+YXi8XIP5VeGClIDLiKNCF3shEC3LHbb
zglQqbL6n/aTPDOPuuYLcNWDWy2O3w==
=UriJ
-----END PGP SIGNATURE-----

--Sig_/Vss.RuVkbVq2Ytp_cX61Awd--

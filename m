From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the tip tree
Date: Fri, 26 Apr 2019 07:09:49 +1000
Message-ID: <20190426070949.154c425b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jriS=yWeCbcqQe.lU7wK+0P"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Kosina <jkosina@suse.cz>
List-Id: linux-next.vger.kernel.org

--Sig_/jriS=yWeCbcqQe.lU7wK+0P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a65c88e16f32 ("x86/mm: Remove in_nmi() warning from 64-bit implementation=
 of vmalloc_fault()")

Fixes tag

  Fixes: 6863ea0cda8 ("x86/mm: Remove in_nmi() warning from vmalloc_fault()=
")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/jriS=yWeCbcqQe.lU7wK+0P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzCIh4ACgkQAVBC80lX
0Gw5YwgAn4RgAek2q+sj783FVvVZanql+32VfGuw8iJ4dVMBUN4n8tTHcI16YBRR
birZ1xrtJdrouhnNete3Yo/e8A/rN5ptGiQxCR1aAUzdLfM6olG6gRDCkd4LZDVg
MKjTN3Hxr+pjbP18iE/L3+U0CDTJiP+xCjvvwAC0D3QIrND6GOGiA8Ho7sM6sI54
bpdyONSnyYtbuJ1tiIuoYHB/GfmbokCg2G94mvqv+zoAxZNRvadjpiRtnze9+UFZ
GJ+KlJKRMbj2VFnI3Wfs1vn7fSlRUS9kz8cCSaa3e+/ltbY2erJjYukW7GYzdQWB
utM4pkFN99xHPkv6oRMsFkfV2sTzWA==
=CgRx
-----END PGP SIGNATURE-----

--Sig_/jriS=yWeCbcqQe.lU7wK+0P--

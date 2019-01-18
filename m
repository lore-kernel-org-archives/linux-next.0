From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Date: Fri, 18 Jan 2019 11:32:30 +1100
Message-ID: <20190118113230.3d11be0c@canb.auug.org.au>
References: <20190118093135.39cf071e@canb.auug.org.au>
        <alpine.DEB.2.21.1901180044260.1647@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FhimryAl9WKVCOptJXBrdFv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1901180044260.1647@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/FhimryAl9WKVCOptJXBrdFv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, 18 Jan 2019 00:45:44 +0100 (CET) Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>
> On Fri, 18 Jan 2019, Stephen Rothwell wrote:
> > Commit
> >=20
> >   a31e184e4f69 ("x86/pkeys: Properly copy pkey state at fork()")
> >=20
> > Fixes tag
> >=20
> >   Fixes: e8c24d3a23a ("x86/pkeys: Allocation/free syscalls")
> >=20
> > has these problems:
> >=20
> >   - SHA1 should be at least 12 digits long =20
>=20
> Sigh. I'll add that to my sanity checks, but this one has to be as is as
> it's in the middle of a series of fixes pending for linus tree.

That's OK, more of a reminder ... the abbreviated SHA1 is unique now,
but may not be in the future - of course 12 digits does not guarantee
that either.  I am told we already have some clashes using 11 digits :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/FhimryAl9WKVCOptJXBrdFv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxBHp4ACgkQAVBC80lX
0GwCPwgAoJEVXnt9cOhGIZM6Bk78/iwOOLgxmyt/gJ36b/KuthmfzMEsKiGUO480
rw1dFYF0h9fV4l6fxKTSele8FPAiP/ZIoi+UOP7rgoSB3TrOMi8R1B59r7I62QZa
LvRWOcLX2kKhRf59Nb/vkUusDRCbL9y6zuJubKnr0iBcf1X5s4p4aqpDVv/4RPAK
B6HBQSFbxBGqEsUSl5ia79KZBC4F7VI5FRauq+2iDpFExAk1R2k12peSn+c5pkuM
GFYa7GeODL298syWkyDiYZ61TbD9xNRH5X8Wt8Kf0JHFcq7F5q6ybZC3T6E3uRbz
CY6hLp61qm9lA3LkiecY3PnMvN59tQ==
=W/Xv
-----END PGP SIGNATURE-----

--Sig_/FhimryAl9WKVCOptJXBrdFv--

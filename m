From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the ecryptfs tree
Date: Tue, 14 May 2019 14:49:42 +1000
Message-ID: <20190514144942.403f0e96@canb.auug.org.au>
References: <20190514100910.6996d2f5@canb.auug.org.au>
        <CAK7LNAT_aJ4-abaNXe5VwvAYa2TOprjFL-vcUc730EDwHq80kw@mail.gmail.com>
        <20190514110334.424cf0be@canb.auug.org.au>
        <CAK7LNAS-KDO0Cuq34T5MZvJjxZ-A3HaG3qnJi3v4P9xS=4fRQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/caDE/H.1YQjykSJJ7NW76NM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAS-KDO0Cuq34T5MZvJjxZ-A3HaG3qnJi3v4P9xS=4fRQA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/caDE/H.1YQjykSJJ7NW76NM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Tue, 14 May 2019 13:16:37 +0900 Masahiro Yamada <yamada.masahiro@socione=
xt.com> wrote:
>
> If you are talking about the rebuild of
> .tmp_versions/*.mod files,
> yes, they are cleaned up every time.
>=20
> # Create temporary dir for module support files
> # clean it up only when building all modules
> cmd_crmodverdir =3D $(Q)mkdir -p $(MODVERDIR) \
>                   $(if $(KBUILD_MODULES),; rm -f $(MODVERDIR)/*)
>=20
>=20
> I think the reason is that
> we want to make sure stale modules are not remaining
> when CONFIG_MY_DRIVER=3Dm is turned into CONFIG_MY_DRIVER=3Dn
>=20
>=20
> Rebuilding .mod files is not expensive.
>=20
> I think this behavior can be improved, but
> that is how it has been working for a long time.

when you say "not expensive", how long is that?  Because an x86_64
allmodconfig build currently produces 7313 of those files, so at .01
seconds each (for example) that would add over a minute to each of my
builds ... and I do lots of builds every day.  OK, so it may not be
that significant (so a millisecond each is obviously not a problem),
but just wondering if it can be avoided.

--=20
Cheers,
Stephen Rothwell

--Sig_/caDE/H.1YQjykSJJ7NW76NM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzaSOYACgkQAVBC80lX
0GwsKgf/SSRx5sD4e36x/UZq9x39Q5HP3h3xDj3LZ/ouhU+uPqF8jwAM2LOw1rrF
DOWE3LZ87R1CkIGxgqup5F3D8nrn7DXcIak9xYOkGceIcL1cR0ZXFEOr+ov5rq4a
ftdpKuAtl/l4rF5FrcVjQFPwWsN04MHvvlZQyF4e1snO7LikYQCIW/xH8VXwoJy1
FiM4lfkfF5GyohEbktG/hLiBlK5rLgI8p2ESjFWoXi7fXnnjO5ji4RUgisLitYXq
cLLygqiKwmjGbNVnlBZs2uLTApQE483LqQP/NnJWazSyJZqKHVobtpwqgXa+5e3F
tuSee73joKe4qGHAQcISZQHcDjdkGw==
=hgY+
-----END PGP SIGNATURE-----

--Sig_/caDE/H.1YQjykSJJ7NW76NM--

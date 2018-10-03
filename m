From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: occassional build errors
Date: Wed, 3 Oct 2018 16:55:34 +1000
Message-ID: <20181003165534.4bc87bbe@canb.auug.org.au>
References: <20181003135038.24438d97@canb.auug.org.au>
        <CAK7LNARD6qxX1fz4XF7yj2vWZurayhtksQnGfHBEUtCTNLmGYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iB_/tHg=Djdt6hecZeIcLQu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNARD6qxX1fz4XF7yj2vWZurayhtksQnGfHBEUtCTNLmGYw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/iB_/tHg=Djdt6hecZeIcLQu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, 3 Oct 2018 13:31:54 +0900 Masahiro Yamada <yamada.masahiro@socionex=
t.com> wrote:
>
> On Wed, Oct 3, 2018 at 12:51 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > I don't know if that has anything to changes in the kbuild system, but
> > since Tuesday, I have been getting random build errors that go away aft=
er
> > I remove the object directory and build again. =20
>=20
> I have no idea.

I did not expect a fast/simple answer :-)

> Is it fine if you use kbuild tree from the last week?

I did not see this in next-20180928 or before i.e. it has only happened
yesterday and today.

> I added 4 kbuild patches this week, but they look irrelevant.

Yeah, that was my feeling as well.

> >  The latest example is this:
> >
> > include/linux/kconfig.h: file not recognized: file format not recognized
> > make[2]: *** [scripts/Makefile.build:492: crypto/crypto_user.o] Error 1
> > make[1]: *** [Makefile:1057: crypto] Error 2
> > make: *** [Makefile:152: sub-make] Error 2
> > Command exited with non-zero status 2
> >
> > It is always complaining about a .h file ...
> >
> > Makefile:152 is the MAKE lien below:
> >
> > # Invoke a second make in the output directory, passing relevant variab=
les
> > sub-make:
> >         $(Q)$(MAKE) -C $(KBUILD_OUTPUT) KBUILD_SRC=3D$(CURDIR) \
> >         -f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS=
))
> >
> > Makefile:1057 is the MAKE line below:
> >
> > PHONY +=3D $(vmlinux-dirs)
> > $(vmlinux-dirs): prepare scripts
> >         $(Q)$(MAKE) $(build)=3D$@ need-builtin=3D1
> >
> > scripts/Makefile.build:492 is the if_changed line below:
> >
> > $(multi-used-m): FORCE
> >         $(call if_changed,link_multi-m)
> >         @{ echo $(@:.o=3D.ko); echo $(filter-out FORCE,$^); \
> >            $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=3D.mod)
> > $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
> >
> > Not sure what else I can tell you.
>=20
> Does this happen only when building a module?

I don't know, sorry, I build with -s and -j80, so it is hard to tell
what it is currently up to.

> Can you provide a procedure
> to reproduce this?

Not really.  Each day, I merge all the trees, but between each merge I
do 3 builds (arm, powerpc and x86_64) and of the 100+ builds, yesterday
2 failed and so far today 2 have failed.  It is not even the same build
each time, or after the same merges.

The report above was from the arm build, a while later (a few merges
later) the x86_64 build failed - complaining about a different .h file.
--=20
Cheers,
Stephen Rothwell

--Sig_/iB_/tHg=Djdt6hecZeIcLQu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu0Z+YACgkQAVBC80lX
0GywDgf/SP1yD04vAfQa1S+aE3U04Xx1UFGHJZGr/XtxgNGBpNAk+BLV1JqoMxIt
iXMVtJTXw6yT2yEtwSfM6KgxZPBuUZO4HX+eShfBMIbgBg//3SDx7Y64JLL1tQCi
CYmGSt651457J/L6NjgSOeIUMYQPBkUcnVIzPtLfaybY6YYczVHSEP2Bbsgf8E6N
LUg2kXTGWckqZxIwi7Ak3FegYcvwOlfb0EoG1Jcmf5zI7wPXkI1Y/gzhOkrbZ8Ox
oJkJsc0VIBV+umd48kpHk1ba4+ZNoxNyai+LYGC94lZoYpMud8ZweM6HdgvkSqYR
jSKdQurd0s30/5nPOl8SnwrROrgpbQ==
=RTDd
-----END PGP SIGNATURE-----

--Sig_/iB_/tHg=Djdt6hecZeIcLQu--

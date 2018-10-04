From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: occassional build errors
Date: Thu, 4 Oct 2018 11:56:53 +1000
Message-ID: <20181004115653.6a97e131@canb.auug.org.au>
References: <20181003135038.24438d97@canb.auug.org.au>
        <CAK7LNARD6qxX1fz4XF7yj2vWZurayhtksQnGfHBEUtCTNLmGYw@mail.gmail.com>
        <20181003165534.4bc87bbe@canb.auug.org.au>
        <20181004103937.5601c02a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LLLlkLiT5vq4AgHkPGdThSb"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004103937.5601c02a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/LLLlkLiT5vq4AgHkPGdThSb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Thu, 4 Oct 2018 10:39:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> On Wed, 3 Oct 2018 16:55:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> > =20
> > > >  The latest example is this:
> > > >
> > > > include/linux/kconfig.h: file not recognized: file format not recog=
nized
> > > > make[2]: *** [scripts/Makefile.build:492: crypto/crypto_user.o] Err=
or 1
> > > > make[1]: *** [Makefile:1057: crypto] Error 2
> > > > make: *** [Makefile:152: sub-make] Error 2
> > > > Command exited with non-zero status 2
> > > >
> > > > It is always complaining about a .h file ...
> > > >
> > > > Makefile:152 is the MAKE lien below:
> > > >
> > > > # Invoke a second make in the output directory, passing relevant va=
riables
> > > > sub-make:
> > > >         $(Q)$(MAKE) -C $(KBUILD_OUTPUT) KBUILD_SRC=3D$(CURDIR) \
> > > >         -f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDG=
OALS))
> > > >
> > > > Makefile:1057 is the MAKE line below:
> > > >
> > > > PHONY +=3D $(vmlinux-dirs)
> > > > $(vmlinux-dirs): prepare scripts
> > > >         $(Q)$(MAKE) $(build)=3D$@ need-builtin=3D1
> > > >
> > > > scripts/Makefile.build:492 is the if_changed line below:
> > > >
> > > > $(multi-used-m): FORCE
> > > >         $(call if_changed,link_multi-m)
> > > >         @{ echo $(@:.o=3D.ko); echo $(filter-out FORCE,$^); \
> > > >            $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=3D.mod)
> > > > $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
> > > >
> > > > Not sure what else I can tell you.   =20
> > >=20
> > > Does this happen only when building a module?   =20
> >=20
> > I don't know, sorry, I build with -s and -j80, so it is hard to tell
> > what it is currently up to. =20
>=20
> Today, I got this from the x86_64 allmodconfig build after merging the hi=
d tree:
>=20
> x86_64-linux-gnu-ld: include/config/acpi.h: file not recognized: file tru=
ncated
> make[4]: *** [/home/sfr/next/next/scripts/Makefile.build:492: drivers/hid=
/i2c-hid/i2c-hid.o] Error 1
> make[3]: *** [/home/sfr/next/next/scripts/Makefile.build:520: drivers/hid=
/i2c-hid] Error 2
> make[2]: *** [/home/sfr/next/next/scripts/Makefile.build:520: drivers/hid=
] Error 2
> make[1]: *** [/home/sfr/next/next/Makefile:1057: drivers] Error 2
> make: *** [Makefile:152: sub-make] Error 2

OK, it seems to have to do with an object changing from a simple build
to a multi object build.

i.e. Tuesday's linux-next has these changes:

 obj-$(CONFIG_CRYPTO_USER) +=3D crypto_user.o
+crypto_user-y :=3D crypto_user_base.o crypto_user_stat.o
 obj-$(CONFIG_CRYPTO_CMAC) +=3D cmac.o

 obj-$(CONFIG_I2C_HID)				+=3D i2c-hid.o
+
+i2c-hid-objs					=3D  i2c-hid-core.o
+i2c-hid-$(CONFIG_DMI)				+=3D i2c-hid-dmi-quirks.o

--=20
Cheers,
Stephen Rothwell

--Sig_/LLLlkLiT5vq4AgHkPGdThSb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu1c2UACgkQAVBC80lX
0GwdUQf/WlyY0Y1siyfveEJbKxsAAftA3bJNsiSjkYgOodCapxb/Yq2bgsaPMHPG
1ES61T8DCgBXS5iolwOUBPRds2TZHJnODKWx4TZmXRF/S/jVlxnG/2PSI3KlSRWQ
aRTP10RSqMYawEwynYMNo0JVn7TU5ZsIBqk2pBn8gMn3uIWBD0U6d4c01BcBdgjh
eBgm6awG3svErwNfSohsOWxnqenEqLtVqsdEPEaxLwlsfNE7gNPPGSou95EbL+TZ
nRdd+FSZRJchmEOqxZit0BwxssIGR4xQS2Wzw2z4/ZQKKIGf7ryG49kUbFyn+HUy
r/LQOWiIWroyUEUdft7BFoE5NcHorw==
=4Cry
-----END PGP SIGNATURE-----

--Sig_/LLLlkLiT5vq4AgHkPGdThSb--

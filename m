From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: occassional build errors
Date: Wed, 3 Oct 2018 13:50:38 +1000
Message-ID: <20181003135038.24438d97@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/654D6paRw+IaZia8xFV6OEY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/654D6paRw+IaZia8xFV6OEY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

I don't know if that has anything to changes in the kbuild system, but
since Tuesday, I have been getting random build errors that go away after
I remove the object directory and build again.  The latest example is this:

include/linux/kconfig.h: file not recognized: file format not recognized
make[2]: *** [scripts/Makefile.build:492: crypto/crypto_user.o] Error 1
make[1]: *** [Makefile:1057: crypto] Error 2
make: *** [Makefile:152: sub-make] Error 2
Command exited with non-zero status 2

It is always complaining about a .h file ...

Makefile:152 is the MAKE lien below:

# Invoke a second make in the output directory, passing relevant variables
sub-make:
        $(Q)$(MAKE) -C $(KBUILD_OUTPUT) KBUILD_SRC=3D$(CURDIR) \
        -f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))

Makefile:1057 is the MAKE line below:

PHONY +=3D $(vmlinux-dirs)
$(vmlinux-dirs): prepare scripts
        $(Q)$(MAKE) $(build)=3D$@ need-builtin=3D1

scripts/Makefile.build:492 is the if_changed line below:

$(multi-used-m): FORCE
        $(call if_changed,link_multi-m)
        @{ echo $(@:.o=3D.ko); echo $(filter-out FORCE,$^); \
           $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=3D.mod)
$(call multi_depend, $(multi-used-m), .o, -objs -y -m)

Not sure what else I can tell you.

--=20
Cheers,
Stephen Rothwell

--Sig_/654D6paRw+IaZia8xFV6OEY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu0PI4ACgkQAVBC80lX
0Gy0LAf8CwCKEd/94KzYgo4ys0Oy5ZYUeu3an+fPimjOGPEqyd8p5d4I/wVqiy3j
A5i7t5mpEmYq5BhKHJf/PvsEbmI2V1QxrC+8ADSRxsOFB/szhLCD8UXGoROzyQcG
5L+qm8dIXmDLi7G1fTpJ7KGbPFqOmWPQt7QUIcf7TX+ZdAQF4UM6qJg8ygmr03+a
Dfm6YGEgYfQDQOmFWHlC9/wOHnPEzmcjjCtj/QKr3sAVaqyPOBNCr0JZlvTE7LjW
FvVVToQcewZxihhVCOYR76biJHPUoIAebq3N2RmWpb0AY0J2vIysjUfxjXd0Fh+M
gQB3Z9WVKeIyo3Ugy/6cD0ttFn7BfQ==
=aTXN
-----END PGP SIGNATURE-----

--Sig_/654D6paRw+IaZia8xFV6OEY--

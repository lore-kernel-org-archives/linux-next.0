From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: i7core_edac tree build warning
Date: Wed, 28 Oct 2009 18:59:14 +1100
Message-ID: <20091028185914.2f26c026.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_Oct_2009_18_59_14_+1100_dmXa3pPLrffcAKJ0"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932657AbZJ1H7U@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aristeu Rozanski <aris@redhat.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__28_Oct_2009_18_59_14_+1100_dmXa3pPLrffcAKJ0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (i386 defconfig) produced this warning:

WARNING: arch/x86/pci/built-in.o(__ksymtab_gpl+0x8): Section mismatch in re=
ference from the variable __ksymtab_pci_legacy_init to the function .init.t=
ext:pci_legacy_init()
The symbol pci_legacy_init is exported and annotated __init=20
Fix this by removing the __init annotation of pci_legacy_init or drop the e=
xport.

Introduced by commit a120a84ebbc4cbc9c1addddd2b491e3683b842a6 ("pci: Add
a probing code that seeks for an specific bus").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_Oct_2009_18_59_14_+1100_dmXa3pPLrffcAKJ0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrn+dIACgkQjjKRsyhoI8xXQwCfd43/t+cVkmTGcKUDpv1N0lAj
aQ0AnAvjMF2xVqD16ZEiPvPt99E/BaO1
=BsHG
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Oct_2009_18_59_14_+1100_dmXa3pPLrffcAKJ0--

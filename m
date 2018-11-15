From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xtensa tree with Linus' tree
Date: Fri, 16 Nov 2018 10:39:58 +1100
Message-ID: <20181116103958.585d9cff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Trk7nOsBO23/NTtD1yhr.jD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Firoz Khan <firoz.khan@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Trk7nOsBO23/NTtD1yhr.jD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xtensa tree got a conflict in:

  arch/xtensa/Makefile

between commit:

  37c8a5fafa3b ("kbuild: consolidate Devicetree dtb build rules")

from Linus' tree (it precedes v4.20-rc1) and commit:

  7c17225f2059 ("xtensa: generate uapi header and syscall table header file=
s")

from the xtensa tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/xtensa/Makefile
index be060dfb1cc3,1e7b179eb6fe..000000000000
--- a/arch/xtensa/Makefile
+++ b/arch/xtensa/Makefile
@@@ -90,6 -93,15 +90,9 @@@ boot		:=3D arch/xtensa/boo
  all Image zImage uImage: vmlinux
  	$(Q)$(MAKE) $(build)=3D$(boot) $@
 =20
 -%.dtb:
 -	$(Q)$(MAKE) $(build)=3D$(boot)/dts $(boot)/dts/$@
 -
 -dtbs: scripts
 -	$(Q)$(MAKE) $(build)=3D$(boot)/dts
 -
+ archheaders:
+ 	$(Q)$(MAKE) $(build)=3Darch/xtensa/kernel/syscalls all
+=20
  define archhelp
    @echo '* Image       - Kernel ELF image with reset vector'
    @echo '* zImage      - Compressed kernel image (arch/xtensa/boot/images=
/zImage.*)'

--Sig_/Trk7nOsBO23/NTtD1yhr.jD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvuA84ACgkQAVBC80lX
0GzSbwgAhq+d/fQsHqp5xB4g2FCHgHUHEPEUMFV11ZT6hH+nF5N2Fowo/T0NTDUI
jchYAFEojOUWbEoomhPJuPfnrSpcvybb5VWE7ObcMKEQDb5v6Rzuj1PUaHhrlqLr
wN7ZgKE7Bu8VDOvH9AowYyzg9cQ6IsuQJ9iZUhZ9/YLNT0/QvqLrShAb/wLRmkfq
+wFSyVNKKEkg/2JzUa/z/NfFURR5h2Mwp1KUThdeajJwq8Q5FrCscMNZBVXBO2pg
QH3UHAXDNzk6LfpaiFD55gq2S/EJfLlyALaN8fqEGawyyJVsaqAUxvYIx3yYGT1A
56qwUQ59KT30nbVTLX9tuHdUgWdpaw==
=VzFR
-----END PGP SIGNATURE-----

--Sig_/Trk7nOsBO23/NTtD1yhr.jD--

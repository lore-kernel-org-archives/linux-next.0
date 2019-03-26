From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bpf-next tree with the net tree
Date: Wed, 27 Mar 2019 09:14:37 +1100
Message-ID: <20190327091437.68ec6903@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RzM0gbDkZ=flEpOJ8zcbFAU"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luca Boccassi <bluca@debian.org>
List-Id: linux-next.vger.kernel.org

--Sig_/RzM0gbDkZ=flEpOJ8zcbFAU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bpf-next tree got a conflict in:

  tools/lib/bpf/Makefile

between commit:

  1d382264d911 ("bpf, libbpf: fix version info and add it to shared object")

from the net tree and commit:

  60e4786e229d ("tools/bpf: generate pkg-config file for libbpf")

from the bpf-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/lib/bpf/Makefile
index 5bf8e52c41fc,96e9571b0a2e..000000000000
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@@ -79,6 -79,9 +79,8 @@@ export prefix libdir src ob
  libdir_SQ =3D $(subst ','\'',$(libdir))
  libdir_relative_SQ =3D $(subst ','\'',$(libdir_relative))
 =20
 -LIB_FILE =3D libbpf.a libbpf.so
+ PC_FILE =3D libbpf.pc
+=20
  VERSION		=3D $(BPF_VERSION)
  PATCHLEVEL	=3D $(BPF_PATCHLEVEL)
  EXTRAVERSION	=3D $(BPF_EXTRAVERSION)
@@@ -129,18 -129,17 +131,19 @@@ all
  export srctree OUTPUT CC LD CFLAGS V
  include $(srctree)/tools/build/Makefile.include
 =20
 -BPF_IN    :=3D $(OUTPUT)libbpf-in.o
 -LIB_FILE :=3D $(addprefix $(OUTPUT),$(LIB_FILE))
 -PC_FILE :=3D $(addprefix $(OUTPUT),$(PC_FILE))
 -VERSION_SCRIPT :=3D libbpf.map
 +BPF_IN		:=3D $(OUTPUT)libbpf-in.o
 +VERSION_SCRIPT	:=3D libbpf.map
 +
 +LIB_TARGET	:=3D $(addprefix $(OUTPUT),$(LIB_TARGET))
 +LIB_FILE	:=3D $(addprefix $(OUTPUT),$(LIB_FILE))
++PC_FILE		:=3D $(addprefix $(OUTPUT),$(PC_FILE))
 =20
  GLOBAL_SYM_COUNT =3D $(shell readelf -s --wide $(BPF_IN) | \
  			   awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {s++} END{print s}')
  VERSIONED_SYM_COUNT =3D $(shell readelf -s --wide $(OUTPUT)libbpf.so | \
  			      grep -Eo '[^ ]+@LIBBPF_' | cut -d@ -f1 | sort -u | wc -l)
 =20
- CMD_TARGETS =3D $(LIB_TARGET)
 -CMD_TARGETS =3D $(LIB_FILE) $(PC_FILE)
++CMD_TARGETS =3D $(LIB_TARGET) $(PC_FILE)
 =20
  CXX_TEST_TARGET =3D $(OUTPUT)test_libbpf
 =20
@@@ -233,7 -232,7 +247,7 @@@ config-clean
 =20
  clean:
  	$(call QUIET_CLEAN, libbpf) $(RM) $(TARGETS) $(CXX_TEST_TARGET) \
- 		*.o *~ *.a *.so *.so.$(VERSION) .*.d .*.cmd LIBBPF-CFLAGS
 -		*.o *~ *.a *.so .*.d .*.cmd *.pc LIBBPF-CFLAGS
++		*.o *~ *.a *.so *.so.$(VERSION) .*.d .*.cmd *.pc LIBBPF-CFLAGS
  	$(call QUIET_CLEAN, core-gen) $(RM) $(OUTPUT)FEATURE-DUMP.libbpf
 =20
 =20

--Sig_/RzM0gbDkZ=flEpOJ8zcbFAU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyapE0ACgkQAVBC80lX
0GygTwf/Yo93YhpDOnBpP6Jr/rRoDsdFBnN4ttOr7s+hO2uOSBEXzjq3EfSkcsHk
tfoAL6rssj+i6zIzMjhu8X+WQwAg85K/x/vAQ8ZGAQ7TcbAaPWCXmofoEvrEYr9f
34skN4q2X0A+BRHFjAdLEpkAGC1ETivZYJdQxUV2J1mvP/Vb25aqX2Jnt5YueC+O
m3vBrf7Ck0cYYoSUgcErw6G5Y5V4vK5bzRYgkbAu90tCYMa6n67zpivT7m7PiGFE
jt8xWQ8+WRMbLBZZ+dOiG2OgrPDXB9GseZJnD6hixx/lkIPa+oTSISjCdJHIklAZ
JdE0yuDpQROfr5SMUglkc5c9cmvJbQ==
=klIF
-----END PGP SIGNATURE-----

--Sig_/RzM0gbDkZ=flEpOJ8zcbFAU--

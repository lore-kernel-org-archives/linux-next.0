From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the kselftest-fixes
 tree
Date: Thu, 14 May 2015 14:32:26 +1000
Message-ID: <20150514143226.530c0fad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Z+=xNrW0vOof28PCdrWIjGT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Shuah Khan <shuahkh@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Z+=xNrW0vOof28PCdrWIjGT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
tools/testing/selftests/x86/Makefile between commit e9886ace222e
("selftests, x86: Rework x86 target architecture detection") from the
kselftest-fixes tree and commit e22438f8e997 ("x86, selftests: Add a
test for the "sysret_ss_attrs" bug") from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc tools/testing/selftests/x86/Makefile
index 5bdb781163d1,9309097f58e8..000000000000
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@@ -1,10 -1,6 +1,10 @@@
 -.PHONY: all all_32 all_64 check_build32 clean run_tests
 +all:
 +
 +include ../lib.mk
 +
 +.PHONY: all all_32 all_64 warn_32bit_failure clean
 =20
- TARGETS_C_BOTHBITS :=3D sigreturn single_step_syscall
+ TARGETS_C_BOTHBITS :=3D sigreturn single_step_syscall sysret_ss_attrs
 =20
  BINARIES_32 :=3D $(TARGETS_C_BOTHBITS:%=3D%_32)
  BINARIES_64 :=3D $(TARGETS_C_BOTHBITS:%=3D%_64)
@@@ -38,20 -33,19 +38,23 @@@ $(TARGETS_C_BOTHBITS:%=3D%_32): %_32: %.
  $(TARGETS_C_BOTHBITS:%=3D%_64): %_64: %.c
  	$(CC) -m64 -o $@ $(CFLAGS) $(EXTRA_CFLAGS) $^ -lrt -ldl
 =20
 -check_build32:
 -	@if ! $(CC) -m32 -o /dev/null trivial_32bit_program.c; then	\
 -	  echo "Warning: you seem to have a broken 32-bit build" 2>&1; 	\
 -	  echo "environment.  If you are using a Debian-like";		\
 -	  echo " distribution, try:"; 					\
 -	  echo "";							\
 -	  echo "  apt-get install gcc-multilib libc6-i386 libc6-dev-i386"; \
 -	  echo "";							\
 -	  echo "If you are using a Fedora-like distribution, try:";	\
 -	  echo "";							\
 -	  echo "  yum install glibc-devel.*i686";			\
 -	  exit 1;							\
 -	fi
 +# x86_64 users should be encouraged to install 32-bit libraries
 +ifeq ($(CAN_BUILD_I386)$(CAN_BUILD_X86_64),01)
 +all: warn_32bit_failure
 +
 +warn_32bit_failure:
 +	@echo "Warning: you seem to have a broken 32-bit build" 2>&1; 	\
 +	echo "environment.  This will reduce test coverage of 64-bit" 2>&1; \
 +	echo "kernels.  If you are using a Debian-like distribution," 2>&1; \
 +	echo "try:"; 2>&1; \
 +	echo "";							\
 +	echo "  apt-get install gcc-multilib libc6-i386 libc6-dev-i386"; \
 +	echo "";							\
 +	echo "If you are using a Fedora-like distribution, try:";	\
 +	echo "";							\
 +	echo "  yum install glibc-devel.*i686";				\
 +	exit 0;
 +endif
+=20
+ # Some tests have additional dependencies.
+ sysret_ss_attrs_64: thunks.S

--Sig_/Z+=xNrW0vOof28PCdrWIjGT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVVCVeAAoJEMDTa8Ir7ZwVAf4P/0hht1vfgdFHPEAgP/icGDkZ
0DnN9pQWQ8FCQOCOsYVMdUJokJiTq1QT4HI2oSxIEImaEG7IjoFblmnZCuhVXiaz
TeJBoBfLeYEKmxuKNDa392kT2ar4dFNIm2AYGzgXpFig0dBhbkv6T65s/Y3XnjMh
Fby3E8kjMTDiKWAFSbq0jm7bVCVZKnBbdEyW+8DkcfH/btKX6TVfVOF1ZkT4sIcU
6FPHW/Gpp57X6SA/lR4OmQgaXPDcYIsBDsywCtFs3JoD2PDtCHjGHxYyYclDz6DL
eSAL3xCwPh3Vf4YsINGKLLYNRxUGQKc6hTzm74hALUl+yZ0C+kquiY010Nsu12oA
+bMT5zHl1JhXmvaSMIuFdOdliraSlDING0gJYvFddW4vfKM6LYsix5kaHWeT/fJR
Ord3XV3aMJAm4lgBb+317JwcvKuJgyEsirxxS5oI6tWQ7LjQz3oiga+DcxjVVXdW
z8UvGoPTxmH4C8E6Za17OJg3ko3WJrNk7ElOYtMqiz95eUU+N5XVnTy7Hmcny1ox
8NNCv0uwIe3f5eQnJ8E6YsA60cK6BagrC0flY/bH9CJXB05pYLSg2eWvw5z4xG5O
yT9n/iNphZWbX3PDlkXUgT98MzE3Em/VdBXpSPW77N0nsHJlAADUAr8xYGQO8FWv
CdiRuEbKa52KegfQQQe4
=aJvm
-----END PGP SIGNATURE-----

--Sig_/Z+=xNrW0vOof28PCdrWIjGT--

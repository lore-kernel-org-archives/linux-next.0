From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kselftest tree with the powerpc-mpe
 tree
Date: Mon, 13 Apr 2015 20:16:55 +1000
Message-ID: <20150413201655.2fa3af76@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/43V.IWb/mpoZCotqby1IeDY"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34080 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753478AbbDMKRC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 06:17:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sam bobroff <sam.bobroff@au1.ibm.com>

--Sig_/43V.IWb/mpoZCotqby1IeDY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

Today's linux-next merge of the kselftest tree got a conflict in
tools/testing/selftests/powerpc/tm/Makefile between commit 7fe924d9d71c
("selftests/powerpc: Add transactional syscall test") from the
powerpc-mpe tree and commit 6faeeea44b84 ("selftests: Add install
support for the powerpc tests") from the kselftest tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc tools/testing/selftests/powerpc/tm/Makefile
index 122cf1830de8,34f2ec634b40..000000000000
--- a/tools/testing/selftests/powerpc/tm/Makefile
+++ b/tools/testing/selftests/powerpc/tm/Makefile
@@@ -1,18 -1,10 +1,13 @@@
- PROGS :=3D tm-resched-dscr tm-syscall
 -TEST_PROGS :=3D tm-resched-dscr
++TEST_PROGS :=3D tm-resched-dscr tm-syscall
 =20
- all: $(PROGS)
+ all: $(TEST_PROGS)
 =20
- $(PROGS): ../harness.c
+ $(TEST_PROGS): ../harness.c
 =20
 +tm-syscall: tm-syscall-asm.S
 +tm-syscall: CFLAGS +=3D -mhtm
 +
- run_tests: all
- 	@-for PROG in $(PROGS); do \
- 		./$$PROG; \
- 	done;
+ include ../../lib.mk
 =20
  clean:
- 	rm -f $(PROGS) *.o
-=20
- .PHONY: all run_tests clean
+ 	rm -f $(TEST_PROGS) *.o

--Sig_/43V.IWb/mpoZCotqby1IeDY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAEBCAAGBQJVK5ebAAoJEMDTa8Ir7ZwVQscP902cv/11g+NqmBo/SXLoJLnM
TYhLuP53z9vkjxkvmkouY86VMVE6ecERGfkUTba/utSe97MdOZL0yun8bM0Dcqld
/b0figl8Ps8AleFGzXUurFrkONywsgdiN8Z8Atd449I9WyBMPsQ5iZE5dgp77YoA
ZI7Il4oEitsggUrnKwQgIUC3oAkRBtNURdDWeN+U0j5IBz/KvnN4Z4odQRDmq4H/
9Mat7penUDTSx9UzJJPe9uyTodwWHlT+jGGD9PM/CDgS/ZHY0PfGzCvuoteq2S5w
6RHJoWVkZXuJlzQbqsDyd+Tcg+JZllt1+0DSOHbtvFAhr3zOfTARz3jzmYbExAaz
yCLMj9HQLfyPb1jMLc3mFzGu+Q1DlDkf3+LX0tUiZjjrUUxDml0ZF1VxYKHKqPLa
IOK5JMF46G3fpB/4o/zmCGajhJ5PNwHO/8SPRPfyDJ9CCJyoPaAHKOGEn/Id+86+
rGc/NoXCoQdXK1uGUKK9hgEFnIpFnHBarjwDOQbLBx0bOMFXXrb5nhAQKiTfP00m
dA/VgX24jnR66thXciGqj84XWmd7jRVzYxZVv6pwT46r1leTsvnSeBaHuTU/JiHD
HVRvlSqZJZDroDtuMj12edCVUUwXKVqpd1c+NLdDTQwyLwsxbFysVOdU8+kK/f/X
mObkjGjOto/VfGHnwuM=
=qPaH
-----END PGP SIGNATURE-----

--Sig_/43V.IWb/mpoZCotqby1IeDY--

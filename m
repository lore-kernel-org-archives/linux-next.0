From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] tools/perf: fix build when WERROR=1
Date: Wed,  8 Aug 2012 18:05:50 +0300
Message-ID: <1344438350-22574-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:1905 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754170Ab2HHPFn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Aug 2012 11:05:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

util/symbol.c: In function =E2=80=98hex2u64=E2=80=99:
util/symbol.c:2836:2: error: passing argument 2 of =E2=80=98strtoull=E2=
=80=99 from incompatible pointer type [-Werror]
In file included from util/symbol.c:3:0:
/usr/include/stdlib.h:215:31: note: expected =E2=80=98char ** restrict=E2=
=80=99 but argument is of type =E2=80=98const char **=E2=80=99
cc1: all warnings being treated as errors
make[1]: *** [util/symbol.o] Error 1
make[1]: Leaving directory `/home/andy/prj/linux-2.6/tools/perf'
make: *** [perf] Error 2

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 tools/perf/util/symbol.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index ba2a489..26e695c 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -2831,7 +2831,7 @@ int machines__create_kernel_maps(struct rb_root *=
machines, pid_t pid)
  */
 int hex2u64(const char *ptr, u64 *long_val)
 {
-	const char *p =3D ptr;
+	char *p;
=20
 	*long_val =3D strtoull(ptr, &p, 16);
=20
--=20
1.7.10.4

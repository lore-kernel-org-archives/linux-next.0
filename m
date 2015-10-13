From: Jiri Olsa <jolsa@redhat.com>
Subject: [PATCH] tools include: Fix =?utf-8?Q?stric?=
 =?utf-8?Q?t-aliasing_rules_breakage_=22tools=2Finclude=2Flinux=2Fcompiler?=
 =?utf-8?B?Lmg6NjY6IGVycm9yOiBkZXJlZmVyZW5jaW5nIHBvaW50ZXIg4oCYcmVzLjQx?=
 =?utf-8?B?4oCZ?= does break strict-aliasing rules"
Date: Tue, 13 Oct 2015 10:52:14 +0200
Message-ID: <20151013085214.GB2705@krava.brq.redhat.com>
References: <CAHTgTXXzH7id6qrpG1qvR8BsKPjny4+kjcvnA1zS6OaMx-+TtA@mail.gmail.com>
 <20151008091221.GC17581@krava.landal.opennet>
 <CAHTgTXVQRdsXjsHfjY8hMXXLMWyZDMEuJKAd+eVhfEN5jUBY5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52025 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751364AbbJMIwS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Oct 2015 04:52:18 -0400
Content-Disposition: inline
In-Reply-To: <CAHTgTXVQRdsXjsHfjY8hMXXLMWyZDMEuJKAd+eVhfEN5jUBY5Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinson Lee <vlee@twopensource.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, Andi Kleen <ak@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, Jiri Olsa <jolsa@kernel.org>, Rabin Vincent <rabin@rab.in>, Martin =?utf-8?B?TGnFoWth?= <mliska@suse.cz>

On Mon, Oct 12, 2015 at 05:48:17PM -0700, Vinson Lee wrote:

SNIP

> >                 __builtin_memcpy((void *)res, (const void *)p, size=
);
> > @@ -59,11 +64,14 @@ static __always_inline void __read_once_size(co=
nst volatile void *p, void *res,
> >
> >  static __always_inline void __write_once_size(volatile void *p, vo=
id *res, int size)
> >  {
> > +       u64_alias_t *u64_p =3D (u64_alias_t*) p;
> > +       u64_alias_t *u64_res =3D (u64_alias_t*) res;
> > +
> >         switch (size) {
> >         case 1: *(volatile __u8 *)p =3D *(__u8 *)res; break;
> >         case 2: *(volatile __u16 *)p =3D *(__u16 *)res; break;
> >         case 4: *(volatile __u32 *)p =3D *(__u32 *)res; break;
> > -       case 8: *(volatile __u64 *)p =3D *(__u64 *)res; break;
> > +       case 8: *u64_p =3D *u64_res; break;
> >         default:
> >                 barrier();
> >                 __builtin_memcpy((void *)p, (const void *)res, size=
);
>=20
>=20
> This patch fixes my perf build error with GCC 4.4.
>=20
> Vinson

posting complete patch

thanks,
jirka


---
Vinson reported build breakage with gcc 4.4 due to strict-aliasing.

   CC       util/annotate.o
 cc1: warnings being treated as errors
 util/annotate.c: In function =E2=80=98disasm__purge=E2=80=99:
 linux-next/tools/include/linux/compiler.h:66: error: dereferencing
 pointer =E2=80=98res.41=E2=80=99 does break strict-aliasing rules

The reason is READ_ONCE/WRITE_ONCE code we took from kernel sources.
They intentionaly break aliasing rules. While this is ok for kernel
because it's built with -fno-strict-aliasing, it breaks perf which
is build with -Wstrict-aliasing=3D3.

Using extra __may_alias__ type to allow aliasing in this case.

Reported-by: Vinson Lee <vlee@twopensource.com>
Link: http://lkml.kernel.org/n/tip-ffqyehdzx3w41j6smao15t0a@git.kernel.=
org
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 tools/include/linux/compiler.h | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/tools/include/linux/compiler.h b/tools/include/linux/compi=
ler.h
index 9098083869c8..fa7208a32d76 100644
--- a/tools/include/linux/compiler.h
+++ b/tools/include/linux/compiler.h
@@ -43,13 +43,29 @@
=20
 #include <linux/types.h>
=20
+/*
+ * Following functions are taken from kernel sources and
+ * break aliasing rules in their original form.
+ *
+ * While kernel is compiled with -fno-strict-aliasing,
+ * perf uses -Wstrict-aliasing=3D3 which makes build fail
+ * under gcc 4.4.
+ *
+ * Using extra __may_alias__ type to allow aliasing
+ * in this case.
+ */
+typedef __u8  __attribute__((__may_alias__))  __u8_alias_t;
+typedef __u16 __attribute__((__may_alias__)) __u16_alias_t;
+typedef __u32 __attribute__((__may_alias__)) __u32_alias_t;
+typedef __u64 __attribute__((__may_alias__)) __u64_alias_t;
+
 static __always_inline void __read_once_size(const volatile void *p, v=
oid *res, int size)
 {
 	switch (size) {
-	case 1: *(__u8 *)res =3D *(volatile __u8 *)p; break;
-	case 2: *(__u16 *)res =3D *(volatile __u16 *)p; break;
-	case 4: *(__u32 *)res =3D *(volatile __u32 *)p; break;
-	case 8: *(__u64 *)res =3D *(volatile __u64 *)p; break;
+	case 1: *(__u8_alias_t  *) res =3D *(volatile __u8_alias_t  *) p; bre=
ak;
+	case 2: *(__u16_alias_t *) res =3D *(volatile __u16_alias_t *) p; bre=
ak;
+	case 4: *(__u32_alias_t *) res =3D *(volatile __u32_alias_t *) p; bre=
ak;
+	case 8: *(__u64_alias_t *) res =3D *(volatile __u64_alias_t *) p; bre=
ak;
 	default:
 		barrier();
 		__builtin_memcpy((void *)res, (const void *)p, size);
@@ -60,10 +76,10 @@ static __always_inline void __read_once_size(const =
volatile void *p, void *res,
 static __always_inline void __write_once_size(volatile void *p, void *=
res, int size)
 {
 	switch (size) {
-	case 1: *(volatile __u8 *)p =3D *(__u8 *)res; break;
-	case 2: *(volatile __u16 *)p =3D *(__u16 *)res; break;
-	case 4: *(volatile __u32 *)p =3D *(__u32 *)res; break;
-	case 8: *(volatile __u64 *)p =3D *(__u64 *)res; break;
+	case 1: *(volatile  __u8_alias_t *) p =3D *(__u8_alias_t  *) res; bre=
ak;
+	case 2: *(volatile __u16_alias_t *) p =3D *(__u16_alias_t *) res; bre=
ak;
+	case 4: *(volatile __u32_alias_t *) p =3D *(__u32_alias_t *) res; bre=
ak;
+	case 8: *(volatile __u64_alias_t *) p =3D *(__u64_alias_t *) res; bre=
ak;
 	default:
 		barrier();
 		__builtin_memcpy((void *)p, (const void *)res, size);
--=20
2.4.3

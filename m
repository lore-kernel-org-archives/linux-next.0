From: Jiri Olsa <jolsa@redhat.com>
Subject: Re: next-20151007 perf build =?utf-8?Q?err?=
 =?utf-8?Q?or_=22tools=2Finclude=2Flinux=2Fcompiler=2Eh=3A66=3A_error=3A_d?=
 =?utf-8?Q?ereferencing_pointer_=E2=80=98res=2E41?= =?utf-8?B?4oCZ?= does
 break strict-aliasing rules"
Date: Thu, 8 Oct 2015 11:12:21 +0200
Message-ID: <20151008091221.GC17581@krava.landal.opennet>
References: <CAHTgTXXzH7id6qrpG1qvR8BsKPjny4+kjcvnA1zS6OaMx-+TtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60239 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755230AbbJHJMZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Oct 2015 05:12:25 -0400
Content-Disposition: inline
In-Reply-To: <CAHTgTXXzH7id6qrpG1qvR8BsKPjny4+kjcvnA1zS6OaMx-+TtA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinson Lee <vlee@twopensource.com>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andi Kleen <ak@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, Jiri Olsa <jolsa@kernel.org>, Rabin Vincent <rabin@rab.in>, Martin =?utf-8?B?TGnFoWth?= <mliska@suse.cz>

On Wed, Oct 07, 2015 at 11:28:26AM -0700, Vinson Lee wrote:
> Hi.
>=20
> I hit this perf build error with next-20151007 with GCC 4.4.
>=20
>   CC       util/annotate.o
> cc1: warnings being treated as errors
> util/annotate.c: In function =E2=80=98disasm__purge=E2=80=99:
> linux-next/tools/include/linux/compiler.h:66: error: dereferencing
> pointer =E2=80=98res.41=E2=80=99 does break strict-aliasing rules
> linux-next/tools/include/linux/compiler.h:66: note: initialized from =
here
> util/annotate.c: In function =E2=80=98symbol__annotate=E2=80=99:
> linux-next/tools/include/linux/compiler.h:66: error: dereferencing
> pointer =E2=80=98res.41=E2=80=99 does break strict-aliasing rules
> linux-next/tools/include/linux/compiler.h:66: note: initialized from =
here
> linux-next/tools/include/linux/compiler.h:52: error: dereferencing
> pointer =E2=80=98res.32=E2=80=99 does break strict-aliasing rules
> linux-next/tools/include/linux/compiler.h:52: note: initialized from =
here
>=20
> Cheers,
> Vinson

we took this stuff from kernel, which is built with -fno-strict-aliasin=
g
which we use -Wstrict-aliasing=3D3

we need something like below defined for all the types, but I'm still
hoping for some nicer solution.. however patch below fixed the build
for me.. could you please test?

thanks,
jirka


---
diff --git a/tools/include/linux/compiler.h b/tools/include/linux/compi=
ler.h
index 9098083..0ed624f 100644
--- a/tools/include/linux/compiler.h
+++ b/tools/include/linux/compiler.h
@@ -43,13 +43,18 @@
=20
 #include <linux/types.h>
=20
+typedef u64 __attribute__((__may_alias__)) u64_alias_t;
+
 static __always_inline void __read_once_size(const volatile void *p, v=
oid *res, int size)
 {
+	u64_alias_t *u64_p =3D (u64_alias_t*) p;
+	u64_alias_t *u64_res =3D (u64_alias_t*) res;
+
 	switch (size) {
 	case 1: *(__u8 *)res =3D *(volatile __u8 *)p; break;
 	case 2: *(__u16 *)res =3D *(volatile __u16 *)p; break;
 	case 4: *(__u32 *)res =3D *(volatile __u32 *)p; break;
-	case 8: *(__u64 *)res =3D *(volatile __u64 *)p; break;
+	case 8: *u64_res =3D *u64_p; break;
 	default:
 		barrier();
 		__builtin_memcpy((void *)res, (const void *)p, size);
@@ -59,11 +64,14 @@ static __always_inline void __read_once_size(const =
volatile void *p, void *res,
=20
 static __always_inline void __write_once_size(volatile void *p, void *=
res, int size)
 {
+	u64_alias_t *u64_p =3D (u64_alias_t*) p;
+	u64_alias_t *u64_res =3D (u64_alias_t*) res;
+
 	switch (size) {
 	case 1: *(volatile __u8 *)p =3D *(__u8 *)res; break;
 	case 2: *(volatile __u16 *)p =3D *(__u16 *)res; break;
 	case 4: *(volatile __u32 *)p =3D *(__u32 *)res; break;
-	case 8: *(volatile __u64 *)p =3D *(__u64 *)res; break;
+	case 8: *u64_p =3D *u64_res; break;
 	default:
 		barrier();
 		__builtin_memcpy((void *)p, (const void *)res, size);

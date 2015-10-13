From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [PATCH 7/8] tools include: Fix strict-aliasing rules breakage
Date: Tue, 13 Oct 2015 16:41:42 -0300
Message-ID: <1444765303-8257-8-git-send-email-acme@kernel.org>
References: <1444765303-8257-1-git-send-email-acme@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444765303-8257-1-git-send-email-acme@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Andi Kleen <ak@linux.intel.com>, Martin Liska <mliska@suse.cz>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Rabin Vincent <rabin@rab.in>, linux-next@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
List-Id: linux-next.vger.kernel.org

=46rom: Jiri Olsa <jolsa@redhat.com>

Vinson reported build breakage with gcc 4.4 due to strict-aliasing.

   CC       util/annotate.o
 cc1: warnings being treated as errors
 util/annotate.c: In function =E2=80=98disasm__purge=E2=80=99:
 linux-next/tools/include/linux/compiler.h:66: error: dereferencing
 pointer =E2=80=98res.41=E2=80=99 does break strict-aliasing rules

The reason is READ_ONCE/WRITE_ONCE code we took from kernel sources.  T=
hey
intentionaly break aliasing rules. While this is ok for kernel because =
it's
built with -fno-strict-aliasing, it breaks perf which is build with
-Wstrict-aliasing=3D3.

Using extra __may_alias__ type to allow aliasing in this case.

Reported-and-tested-by: Vinson Lee <vlee@twopensource.com>
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Martin Liska <mliska@suse.cz>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Rabin Vincent <rabin@rab.in>
Cc: linux-next@vger.kernel.org
Link: http://lkml.kernel.org/r/20151013085214.GB2705@krava.brq.redhat.c=
om
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
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
2.1.0

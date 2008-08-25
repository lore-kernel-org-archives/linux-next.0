From: Austin Zhang <austin_zhang@linux.intel.com>
Subject: Re: [Fwd: FW: linux-next: manual merge of the crypto tree]
Date: Mon, 25 Aug 2008 11:14:51 -0400
Message-ID: <1219677291.28140.3.camel@austinz.bj.intel.com.bj.intel.com>
References: <1219661427.25749.11.camel@austinz.bj.intel.com.bj.intel.com>
	 <20080825123246.GA8663@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.89]:56197 "EHLO
	fmsmga101.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752740AbYHYPRi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Aug 2008 11:17:38 -0400
In-Reply-To: <20080825123246.GA8663@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: herbert@gondor.apana.org.au, sfr@canb.auug.org.au, linux-next@vger.kernel.org, tglx@linutronix.de, hpa@zytor.com, suresh.b.siddha@intel.com

Added Intel processor SSE4.2 feature flag.

Signed-off-by: Austin Zhang <austin.zhang@intel.com>
---
 cpufeature.h |    2 ++
 1 file changed, 2 insertions(+)

diff -Naurp linux-2.6-tip/include/asm-x86/cpufeature.h linux-2.6-tip-pa=
tch/include/asm-x86/cpufeature.h
--- linux-2.6-tip/include/asm-x86/cpufeature.h	2008-08-25 13:38:30.0000=
00000 -0400
+++ linux-2.6-tip-patch/include/asm-x86/cpufeature.h	2008-08-25 06:17:0=
7.000000000 -0400
@@ -92,6 +92,7 @@
 #define X86_FEATURE_CX16	(4*32+13) /* CMPXCHG16B */
 #define X86_FEATURE_XTPR	(4*32+14) /* Send Task Priority Messages */
 #define X86_FEATURE_DCA		(4*32+18) /* Direct Cache Access */
+#define X86_FEATURE_XMM4_2	(4*32+20) /* Streaming SIMD Extensions-4.2 =
*/
 #define X86_FEATURE_X2APIC	(4*32+21) /* x2APIC */
 #define X86_FEATURE_XSAVE	(4*32+26) /* XSAVE */
=20
@@ -192,6 +193,7 @@ extern const char * const x86_power_flag
 #define cpu_has_gbpages		boot_cpu_has(X86_FEATURE_GBPAGES)
 #define cpu_has_arch_perfmon	boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
 #define cpu_has_pat		boot_cpu_has(X86_FEATURE_PAT)
+#define cpu_has_xmm4_2		boot_cpu_has(X86_FEATURE_XMM4_2)
 #define cpu_has_x2apic		boot_cpu_has(X86_FEATURE_X2APIC)
 #define cpu_has_xsave		boot_cpu_has(X86_FEATURE_XSAVE)
=20

On Mon, 2008-08-25 at 14:32 +0200, Ingo Molnar wrote:
> * Austin Zhang <austin_zhang@linux.intel.com> wrote:
>=20
> > A =EF=BB=BFstandalone patch to add sse42 flags.
>=20
> a proper changelog with signoffs, etc. would be nice.
>=20
> > (But, Ingo, I thought this would still make conflicts when Stephen=20
> > want to merge into crypto tree, right?)
>=20
> i can make the commit a separate branch that you can pull. (without=20
> pulling anything else)
>=20
> (as long as the crypto tree is git based, which i assume it is.)
>=20
> 	Ingo

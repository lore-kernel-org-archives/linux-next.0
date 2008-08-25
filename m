From: Austin Zhang <austin_zhang@linux.intel.com>
Subject: [Fwd: FW: linux-next: manual merge of the crypto tree]
Date: Mon, 25 Aug 2008 06:50:27 -0400
Message-ID: <1219661427.25749.11.camel@austinz.bj.intel.com.bj.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:17967 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757137AbYHYKxN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 06:53:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mingo@elte.hu, herbert@gondor.apana.org.au
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, tglx@linutronix.de, hpa@zytor.com

A =EF=BB=BFstandalone patch to add sse42 flags.
(But, Ingo, I thought this would still make conflicts when Stephen want=
 to merge into crypto tree, right?)
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


-----Original Message-----
=46rom: Zhang, Austin=20
Sent: 2008=E5=B9=B48=E6=9C=8825=E6=97=A5 16:05
To: 'Ingo Molnar'; Herbert Xu
Cc: Stephen Rothwell; linux-next@vger.kernel.org; Siddha, Suresh B; Tho=
mas Gleixner; H. Peter Anvin
Subject: RE: linux-next: manual merge of the crypto tree

>> new x86 feature bits should definitely show up in the x86 tree too
So can we add sse4.1 into this patch also as:=20
#define X86_FEATURE_XMM4_1	(4*32+19)
even though now no obvious user is asking it in kernel.=20

-----Original Message-----
=46rom: Ingo Molnar [mailto:mingo@elte.hu]=20
Sent: 2008=E5=B9=B48=E6=9C=8825=E6=97=A5 15:39
To: Herbert Xu
Cc: Stephen Rothwell; linux-next@vger.kernel.org; Siddha, Suresh B; Zha=
ng, Austin; Thomas Gleixner; H. Peter Anvin
Subject: Re: linux-next: manual merge of the crypto tree


* Herbert Xu <herbert@gondor.apana.org.au> wrote:

> On Mon, Aug 25, 2008 at 04:44:18PM +1000, Stephen Rothwell wrote:
> >=20
> > On Thu, 7 Aug 2008 13:35:25 +1000 Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
> > >
> > > Today's linux-next merge of the crypto tree got a conflict in
> > > include/asm-x86/cpufeature.h between commit
> > > 32e1d0a0651004f5fe47f85a2a5c725ad579a90c ("x64, x2apic/intr-remap=
: cpuid
> > > bits for x2apic feature") from the x86 tree and commit
> > > 1f4f8a5d7935c81b5b3c7601ec9ac021db30ba4f ("crypto: crc32c - Use I=
ntel
> > > CRC32 instruction") from the crypto tree.
> > >=20
> > > Just simple overlapping additions.  I added both of them and can =
carry
> > > the fixup.
> >=20
> > This now also conflicts with commit
> > a648bf4632628c787abb0514277f2a231fca39ca ("x86, xsave: xsave cpuid
> > feature bits") from the x86 tree.
> >=20
> > The fixup looks like below.  Maybe the X86_FEATURE_XMM4_2 bits coul=
d also
>=20
> Yep looks good.
>=20
> > be added in the x86 tree.
>=20
> Sure that sounds like a good idea.

new x86 feature bits should definitely show up in the x86 tree too.=20
Could you please send a standalone patch that only touches the .h file,=
=20
which could be applied to v2.6.27 as well? Thanks,

	Ingo

From: "Zhang, Austin" <austin.zhang@intel.com>
Subject: RE: linux-next: manual merge of the crypto tree
Date: Mon, 25 Aug 2008 16:05:28 +0800
Message-ID: <9D7649D18729DE4BB2BD7B494F7FEDC201B96C98@pdsmsx415.ccr.corp.intel.com>
References: <20080807133525.8901e2ef.sfr@canb.auug.org.au> <20080825164418.3e74cad0.sfr@canb.auug.org.au> <20080825065525.GA23089@gondor.apana.org.au> <20080825073926.GA9147@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:40254 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752281AbYHYIFg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Aug 2008 04:05:36 -0400
Content-class: urn:content-classes:message
In-Reply-To: <20080825073926.GA9147@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "Siddha, Suresh B" <suresh.b.siddha@intel.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

>> new x86 feature bits should definitely show up in the x86 tree too
So can we add sse4.1 into this patch also as:=20
#define X86_FEATURE_XMM4_1	(4*32+19)
even though now no obvious user is asking it in kernel.=20

-----Original Message-----
=46rom: Ingo Molnar [mailto:mingo@elte.hu]=20
Sent: 2008=C4=EA8=D4=C225=C8=D5 15:39
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

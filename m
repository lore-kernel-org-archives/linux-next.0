From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 12 Aug 2015 21:04:22 +0200
Message-ID: <20150812190422.GZ16853@twins.programming.kicks-ass.net>
References: <20150812150954.36bc605c@canb.auug.org.au>
 <55CB49CA.8050305@oracle.com>
 <20150812172105.GW16853@twins.programming.kicks-ass.net>
 <20150812174625.GH18673@twins.programming.kicks-ass.net>
 <55CB8DAD.6090508@oracle.com>
 <BB71B9C8-8FA6-4BED-8C80-BCBF08A66812@zytor.com>
 <20150812183614.GY16853@twins.programming.kicks-ass.net>
 <55CB9424.7030801@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:52517 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826AbbHLTE2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 15:04:28 -0400
Content-Disposition: inline
In-Reply-To: <55CB9424.7030801@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, David Vrabel <david.vrabel@citrix.com>

On Wed, Aug 12, 2015 at 02:44:52PM -0400, Boris Ostrovsky wrote:
> On 08/12/2015 02:36 PM, Peter Zijlstra wrote:
> >On Wed, Aug 12, 2015 at 11:26:41AM -0700, H. Peter Anvin wrote:
> >>One option might be to do the addition in assembly, i.e.:
> >>
> >>"i" (key), "i" (index)
> >>
> >>... and put the addition into the assembly source.
> >Like so? Seems to build on gcc-4.6.
> 
> Yes, this builds on 4.4.4. as well.

Thanks, Ingo / Hpa, can you make the below patch appear in the right tip
branch?

---
Subject: jump_label, x86: Fix asm for older GCCs
From: Peter Zijlstra <peterz@infradead.org>
Date: Wed Aug 12 20:58:48 CEST 2015

Boris reported that: gcc version 4.4.4 20100503 (Red Hat 4.4.4-2)
fails to build. The problem appears that even though @key and @branch
are compile time constants it doesn't see: &((char *)key)[branch]
as an immediate. More recent GCCs don't appear to have this problem.

In particular, Red Hat backported the asm goto feature into 4.4,
'normal' 4.4 compilers will not have this feature and thus not run
into this asm.

The solution is to supply both values to the asm as immediates and do
the addition in asm.

Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
Reported-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Tested-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/jump_label.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/arch/x86/include/asm/jump_label.h
+++ b/arch/x86/include/asm/jump_label.h
@@ -22,9 +22,9 @@ static __always_inline bool arch_static_
 		".byte " __stringify(STATIC_KEY_INIT_NOP) "\n\t"
 		".pushsection __jump_table,  \"aw\" \n\t"
 		_ASM_ALIGN "\n\t"
-		_ASM_PTR "1b, %l[l_yes], %c0 \n\t"
+		_ASM_PTR "1b, %l[l_yes], %c0 + %c1 \n\t"
 		".popsection \n\t"
-		: :  "i" (&((char *)key)[branch]) : : l_yes);
+		: :  "i" (key), "i" (branch) : : l_yes);
 
 	return false;
 l_yes:
@@ -38,9 +38,9 @@ static __always_inline bool arch_static_
 		"2:\n\t"
 		".pushsection __jump_table,  \"aw\" \n\t"
 		_ASM_ALIGN "\n\t"
-		_ASM_PTR "1b, %l[l_yes], %c0 \n\t"
+		_ASM_PTR "1b, %l[l_yes], %c0 + %c1 \n\t"
 		".popsection \n\t"
-		: :  "i" (&((char *)key)[branch]) : : l_yes);
+		: :  "i" (key), "i" (branch) : : l_yes);
 
 	return false;
 l_yes:

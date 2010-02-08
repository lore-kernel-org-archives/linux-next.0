From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH v8] RO/NX protection for loadable kernel modules
Date: Mon, 8 Feb 2010 12:15:31 +1030
Message-ID: <201002081215.31527.rusty@rustcorp.com.au>
References: <817ecb6f1001311522q52bf4eebmb748c486dcd5ad35@mail.gmail.com> <873a1jdyrg.fsf@basil.nowhere.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:39348 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755366Ab0BHBpf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Feb 2010 20:45:35 -0500
In-Reply-To: <873a1jdyrg.fsf@basil.nowhere.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Siarhei Liakh <sliakh.lkml@gmail.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>

On Wed, 3 Feb 2010 09:35:39 am Andi Kleen wrote:
> Siarhei Liakh <sliakh.lkml@gmail.com> writes:
> 
> > This patch is a logical extension of the protection provided by
> > CONFIG_DEBUG_RODATA to LKMs. The protection is provided by splitting
> > module_core and module_init into three logical parts each and setting
> > appropriate page access permissions for each individual section:
> 
> My current kernel has 52 modules loaded, most of them very small. 
> Assuming the additional alignment of the data section cost two more
> pages on average (I think that's a good assumption), that's roughly
> 424KB of additional memory, plus associated runtime costs in increased
> TLB usage.
> 
> What would I get for that if I applied the patch and enabled the option? 

Strict RO/NX protection.  But without the option enabled, the patch gives
best-effort protection, which is nice (for no additional space).

Cheers,
Rusty.

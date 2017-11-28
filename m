From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: Tree for Nov 28 (arch/x86/mm/kaiser.c)
Date: Tue, 28 Nov 2017 18:08:28 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1711281807300.2222@nanos>
References: <20171128145247.21f5e888@canb.auug.org.au> <7e969f86-1208-e5ea-3ee3-b9f9c73c3285@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:34709 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752311AbdK1RIk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Nov 2017 12:08:40 -0500
In-Reply-To: <7e969f86-1208-e5ea-3ee3-b9f9c73c3285@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Dave Hansen <dave.hansen@intel.com>

On Tue, 28 Nov 2017, Randy Dunlap wrote:

> On 11/27/2017 07:52 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20171127:
> > 
> > New trees:	ntb, kvm-master, at24
> > 
> 
> 
> on x86_64:
> 
> ../arch/x86/mm/kaiser.c: In function 'kaiser_shadow_pagetable_walk':
> ../arch/x86/mm/kaiser.c:173:28: error: '__GFP_NOTRACK' undeclared (first use in this function)
>   gfp_t gfp = (GFP_KERNEL | __GFP_NOTRACK | __GFP_ZERO);

Yes, we need to remove that before merging it into next. The branch is
still based on something which has notrack for various reasons.

Thanks,

	tglx

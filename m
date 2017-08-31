From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Thu, 31 Aug 2017 14:00:53 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1708311359510.1874@nanos>
References: <20170831142654.47f17cd7@canb.auug.org.au> <alpine.DEB.2.20.1708311009020.1874@nanos> <alpine.DEB.2.20.1708311057260.1874@nanos> <b8a39692-160e-a15a-158f-74fd5255348b@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60428 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750863AbdHaMCF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 31 Aug 2017 08:02:05 -0400
In-Reply-To: <b8a39692-160e-a15a-158f-74fd5255348b@suse.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, 31 Aug 2017, Juergen Gross wrote:
> > I've applied it on top of tip:x86/apic and fixed up the merge conflicts
> > mindlessly. Patch below.
> > 
> > Juergen, can you please check the result?
> 
> You missed the updates to arch/x86/xen/xen-asm_64.S and the declarations
> of the xen specific trap entries in arch/x86/include/asm/traps.h

I'll try that again later today, unless you beat me to it.

Thanks,

	tglx

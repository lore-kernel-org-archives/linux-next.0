From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Wed, 23 Nov 2016 13:02:10 +1100
Message-ID: <20161123130210.72c35b76@roar.ozlabs.ibm.com>
References: <20161122195832.0f031e62@canb.auug.org.au>
        <20161122212114.45ba8b17@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33425 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756019AbcKWCCX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Nov 2016 21:02:23 -0500
In-Reply-To: <20161122212114.45ba8b17@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 22 Nov 2016 21:21:14 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Tue, 22 Nov 2016 19:58:32 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the powerpc tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > Inconsistent kallsyms data
> > Try make KALLSYMS_EXTRA_PASS=1 as a workaround
> > 
> > Which is a vast improvement.  I'll try adding 'KALLSYMS_EXTRA_PASS=1'
> > later and see how it goes.  It would be nice not to need it, though.  
> 
> It build with KALLSYMS_EXTRA_PASS=1 on the command line.
> 

Yay!

The inconsistent kallsyms data is not something we're doing wrong or
toolchain bug so much as an inherent flaw in how kallsyms are done.
Basically the allyesconfig kallsyms section expands the kernel so much
that a subsequent linking requires even more stubs, which adds more
symbols, which means the next kallsyms will be a different size, which
means or offsets will be wrong :)

In theory I think it could actually be triggered on smaller kernels if
the size was just right. I'm sort of looking at ways to fix it:

https://patchwork.ozlabs.org/patch/684910/

Hopefully will get something in 4.10. Worst case we could detect the
kallsyms size change and do another pass in response without slowing
down the case where it's not required. Hmm, that might be the best
thing to do for a first pass.

Thanks,
Nick

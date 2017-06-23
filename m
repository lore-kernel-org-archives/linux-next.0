From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure after merge of most trees
Date: Fri, 23 Jun 2017 13:40:49 +1000
Message-ID: <20170623134049.72cd0d95@roar.ozlabs.ibm.com>
References: <20170622152441.3704b3d9@canb.auug.org.au>
        <20170622184116.0ebaabd9@roar.ozlabs.ibm.com>
        <20170622.101306.2121302610489503804.davem@davemloft.net>
        <20170622.102923.1704137848607888832.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34594 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754035AbdFWDlB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jun 2017 23:41:01 -0400
In-Reply-To: <20170622.102923.1704137848607888832.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, amodra@gmail.com

On Thu, 22 Jun 2017 10:29:23 -0400 (EDT)
David Miller <davem@davemloft.net> wrote:

> From: David Miller <davem@davemloft.net>
> Date: Thu, 22 Jun 2017 10:13:06 -0400 (EDT)
> 
> > From: Nicholas Piggin <npiggin@gmail.com>
> > Date: Thu, 22 Jun 2017 18:41:16 +1000
> >   
> >> Is there any way for the linker to place the inputs to avoid unresolvable
> >> relocations where possible?  
> > 
> > I don't think so.
> >   
> >> A way to work around this is to make arch/sparc/lib/hweight.o an obj-y
> >> rather than lib-y. That's a hack because it just serves to move the
> >> input location, but not really any more of a hack than the current code
> >> that also only works because of input locations...  
> > 
> > I could adjust those branches in the sparc code into indirect calls
> > but it's going to perform a bit poorly on older cpus.
> > 
> > Something like this:  
> 
> I just wanted to mention something in passing.
> 
> On sparc64 we patch the first two instructions of memcpy, memset,
> bzero, etc. in order to vector them to cpu optimized routines.
> 
> And we use the same kind of branch there.
> 
> Now because the branches are to routines in the same directory it
> should never exceed the relocation limits.
> 
> However, if the relocation limits were exceeded in this case, the
> build would still succeed and the kernel would be simply broken and
> not bootup properly.

Powerpc has similar problems with linking, particularly in patch
code. What it does is to actually link the patch code into the kernel
as well in another section, so the branch target is resolved by the
linker. When moving the patch code at runtime, the branch offset is
adjusted. So it does get a link error if things don't work there.

I guess the other thing you could do is a build-time check over your
patch code with a custom script or tool.

If you're in the same directory it should be okay, unless it is split
between obj-y/built-in.o and lib-y/lib.a then you might have a
problem.

Thanks,
Nick

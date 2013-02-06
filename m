From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Wed, 6 Feb 2013 09:52:05 -0800
Message-ID: <20130206175205.GC1292@kroah.com>
References: <20130206183040.ea07a2cd64200b6d37868036@canb.auug.org.au>
 <20130206184243.c858634f5d8c3ce4ffac71f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-da0-f49.google.com ([209.85.210.49]:35086 "EHLO
	mail-da0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755334Ab3BFRwI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Feb 2013 12:52:08 -0500
Received: by mail-da0-f49.google.com with SMTP id t11so779561daj.36
        for <linux-next@vger.kernel.org>; Wed, 06 Feb 2013 09:52:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20130206184243.c858634f5d8c3ce4ffac71f3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Wed, Feb 06, 2013 at 06:42:43PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 6 Feb 2013 18:30:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the final tree, today's linux-next build (sparc defconfig)
> > failed like this:
> > 
> > arch/sparc/kernel/kgdb_32.c: In function 'sleeping_thread_to_gdb_regs':
> > arch/sparc/kernel/kgdb_32.c:46:9: error: implicit declaration of function 'task_thread_info' [-Werror=implicit-function-declaration]
> > arch/sparc/kernel/kgdb_32.c:46:26: error: initialization makes pointer from integer without a cast [-Werror]
> > 
> > I can only imagine that the implicit include of linux/sched.h got removed
> > in one of our include file changes. :-(
> > 
> > I have added this patch for today:
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 6 Feb 2013 18:26:51 +1100
> > Subject: [PATCH] sparc: explicitly include sched.h to get task_thread_info declaration
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  arch/sparc/kernel/kgdb_32.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/sparc/kernel/kgdb_32.c b/arch/sparc/kernel/kgdb_32.c
> > index 2e424a5..dcf2108 100644
> > --- a/arch/sparc/kernel/kgdb_32.c
> > +++ b/arch/sparc/kernel/kgdb_32.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <linux/kgdb.h>
> >  #include <linux/kdebug.h>
> > +#include <linux/sched.h>
> >  
> >  #include <asm/kdebug.h>
> >  #include <asm/ptrace.h>
> 
> This was probably caused by commit 16559ae48c76 ("kgdb: remove #include
> <linux/serial_8250.h> from kgdb.h") from the tty tree.
> 
> Removing includes from include files is always fraught with this sort of
> danger :-(

Yes it is, and I caught a bunch of crazy dependancies when I fixed this
up, but now the build should be so much easier for those of us working
on the serial code, the whole tree will now not have to rebuild for no
reason at all.

Sorry for missing this one, the fix looks correct to me, I'll queue it
up in my tree, or it can go through David's.

thanks,

greg k-h

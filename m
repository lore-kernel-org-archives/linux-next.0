From: Daniel Walker <dwalker@fifo99.com>
Subject: Re: linux-next: manual merge of the cisco tree with the vfs tree
Date: Mon, 14 Jan 2019 14:54:12 -0800
Message-ID: <20190114225412.GD18707@fifo99.com>
References: <20181002162923.13f3f8b1@canb.auug.org.au>
 <20190115093330.1cbb0625@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190115093330.1cbb0625@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 15, 2019 at 09:33:30AM +1100, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Tue, 2 Oct 2018 16:29:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the cisco tree got a conflict in:
> > 
> >   arch/x86/kernel/setup.c
> > 
> > between commit:
> > 
> >   dcf8001d292b ("vfs: Suppress MS_* flag defs within the kernel unless explicitly enabled")
> > 
> > from the vfs tree and commit:
> > 
> >   2c070709ea75 ("This updates the x86 code to use the CONFIG_GENERIC_CMDLINE")
> > 
> > from the cisco tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc arch/x86/kernel/setup.c
> > index e493202bf265,ee109f490b22..000000000000
> > --- a/arch/x86/kernel/setup.c
> > +++ b/arch/x86/kernel/setup.c
> > @@@ -51,7 -51,7 +51,8 @@@
> >   #include <linux/kvm_para.h>
> >   #include <linux/dma-contiguous.h>
> >   #include <xen/xen.h>
> >  +#include <uapi/linux/mount.h>
> > + #include <linux/cmdline.h>
> >   
> >   #include <linux/errno.h>
> >   #include <linux/kernel.h>
> 
> This is now a conflict between the cicso tree and Linus' tree.

I did a rebase after your original made this. I'm not sure it's needed any
longer. However, I was planning to rebase my tree again on top of the latest
Linus tree. How would you like to proceed ?

Daniel

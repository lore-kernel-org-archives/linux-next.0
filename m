From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Tue, 16 Oct 2018 09:46:45 +0200
Message-ID: <20181016074645.GA41162@gmail.com>
References: <20181008190341.5e396491@canb.auug.org.au>
 <20181015181445.19448cbc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181015181445.19448cbc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@suse.de>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Mon, 8 Oct 2018 19:03:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the akpm tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > arch/x86/mm/kaslr.c:26:10: fatal error: linux/bootmem.h: No such file or directory
> >  #include <linux/bootmem.h>
> >           ^~~~~~~~~~~~~~~~~
> > 
> > Caused by patch
> > 
> >   "mm: remove include/linux/bootmem.h"
> > 
> > interacting with commit
> > 
> >   3a387c6d96e6 ("x86/kaslr, ACPI/NUMA: Fix KASLR build error")
> > 
> > from the tip tree.
> > 
> > I have added the following patch for today:
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 8 Oct 2018 18:57:00 +1100
> > Subject: [PATCH] x86/kaslr, ACPI/NUMA: fix for linux/bootmem.h removal
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  arch/x86/mm/kaslr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
> > index b3471388288d..ad80bdc690c1 100644
> > --- a/arch/x86/mm/kaslr.c
> > +++ b/arch/x86/mm/kaslr.c
> > @@ -23,7 +23,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/init.h>
> >  #include <linux/random.h>
> > -#include <linux/bootmem.h>
> > +#include <linux/memblock.h>
> >  
> >  #include <asm/pgalloc.h>
> >  #include <asm/pgtable.h>
> > -- 
> 
> So the above tip tree patch no longer exists, so this one is also no
> longer needed and I have removed it from the akpm tree today.

Yeah, we are reworking this series in WIP.x86/boot, it probably won't 
make v4.20 so I removed it from -next.

Thanks,

	Ingo

From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Dec 14 (security/integrity/ima/)
Date: Fri, 14 Dec 2018 15:26:50 -0500
Message-ID: <20181214202650.GO11670@windriver.com>
References: <20181214181826.5775b958@canb.auug.org.au>
 <8205aafb-bbc1-2196-17d9-e70e9ac56c2e@infradead.org>
 <1544815174.3681.16.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544815174.3681.16.camel@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-integrity@vger.kernel.org, James Morris <jmorris@namei.org>
List-Id: linux-next.vger.kernel.org

[Re: linux-next: Tree for Dec 14 (security/integrity/ima/)] On 14/12/2018 (Fri 14:19) Mimi Zohar wrote:

> [Cc'ing Paul Gortmaker]
> 
> On Fri, 2018-12-14 at 08:25 -0800, Randy Dunlap wrote:
> > On 12/13/18 11:18 PM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20181213:
> > > 
> > 
> > on i386:
> > 
> >   CC      security/integrity/ima/ima_main.o
> > ../security/integrity/ima/ima_main.c: In function 'ima_load_data':
> > ../security/integrity/ima/ima_main.c:535:3: error: implicit declaration of function 'is_module_sig_enforced' [-Werror=implicit-function-declaration]
> >    sig_enforce = is_module_sig_enforced();
> >    ^
> > 
> > 
> > Needs:
> 
> Commit 4f83d5ea643a ("security: integrity: make ima_main explicitly
> non-modular") just removed module.h.

Yes, unfortunately the security directory has additional confusion
because there is name space overlap between "module" as used in Linux
Security Module, and "module" as in "insmod foo.ko".  The ima_main
is not modular, but it does use modular infrastructure to load others.

Fortunately this was the final commit in the series, so it can be
removed or reverted as per maintainer's choice.  In the meantime, I'll
look into why my "allyesconfig" build testing didn't pick up on this,
so I can close that testing gap.

Randy, if you were using one of your usual "randconfig" builds, maybe
you can mail me the .config out of band - no need spamming the lists.

Thanks, and sorry for the undetected fallout.
Paul.
--

> 
> Mimi 
> 
> 
> > 
> > ---
> >  security/integrity/ima/ima_main.c |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > --- linux-next-20181214.orig/security/integrity/ima/ima_main.c
> > +++ linux-next-20181214/security/integrity/ima/ima_main.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/init.h>
> >  #include <linux/file.h>
> >  #include <linux/binfmts.h>
> > +#include <linux/module.h>
> >  #include <linux/mount.h>
> >  #include <linux/mman.h>
> >  #include <linux/slab.h>
> > 
> > 
> > 
> 

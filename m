From: Petr Vorel <pvorel@suse.cz>
Subject: Re: [PATCH] ima: Fix pr_fmt() redefinition
Date: Thu, 17 May 2018 14:17:59 +0200
Message-ID: <20180517121759.r6tqw3mj43morfwu@dell5510>
References: <20180517104702.24689-1-pvorel@suse.cz>
 <1526558695.3306.11.camel@linux.vnet.ibm.com>
Reply-To: Petr Vorel <pvorel@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1526558695.3306.11.camel@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: linux-integrity@vger.kernel.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

Hi Mimi,

> On Thu, 2018-05-17 at 12:47 +0200, Petr Vorel wrote:
> > Previous definition was too late and caused problems in powerpc allyesconfig:
> > security/integrity/ima/ima_kexec.c:18:0: warning: "pr_fmt" redefined
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

> > In file included from include/linux/kernel.h:14:0,
> >                  from include/asm-generic/bug.h:18,
> >                  from arch/powerpc/include/asm/bug.h:128,
> >                  from include/linux/bug.h:5,
> >                  from include/linux/seq_file.h:7,
> >                  from security/integrity/ima/ima_kexec.c:13:
> > include/linux/printk.h:288:0: note: this is the location of the previous definition
> >  #define pr_fmt(fmt) fmt

> > Fixes: 3dea0d93d257 ("ima: Unify logging")

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

> As the original patch hasn't been upstreamed yet, I'll squash this fix
> with the original patch.
Make sense, thanks!

> thanks!

> Mimi


Kind regards,
Petr

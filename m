From: Ankita Garg <ankita-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: build failure
Date: Wed, 30 Jul 2008 12:36:43 +0530
Message-ID: <20080730070643.GA18347@in.ibm.com>
References: <20080730153028.95226354.sfr@canb.auug.org.au>
	<20080730064146.GA1564@cs181140183.pp.htv.fi>
Reply-To: Ankita Garg <ankita-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080730064146.GA1564-re2QNgSbS3j4D6uPqz5PAwR5/fbUUdgG@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kexec>
List-Post: <mailto:kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: kexec-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Errors-To: kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Ananth N Mavinakayanahalli <ananth-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>, Bartlomiej Zolnierkiewicz <bzolnier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Haren Myneni <hbabu-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 30, 2008 at 09:41:46AM +0300, Adrian Bunk wrote:
> On Wed, Jul 30, 2008 at 03:30:28PM +1000, Stephen Rothwell wrote:
> > Hi Ananth,
> > 
> > Today's linux-next build (powerpc allyesconfig) failed like this:
> > 
> > tests/lkdtm.c:182: error: expected ')' before '*' token
> > 
> > I have no idea why this fails now when it did not before.
> 
> Sorry, that's my fault.
> (I didn't notice since my allyes builds have CONFIG_MODULES=n, and
>  no defconfig seems to have both LKDTM and IDE=y.)
> 
> Bart, can you either apply Stephen's patch or drop the lkdtm.c chunk 
> from my patch?
>

I suppose it would be better if the earlier changes are reverted, as
lkdtm already has bits to include ide.h depending on CONFIG_IDE being
y/n.

> > I applied the following patch.
> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
> > http://www.canb.auug.org.au/~sfr/
> > 
> > From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
> > Date: Wed, 30 Jul 2008 15:24:53 +1000
> > Subject: [PATCH] tests: lkdtm needs ide.h
> > 
> > Signed-off-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
> > ---
> >  tests/lkdtm.c |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> > 
> > diff --git a/tests/lkdtm.c b/tests/lkdtm.c
> > index 2a40d18..856f060 100644
> > --- a/tests/lkdtm.c
> > +++ b/tests/lkdtm.c
> > @@ -52,6 +52,7 @@
> >  #include <linux/init.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/hrtimer.h>
> > +#include <linux/ide.h>
> >  #include <scsi/scsi_cmnd.h>
> >  
> >  #define NUM_CPOINTS 8
> 
> cu
> Adrian
> 
> -- 
> 
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed

-- 
Regards,
Ankita Garg (ankita-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org)
Linux Technology Center
IBM India Systems & Technology Labs, 
Bangalore, India   

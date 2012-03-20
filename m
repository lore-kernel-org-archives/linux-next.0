From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 20 Mar 2012 15:32:54 -0700
Message-ID: <20120320223254.GA24068@kroah.com>
References: <20120308152110.12c805f59c45251d79bcb24b@canb.auug.org.au>
 <20120308180048.GC26516@kroah.com>
 <20120321090038.06c65f50bd0329df8705f2cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120321090038.06c65f50bd0329df8705f2cd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 21, 2012 at 09:00:38AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 8 Mar 2012 10:00:48 -0800 Greg KH <greg@kroah.com> wrote:
> >
> > On Thu, Mar 08, 2012 at 03:21:10PM +1100, Stephen Rothwell wrote:
> > > 
> > > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:
> > > 
> > > drivers/staging/sep/sep_driver.c:55:32: fatal error: linux/rar_register.h: No such file or directory
> > > 
> > > Caused by commit 33e9970add94 ("x86/mid: Kill off Moorestown").
> > > 
> > > Following previous instructions, I have disabled the staging tree driver
> > > using this patch (pending a fix in the tip tree):
> > 
> > Looks good to me.  Alan, care to send me an update that fixes this
> > driver for real?
> 
> Was this ever fixed?

I never got a patch from Alan or anyone else to do this :(

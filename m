From: Philipp Reisner <philipp.reisner@linbit.com>
Subject: Re: linux-next: drbd tree build failure
Date: Mon, 27 Jul 2009 19:17:55 +0200
Message-ID: <200907271917.56148.philipp.reisner@linbit.com>
References: <20090727154816.24e81531.sfr@canb.auug.org.au> <20090727080957.GA8046@barkeeper1-xen.linbit>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752891AbZG0RR6@vger.kernel.org>
In-Reply-To: <20090727080957.GA8046@barkeeper1-xen.linbit>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Ellenberg <lars.ellenberg@linbit.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>
List-Id: linux-next.vger.kernel.org

On Monday 27 July 2009 10:09:57 Lars Ellenberg wrote:
> On Mon, Jul 27, 2009 at 03:48:16PM +1000, Stephen Rothwell wrote:
> > Hi Philipp,
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >
> > drivers/block/drbd/drbd_main.c: In function
> > 'drbd_thread_current_set_cpu': drivers/block/drbd/drbd_main.c:1592:
> > error: implicit declaration of function 'set_cpus_allowed'
> >
> > Introduced by commit 8a4ebc3fbd90072ac870064a930fe612eea6d9a1 ("DRBD:
> > main") from the drbd interacting with commit
> > 84cf7f02712e3491fb9776f950a8c4f413204c8b
> > ("cpumask:remove-set_cpus_allowed") from the rr tree.
> >
> > I am not sure what the transformation to the new infrastructure is here -
> > maybe Rusty can help?
> >
> > For today, I have reverted the rr tree commit above but we need a better
> > solution.
>
> I think we can easily use set_cpus_allowed_ptr() instead,
> as in fact, we do not have the cpu mask on the stack.
> But embeded in struct drbd_conf.

Ok. Lars' patch is now complete and arrived in the git tree...

It should build now with Rusty's paches.

-phil
-- 
: Dipl-Ing Philipp Reisner
: LINBIT | Your Way to High Availability
: Tel: +43-1-8178292-50, Fax: +43-1-8178292-82
: http://www.linbit.com

DRBD(R) and LINBIT(R) are registered trademarks of LINBIT, Austria.

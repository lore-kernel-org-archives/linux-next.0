From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH next]module: Fix mod->mkobj.kobj potentially freed
 too early
Date: Thu, 22 Aug 2013 15:50:38 +0800
Message-ID: <1377157838.2633.67.camel@ThinkPad-T5421>
References: <1377078598.2709.25.camel@ThinkPad-T5421>
	 <20130821161819.GA14364@kroah.com> <87vc2yciqi.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:48073 "EHLO
	e28smtp03.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753443Ab3HVHur (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Aug 2013 03:50:47 -0400
Received: from /spool/local
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Thu, 22 Aug 2013 13:13:03 +0530
In-Reply-To: <87vc2yciqi.fsf@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-next list <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, rmk+kernel@arm.linux.org.uk

On Thu, 2013-08-22 at 16:30 +0930, Rusty Russell wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> > On Wed, Aug 21, 2013 at 05:49:58PM +0800, Li Zhong wrote:
> > >  struct kobj_type module_ktype = {
> > > +	.release   =	module_kobj_release,
> > >  	.sysfs_ops =	&module_sysfs_ops,
> > >  };
> >
> > Wait, as there is no release function here for the kobject (a different
> > problem), why is the deferred release function causing any problems?
> > There is no release function to call, so what is causing the oops?
> 
> Because DEBUG_KOBJECT_RELEASE does the kobject_put() sometime later,
> which is what causes the oops.
> 
> Since kobjects don't have an owner field, AFAICT someone *could* grab
> one in a module which is unloading, then put it after unload.   So this
> fixes a real bug, albeit not one seen in the real world.
> 
> Applied,

Oh, thank you, Rusty. 

I just sent out another version... which fix it in another way as Greg
suggested, could you please also help to take a look at it?

Thanks, Zhong

> Rusty.
> 

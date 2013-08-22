From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [RFC PATCH next]module: Fix mod->mkobj.kobj potentially freed too early
Date: Thu, 22 Aug 2013 16:30:53 +0930
Message-ID: <87vc2yciqi.fsf@rustcorp.com.au>
References: <1377078598.2709.25.camel@ThinkPad-T5421> <20130821161819.GA14364@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:37900 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753724Ab3HVHLS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Aug 2013 03:11:18 -0400
In-Reply-To: <20130821161819.GA14364@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>, Li Zhong <zhong@linux.vnet.ibm.com>
Cc: linux-next list <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, rmk+kernel@arm.linux.org.uk

Greg KH <gregkh@linuxfoundation.org> writes:
> On Wed, Aug 21, 2013 at 05:49:58PM +0800, Li Zhong wrote:
> >  struct kobj_type module_ktype = {
> > +	.release   =	module_kobj_release,
> >  	.sysfs_ops =	&module_sysfs_ops,
> >  };
>
> Wait, as there is no release function here for the kobject (a different
> problem), why is the deferred release function causing any problems?
> There is no release function to call, so what is causing the oops?

Because DEBUG_KOBJECT_RELEASE does the kobject_put() sometime later,
which is what causes the oops.

Since kobjects don't have an owner field, AFAICT someone *could* grab
one in a module which is unloading, then put it after unload.   So this
fixes a real bug, albeit not one seen in the real world.

Applied,
Rusty.

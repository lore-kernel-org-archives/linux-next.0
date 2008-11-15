From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Sun, 16 Nov 2008 09:02:52 +1030
Message-ID: <200811160902.53029.rusty@rustcorp.com.au>
References: <20081114153625.1ea7e841.sfr@canb.auug.org.au> <20081114160638.12340c65.sfr@canb.auug.org.au> <20081113.224255.145576986.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:35660 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751319AbYKOWc5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 15 Nov 2008 17:32:57 -0500
In-Reply-To: <20081113.224255.145576986.davem@davemloft.net>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, wangchen@cn.fujitsu.com, markmc@redhat.com

On Friday 14 November 2008 17:12:55 David Miller wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 14 Nov 2008 16:06:38 +1100
>
> > On Thu, 13 Nov 2008 20:41:21 -0800 (PST) David Miller 
<davem@davemloft.net> wrote:
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Fri, 14 Nov 2008 15:36:25 +1100
> > >
> > > > The only issue would be if you have patches to remove/rename the
> > > > netdev priv field - they would have to be delayed until after Rusty's
> > > > tree was merged, or someone could submit a trivial patch to Linus to
> > > > do that last netdev_priv() conversion in virtio_net.c and you could
> > > > both rebase/merge that.
> > >
> > > Another option is simply for Rusty to submit his virtio stuff
> > > through my tree.  I'm more than happy to take care of that
> > > as soon as Rusty can put the patches together.
> >
> > I was about to send the below to Linus.  I will hold onto it for a couple
> > of days.
>
> Ok.  We'll try to sort it out.
>
> Rusty, are your changes 2.6.28 bound or -next?

They missed 2.6.28, they're 2.6.29 material.  I've fixed them with s/dev-
>priv/netdev_priv(dev)/, and will send them to netdev now.

Thanks,
Rusty.

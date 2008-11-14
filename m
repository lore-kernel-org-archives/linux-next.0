From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 13 Nov 2008 22:42:55 -0800 (PST)
Message-ID: <20081113.224255.145576986.davem@davemloft.net>
References: <20081114153625.1ea7e841.sfr@canb.auug.org.au>
	<20081113.204121.09566067.davem@davemloft.net>
	<20081114160638.12340c65.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:50711
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751009AbYKNGmz (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Nov 2008 01:42:55 -0500
In-Reply-To: <20081114160638.12340c65.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: rusty@rustcorp.com.au, linux-next@vger.kernel.org, wangchen@cn.fujitsu.com, markmc@redhat.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 14 Nov 2008 16:06:38 +1100

> On Thu, 13 Nov 2008 20:41:21 -0800 (PST) David Miller <davem@davemloft.net> wrote:
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 14 Nov 2008 15:36:25 +1100
> > 
> > > The only issue would be if you have patches to remove/rename the netdev
> > > priv field - they would have to be delayed until after Rusty's tree was
> > > merged, or someone could submit a trivial patch to Linus to do that last
> > > netdev_priv() conversion in virtio_net.c and you could both rebase/merge
> > > that.
> > 
> > Another option is simply for Rusty to submit his virtio stuff
> > through my tree.  I'm more than happy to take care of that
> > as soon as Rusty can put the patches together.
> 
> I was about to send the below to Linus.  I will hold onto it for a couple
> of days.

Ok.  We'll try to sort it out.

Rusty, are your changes 2.6.28 bound or -next?

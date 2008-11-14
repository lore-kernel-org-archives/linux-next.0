From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 13 Nov 2008 20:41:21 -0800 (PST)
Message-ID: <20081113.204121.09566067.davem@davemloft.net>
References: <20081114152054.e448fde8.sfr@canb.auug.org.au>
	<20081113.203059.225040990.davem@davemloft.net>
	<20081114153625.1ea7e841.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:35378
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751392AbYKNElW (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 23:41:22 -0500
In-Reply-To: <20081114153625.1ea7e841.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: rusty@rustcorp.com.au, linux-next@vger.kernel.org, wangchen@cn.fujitsu.com, markmc@redhat.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 14 Nov 2008 15:36:25 +1100

> Hi Dave,
> 
> On Thu, 13 Nov 2008 20:30:59 -0800 (PST) David Miller <davem@davemloft.net> wrote:
> >
> > I'm open to just about anything that doesn't involve
> > rebasing my tree :)
> 
> The only issue would be if you have patches to remove/rename the netdev
> priv field - they would have to be delayed until after Rusty's tree was
> merged, or someone could submit a trivial patch to Linus to do that last
> netdev_priv() conversion in virtio_net.c and you could both rebase/merge
> that.

Another option is simply for Rusty to submit his virtio stuff
through my tree.  I'm more than happy to take care of that
as soon as Rusty can put the patches together.

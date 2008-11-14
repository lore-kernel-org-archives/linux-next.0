From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 13 Nov 2008 20:30:59 -0800 (PST)
Message-ID: <20081113.203059.225040990.davem@davemloft.net>
References: <20081114151317.8ab89475.sfr@canb.auug.org.au>
	<20081114152054.e448fde8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40908
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751160AbYKNEa7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 23:30:59 -0500
In-Reply-To: <20081114152054.e448fde8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: rusty@rustcorp.com.au, linux-next@vger.kernel.org, wangchen@cn.fujitsu.com, markmc@redhat.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 14 Nov 2008 15:20:54 +1100

> I guess the way forward (easiest for me :-)) is for Rusty's tree to use
> netdev_priv() in that one last place in virtio_net.c and for Dave to
> apply a patch to his tree that reverts just the virtio_net.c part of the
> conflicting commit.
> 
> I think that will remove any conflict between the trees.  Thoughts?

I'm open to just about anything that doesn't involve
rebasing my tree :)

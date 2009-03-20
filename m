From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with the tree
Date: Fri, 20 Mar 2009 02:28:28 -0700 (PDT)
Message-ID: <20090320.022828.118487369.davem@davemloft.net>
References: <20090320113242.bfe7fe62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:32922
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1753524AbZCTJ2m (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Mar 2009 05:28:42 -0400
In-Reply-To: <20090320113242.bfe7fe62.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, markmc@redhat.com, rusty@rustcorp.com.au, pktoss@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 20 Mar 2009 11:32:42 +1100

> Hi David,
> 
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/virtio_net.c between commit
> 4783256ef92f5aecd6d54693b16386f2a0021c2a ("virtio_net: Make virtio_net
> support carrier detection") from the net-current tree and commit
> 9f4d26d0f3016cf8813977d624751b94465fa317 ("virtio_net: add link status
> handling") from the net tree.
> 
> I think that the latter patch means that the former is not needed, so I
> used the version from the net tree.

I've taken care of this merge conflict, thanks Stephen.

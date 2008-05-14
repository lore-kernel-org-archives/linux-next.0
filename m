From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net merge conflict
Date: Tue, 13 May 2008 22:08:24 -0700 (PDT)
Message-ID: <20080513.220824.113223475.davem@davemloft.net>
References: <20080514145425.a60d9e19.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:42044
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S932119AbYENFIa (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 14 May 2008 01:08:30 -0400
In-Reply-To: <20080514145425.a60d9e19.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linville@tuxdriver.com, linux-next@vger.kernel.org, IvDoorn@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 14 May 2008 14:54:25 +1000

> Hi Dave, John,
> 
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/wireless/rt2x00/rt61pci.c (at the end of rt61pci_beacon_update())
> between commit 78720897459a0ed3843c80e9bd9ef1b2f7ae5c8f ("rt2x00:
> Don't use pskb_expand_head()") in the net-current/wireless-current trees
> and commit e58c6aca99357d7f85f18e0b661d8c5a87f926a9 ("rt2x00: Use rt2x00
> queue numbering") in the net/wireless trees.
> 
> I think I did the right fixup, but it is probably worth checking.

John did an example merge which likely matches what
you did:

	git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next-2.6.git merge-test

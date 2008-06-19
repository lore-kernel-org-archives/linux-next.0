From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Wed, 18 Jun 2008 22:01:01 -0700 (PDT)
Message-ID: <20080618.220101.192721731.davem@davemloft.net>
References: <20080619130456.e9e22b32.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:44268
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751147AbYFSFBC (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Jun 2008 01:01:02 -0400
In-Reply-To: <20080619130456.e9e22b32.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linville@tuxdriver.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 19 Jun 2008 13:04:56 +1000

> Today's linux-next merge of the net tree got a conflict in
> net/mac80211/tx.c between commit 3a5be7d4b079f3a9ce1e8ce4a93ba15ae6d00111
> ("Revert "mac80211: Use skb_header_cloned() on TX path."") from the
> Linus' tree and commit 23c0752a25d73ccc4547700e8a57d5ae2f2edf56
> ("mac80211: clean up skb reallocation code") from the net (wireless) tree.
> 
> I couldn't readily see what to do with it, so I took the version in the
> net tree.  I assume that this will be sorted out next time that the
> wireless (or net) tree pulls in Linus' tree.

Thanks Stephen.  I anticipated this and I will work out a proper
merge resolution later tonight after I finish something else
I'm currently working on.

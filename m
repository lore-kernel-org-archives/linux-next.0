From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Tue, 23 Dec 2008 18:15:59 -0800 (PST)
Message-ID: <20081223.181559.19879229.davem@davemloft.net>
References: <20081224101934.0da26dab.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:39292
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751960AbYLXCP5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Dec 2008 21:15:57 -0500
In-Reply-To: <20081224101934.0da26dab.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, jchapman@katalix.com, gorcunov@openvz.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 24 Dec 2008 10:19:34 +1100

> Today's linux-next merge of the net tree got a conflict in
> drivers/net/ppp_generic.c between commit
> 739840d529eb7505d3cbfe9d468bf1440c9a8e27 ("ppp: fix segfaults introduced
> by netdev_priv changes") from the net-current tree and commit
> 7a95d267fb62cd6b80ef73be0592bbbe1dbd5df7 ("net: ppp_generic - use idr
> technique instead of cardmaps") from the net tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks Stephen.

Since Linus just pulled my net-2.6 tree into his today,
I merged net-2.6 into net-next-2.6 which will resolve
this.

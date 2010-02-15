From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build warning after merge of the net tree
Date: Sun, 14 Feb 2010 22:21:42 -0800 (PST)
Message-ID: <20100214.222142.143847136.davem@davemloft.net>
References: <20100215143257.7af33452.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:46093
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753784Ab0BOGV3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2010 01:21:29 -0500
In-Reply-To: <20100215143257.7af33452.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jpirko@redhat.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 15 Feb 2010 14:32:57 +1100

> After merging the net tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> net/mac80211/iface.c: In function 'ieee80211_stop':
> net/mac80211/iface.c:416: warning: passing argument 4 of '__dev_addr_unsync' makes pointer from integer without a cast
> include/linux/netdevice.h:1967: note: expected 'int *' but argument is of type 'int'
> 
> Introduced by commit 4cd24eaf0c6ee7f0242e34ee77ec899f255e66b5 ("net: use
> netdev_mc_count and netdev_mc_empty when appropriate").

Thanks I'll take a look Stephen.

From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Thu, 28 Aug 2008 01:15:43 -0700 (PDT)
Message-ID: <20080828.011543.62015538.davem@davemloft.net>
References: <20080828135514.2d046f29.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:50636
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752146AbYH1IPs (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 04:15:48 -0400
In-Reply-To: <20080828135514.2d046f29.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, jouni.malinen@atheros.com, jasper@amiton.co.nz, linville@tuxdriver.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 28 Aug 2008 13:55:14 +1000

> Today's linux-next merge of the net tree got a conflict in
> net/mac80211/mlme.c between commit
> 087d833e5a9f67ba933cb32eaf5a2279c1a5b47c ("mac80211: Use IWEVASSOCREQIE
> instead of IWEVCUSTOM") from the net-current tree and commit
> f698d856f65c3fea091cc303a135967965c5b880 ("replace net_device arguments
> with ieee80211_{local,sub_if_data} as appropriate") from the net tree.
> 
> The former moved some code that the latter modified.  I fixed it up
> (see below) and can carry the fix.

Thanks, please carry it until I merge net-2.6 into net-next-2.6,
which I'll do right after Linus pulls in the current batch.

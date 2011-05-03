From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with the net-current
 tree
Date: Mon, 02 May 2011 20:42:38 -0700 (PDT)
Message-ID: <20110502.204238.193708379.davem@davemloft.net>
References: <20110503131548.63dd3568.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:49936
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753338Ab1ECDnL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2011 23:43:11 -0400
In-Reply-To: <20110503131548.63dd3568.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, rjw@sisk.pl, joe@perches.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 3 May 2011 13:15:48 +1000

> Hi all,
> 
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/tg3.c between commit 6fdbab9d93e0 ("tg3: Fix failure to
> enable WoL by default when possible") from the net-current tree and
> commit 63c3a66fe6c8 ("tg3: Convert u32 flag,flg2,flg3 uses to bitmap")
> from the net tree.
> 
> Context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Do you automatically generate these emails? :-)

I CC:'d you on an email earlier about this conflict, in an effort to
let you know I anticipated it and you therefore didn't need to notify
us this time.

From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the wireless-next tree with the
 net-next tree
Date: Wed, 04 Jan 2012 22:30:52 -0500 (EST)
Message-ID: <20120104.223052.902437565229260010.davem@davemloft.net>
References: <20120105140405.92816482d364abfcf3854d74@canb.auug.org.au>
	<4F05151D.5070401@lwfinger.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:55257 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757525Ab2AEDeL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 22:34:11 -0500
In-Reply-To: <4F05151D.5070401@lwfinger.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Larry.Finger@lwfinger.net
Cc: sfr@canb.auug.org.au, linville@tuxdriver.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, rusty@rustcorp.com.au, netdev@vger.kernel.org

From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Wed, 04 Jan 2012 21:12:29 -0600

> Is there a good explanation why changes in wireless drivers are sent
> to net-next, and not wireless-testing? If that were stopped, this kind
> of conflict would be avoided.

It was a networking wide change and it's easiest if I just take it
in and deal with the merge issues.

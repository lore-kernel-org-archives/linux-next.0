From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH -next] net: fix Makefile typos & build errors
Date: Mon, 29 Aug 2011 22:55:10 -0400 (EDT)
Message-ID: <20110829.225510.1534815133945067081.davem@davemloft.net>
References: <20110829161907.19232776e65389dea1caa7e8@canb.auug.org.au>
	<20110829114940.4d29febc.rdunlap@xenotime.net>
	<20110830115925.45984bb8eeb73401dd5d289f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:33756 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769Ab1H3C5P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Aug 2011 22:57:15 -0400
In-Reply-To: <20110830115925.45984bb8eeb73401dd5d289f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: rdunlap@xenotime.net, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 30 Aug 2011 11:59:25 +1000

> It may be my old(er) eyes, but isn't that CONFIG_SLIP line repeated?

My old eyes can confirm this, so I'll fix it up, thanks! :-)

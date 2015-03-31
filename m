From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Tue, 31 Mar 2015 14:13:15 -0400 (EDT)
Message-ID: <20150331.141315.2296740365869114033.davem@davemloft.net>
References: <20150330150534.52bf72dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:49225 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753653AbbCaSNR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2015 14:13:17 -0400
In-Reply-To: <20150330150534.52bf72dd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ben.hutchings@codethink.co.uk

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 30 Mar 2015 15:05:34 +1100

> Caused by a bad merge between commits 1e9e39f4a298 ("usbnet: Fix
> tx_packets stat for FLAG_MULTI_FRAME drivers") and 7a1e890e2168
> ("usbnet: Fix tx_bytes statistic running backward in cdc_ncm") form the
> net tree and commit 6588af614e7b ("usbnet: Fix tx_packets stat for
> FLAG_MULTI_FRAME drivers") from the net-next tree.  (Presumably,
> 6588af614e7b was cherry-picked as a bug fix.  So, Dave, something to
> watch for if you merge net into net-next.)

Thanks a lot for bringing this to my attention Stephen.

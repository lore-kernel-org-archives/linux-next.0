From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build warning after merge of the final tree
Date: Tue, 28 May 2013 22:44:06 -0700 (PDT)
Message-ID: <20130528.224406.1354723685523430708.davem@davemloft.net>
References: <20130529152915.efba860c7e825fe786b1ee99@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:42272 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752417Ab3E2FoK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 May 2013 01:44:10 -0400
In-Reply-To: <20130529152915.efba860c7e825fe786b1ee99@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, horms@verge.net.au

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 29 May 2013 15:29:15 +1000

> Introduced by commit 1a37e412a022 ("net: Use 16bits for *_headers fields
> of struct skbuff") from the net-next tree.

Simon just posted fixes for this, sorry about that.

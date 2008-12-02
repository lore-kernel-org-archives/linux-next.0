From: "Luis R. Rodriguez" <lrodriguez@atheros.com>
Subject: Re: linux-next: manual merge of the wireless tree
Date: Tue, 2 Dec 2008 12:52:23 -0800
Message-ID: <20081202205223.GD9351@tesla>
References: <20081126194041.72bf3af5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.atheros.com ([12.36.123.2]:25003 "EHLO mail.atheros.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753437AbYLBUwZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Dec 2008 15:52:25 -0500
Received: from mail.atheros.com ([10.10.20.108])
	by sidewinder.atheros.com
	for <linux-next@vger.kernel.org>; Tue, 02 Dec 2008 12:52:25 -0800
Content-Disposition: inline
In-Reply-To: <20081126194041.72bf3af5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Sujith Manoharan <Sujith.Manoharan@Atheros.com>, Luis Rodriguez <Luis.Rodriguez@Atheros.com>, Bennyam Malavazi <Bennyam.Malavazi@Atheros.com>, "David S. Miller" <davem@davemloft.net>

On Wed, Nov 26, 2008 at 12:40:41AM -0800, Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next merge of the wireless tree got a conflict in
> drivers/net/wireless/ath9k/recv.c between commits
> b4b6cda2298b0c9a0af902312184b775b8867c65 ("ath9k: correct expected max RX
> buffer size") and ca0c7e5101fd4f37fed8e851709f08580b92fbb3 ("ath9k: Fix
> SW-IOMMU bounce buffer starvation") from the wireless-current tree and
> commits fd568653b38a91154b193338c312927385e77da1 ("ath9k: Revamp RX
> handling") and from the wireless tree.
> 
> I fixed it up (see below - I hope it is correct) and assume that it will
> be fixed soon.

Just sent a port for 2.6.27, hope it helps.

  Luis

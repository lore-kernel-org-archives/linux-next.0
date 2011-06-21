From: "Gustavo F. Padovan" <padovan@profusion.mobi>
Subject: Re: linux-next: manual merge of the wireless tree with the
 wireless-current tree
Date: Tue, 21 Jun 2011 15:05:21 -0300
Message-ID: <20110621180521.GC2628@joana>
References: <20110621114957.59fae11d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:41096 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756943Ab1FUSFF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Jun 2011 14:05:05 -0400
Content-Disposition: inline
In-Reply-To: <20110621114957.59fae11d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hedberg <johan.hedberg@intel.com>

Hi John,

* Stephen Rothwell <sfr@canb.auug.org.au> [2011-06-21 11:49:57 +1000]:

> Hi John,
> 
> Today's linux-next merge of the wireless tree got a conflict in
> net/bluetooth/l2cap_core.c between commit df3c3931ec58 ("Bluetooth: Fix
> accepting connect requests for defer_setup") from the wireless-current
> tree and commit ab07801d2898 ("Bluetooth: create channel timer to replace
> sk_timer") from the wireless tree.

I merged bluetooth-2.6 and bluetooth-next-2.6 to fix this and will send a pull
request to you in a minute.

	Gustavo

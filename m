From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the firmware tree with the tree
Date: Sun, 01 Mar 2009 20:29:49 -0800 (PST)
Message-ID: <20090301.202949.176544427.davem@davemloft.net>
References: <20090302141103.d1c369d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:33434
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1753821AbZCBEaI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 Mar 2009 23:30:08 -0500
In-Reply-To: <20090302141103.d1c369d0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: dwmw2@infradead.org, linux-next@vger.kernel.org, ben@decadent.org.uk

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Mar 2009 14:11:03 +1100

> Today's linux-next merge of the firmware tree got conflicts in
> firmware/WHENCE between commits 06e1f9ffa023c030bc87491e75f625f5da4e7d97
> ("tehuti: Use request_firmware()") and
> b775a750c3afacbfac884537d466d34d50b1023b ("typhoon: Use request_firmware
> ()") from the net tree and various commits from the firmware tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix as necessary.

Yeah, I think you'll need to carry this one.

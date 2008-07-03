From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Wed, 02 Jul 2008 21:13:45 -0700 (PDT)
Message-ID: <20080702.211345.257857024.davem@davemloft.net>
References: <20080703135641.8cae3bc1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:37894
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750982AbYGCENr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 00:13:47 -0400
In-Reply-To: <20080703135641.8cae3bc1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, vladislav.yasevich@hp.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 3 Jul 2008 13:56:41 +1000

> Today's linux-next merge of the net tree got a conflict in  between
> commit 16d752397301b95abaa95cbaf9e785d221872311 ("thermal: Create
> CONFIG_THERMAL_HWMON=n") from Linus' tree and commit
> ecbed6a41900126e7b9509e12a8d0cc22176e3eb ("sctp: Mark GET_PEER|
> LOCAL_ADDR_OLD deprecated") from the net tree.
> 
> I just took both new entries.

Yep, that's the thing to do here.

Thanks!

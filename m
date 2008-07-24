From: David Miller <davem@davemloft.net>
Subject: Re: Labeled Networking tree for linux-next
Date: Wed, 23 Jul 2008 19:53:26 -0700 (PDT)
Message-ID: <20080723.195326.79993514.davem@davemloft.net>
References: <Xine.LNX.4.64.0807240415200.14401@us.intercode.com.au>
	<200807231619.39629.paul.moore@hp.com>
	<20080724100624.6c6127ed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:37073
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751155AbYGXCx0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jul 2008 22:53:26 -0400
In-Reply-To: <20080724100624.6c6127ed.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: paul.moore@hp.com, jmorris@namei.org, akpm@linux-foundation.org, linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 24 Jul 2008 10:06:24 +1000

> I have no problem with trees coming into linux-next from more than one
> source (see e.g. the wireless tree which is merged into the net tree).
> In fact it can be useful so that you will discover conflicting changes in
> the security and net trees before you have your tree merged into theirs.

Yes, indeed, this would work from my side as well.  The wireless
model has worked well so far.

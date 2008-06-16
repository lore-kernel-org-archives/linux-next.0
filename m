From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: ide build failure
Date: Tue, 17 Jun 2008 08:40:57 +1000
Message-ID: <1213656057.8129.143.camel@pasglop>
References: <20080616133817.83c9f304.sfr@canb.auug.org.au>
	 <1213588543.8129.122.camel@pasglop> <200806161154.43011.bzolnier@gmail.com>
Reply-To: benh@kernel.crashing.org
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:35117 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755489AbYFPWlQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 18:41:16 -0400
In-Reply-To: <200806161154.43011.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


> [ However it may be connected with the fact that recently I've been
>   waiting for _weeks_ for your feedback (sometimes to not get _any_). ]

Yeah well, I'm a bit swamped, and drivers/ide as far as I'm concerned
is supposed to be stable and in maintainance mode, not in active
developement :-) Oh well, anyway, I will try to review your patches
more promptly. Keep in mind that properly testing changes to the
pmac IDE driver however does require me to dig various kind of ancient
HW (such as my half broken Wallstreet powerbook with its mediabay)
and so is fairly time consuming.

Cheers,
Ben.



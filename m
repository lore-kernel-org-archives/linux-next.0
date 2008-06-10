From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net/net-current merge conflict
Date: Tue, 10 Jun 2008 12:44:47 -0700 (PDT)
Message-ID: <20080610.124447.94353426.davem@davemloft.net>
References: <20080610172823.12e0fb8f.sfr@canb.auug.org.au>
	<20080610193826.GD5841@localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:52230
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1753702AbYFJTor (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 15:44:47 -0400
In-Reply-To: <20080610193826.GD5841@localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mcarlson@broadcom.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, mchan@broadcom.com

From: "Matt Carlson" <mcarlson@broadcom.com>
Date: Tue, 10 Jun 2008 12:38:26 -0700

> The correct thing to do would be to increment the net-next version every
> time these conflicts appear.  Right now and to the best of my knowledge,
> this policy would only apply to the tg3 driver.  Do you feel this is an
> acceptable / sustainable way to deal with versioning between net and
> net-next?

I think there is no confusion, to be honest, consider:

1) The stable bug fix driver keeps incrementing the "N" in
   x.y.N, so no problems.

2) The development driver keeps incrementing the "Y" in
   x.Y and can be presumed to get the bug fixes when merges
   happen from the stable branch.  The inclusion of said bug
   fixes is sort-of implicit in the higher "Y" value.

So really I don't see a reason to do anything special during
merges.

That's why, when I handled the merge tg3.c conflict yesterday
in net-next-2.6, I preserved the net-next-2.6 tg3.c driver
version value.

The driver version value has no meaning in the development
branch until Linus actually pulls it into his tree, for now
it just needs to have a larger "Y" than what is in the stable
series.

From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Mon, 11 Jan 2010 00:44:36 -0800 (PST)
Message-ID: <20100111.004436.217049216.davem@davemloft.net>
References: <20100111184205.8d53fe5b.Stephen@Rothwell.id.au>
	<20100111.000205.164473435.davem@davemloft.net>
	<1263197772.1907.44.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:47510
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751444Ab0AKIo2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jan 2010 03:44:28 -0500
In-Reply-To: <1263197772.1907.44.camel@Joe-Laptop.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: joe@perches.com
Cc: Stephen@Rothwell.id.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, macro@linux-mips.org, hartleys@visionengravers.com

From: Joe Perches <joe@perches.com>
Date: Mon, 11 Jan 2010 00:16:12 -0800

> Perhaps it'd be better to kill off the use of bitrev in
> lib/vsprintf as Maciej thinks it broken.
> 
> Maybe use something like this?
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Yeah that sounds like a better idea, I think I'll commit
this instead.

Thanks Joe!

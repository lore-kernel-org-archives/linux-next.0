From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Wed, 03 Dec 2008 16:04:23 -0800 (PST)
Message-ID: <20081203.160423.173238095.davem@davemloft.net>
References: <20081202172413.f14fe387.sfr@canb.auug.org.au>
	<200812022152.25989.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:38884
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1757864AbYLDAEX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Dec 2008 19:04:23 -0500
In-Reply-To: <200812022152.25989.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rusty@rustcorp.com.au
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org

From: Rusty Russell <rusty@rustcorp.com.au>
Date: Tue, 2 Dec 2008 21:52:25 +1030

> On Tuesday 02 December 2008 16:54:13 Stephen Rothwell wrote:
> > Hi Dave,
> >
> > Today's linux-next build (sparc defconfig) failed like this:
> >
> > lib/find_next_bit.c: In function 'find_last_bit':
> > lib/find_next_bit.c:183: error: implicit declaration of function '__fls'
> 
> Thanks Stephen... that's a surprise.
> 
> Dave, I think this is a sparc issue.
> 
> sparc: asm/bitops.h should define __fls

I'll add this patch, thanks Rusty.

From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: origin tree build failure
Date: Tue, 14 Apr 2009 02:08:18 -0700 (PDT)
Message-ID: <20090414.020818.174886786.davem@davemloft.net>
References: <20090414144317.026498df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:49876
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751154AbZDNJI1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2009 05:08:27 -0400
In-Reply-To: <20090414144317.026498df.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: torvalds@linux-foundation.org, linux-next@vger.kernel.org, fweisbec@gmail.com, linux-kernel@vger.kernel.org, mingo@elte.hu

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 14 Apr 2009 14:43:17 +1000

> sparc: asm/atomic.h on 32bit should include asm/system.h for xchg
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Just in case it wasn't clear, I'm applying this :)

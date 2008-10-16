From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: origin tree build failure
Date: Wed, 15 Oct 2008 21:57:19 -0700 (PDT)
Message-ID: <20081015.215719.204317426.davem@davemloft.net>
References: <20081016113531.c2f6b79c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40867
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751077AbYJPE5m (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 00:57:42 -0400
In-Reply-To: <20081016113531.c2f6b79c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: torvalds@linux-foundation.org, linux-next@vger.kernel.org, tsbogend@alpha.franken.de, ralf@linux-mips.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 16 Oct 2008 11:35:31 +1100

> Hi Linus,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/rtc/rtc-m48t35.c: In function 'm48t35_read_time':
> drivers/rtc/rtc-m48t35.c:59: error: implicit declaration of function 'readb'
> drivers/rtc/rtc-m48t35.c:60: error: implicit declaration of function 'writeb'

This part looks simply like a missing asm/io.h include.

MIPS is getting it implicitly somehow.

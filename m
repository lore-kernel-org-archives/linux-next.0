From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Sat, 26 Jul 2008 02:25:35 -0700 (PDT)
Message-ID: <20080726.022535.136577188.davem@davemloft.net>
References: <20080725170527.00a7bf4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:44126
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751702AbYGZJZf (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sat, 26 Jul 2008 05:25:35 -0400
In-Reply-To: <20080725170527.00a7bf4a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 25 Jul 2008 17:05:27 +1000

> Today's linux-next build (sparc defconfig) failed like this:
> 
>   Building modules, stage 2.
> .tmp_kallsyms2.o(.rodata+0x0): In function `kallsyms_addresses':
> : relocation truncated to fit: R_SPARC_32 _text

That's impressive, getting a relocation overflow for
a 32-bit relocation on a 32-bit platforms, amazing!
:-)

I'll try to figure out whats wrong if someone else
doesn't beat me to it.

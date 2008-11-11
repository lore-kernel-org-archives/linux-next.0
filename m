From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure
Date: Tue, 11 Nov 2008 01:18:27 -0800 (PST)
Message-ID: <20081111.011827.91680115.davem@davemloft.net>
References: <20081111191042.ad5eab44.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40628
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752481AbYKKJS2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2008 04:18:28 -0500
In-Reply-To: <20081111191042.ad5eab44.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linville@tuxdriver.com, linux-next@vger.kernel.org, Sujith.Manoharan@atheros.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 11 Nov 2008 19:10:42 +1100

> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/net/wireless/ath9k/main.c: At top level:
> drivers/net/wireless/ath9k/main.c:827: warning: conflicting types for 'ath_detach'
> drivers/net/wireless/ath9k/main.c:827: error: static declaration of 'ath_detach' follows non-static declaration
> drivers/net/wireless/ath9k/main.c:812: error: previous implicit declaration of 'ath_detach' was here

It only passed my allmodconfig tests on sparc64 because this code is
guarded by "CONFIG_RFKILL" but not "CONFIG_RFKILL_MODULE".

I wonder how many times that kind of error exists (checking FOO but
not FOO_MODULE) in the tree :-/

In any event, John please get me a fix for this at your next
opportunity.

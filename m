From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net-current/net merge conflict
Date: Sun, 25 May 2008 23:29:58 -0700 (PDT)
Message-ID: <20080525.232958.10056357.davem@davemloft.net>
References: <20080526133234.d6ae478e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:56566
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751171AbYEZGaC (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 26 May 2008 02:30:02 -0400
In-Reply-To: <20080526133234.d6ae478e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, jgarzik@redhat.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 26 May 2008 13:32:34 +1000

> Today's linux-next merge of the net tree got a trivial conflict in
> drivers/net/cpmac.c between commit
> f917d58031fce6dfd7cea71259ea6a2b663ec813 ("cpmac bugfixes and
> enhancements") from the net-current tree and commit
> 7d2e3cb7000b883a8e489485ac249be572fe17b1 ("[netdrvr] Trim trailing
> whitespace for several drivers") from the net tree. The former removed a
> comment that the latter made a whitespace fix to.

Thanks Stephen.

I'm trying to do a quick merge of net-2.6 into net-next-2.6
right now and will push the result out to master.kernel.org
after some build sanity tests.

Hopefully that will resolve both of the current merge
conflicts in the networking.

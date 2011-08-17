From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: boot test failure (net tree)
Date: Tue, 16 Aug 2011 20:04:53 -0700 (PDT)
Message-ID: <20110816.200453.1648804479684623262.davem@davemloft.net>
References: <20110817105002.efebf85d08460ad99b14be8e@canb.auug.org.au>
	<20110816.175657.1688139393736610845.davem@davemloft.net>
	<1313543952.2981.132.camel@deadeye>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:42348 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335Ab1HQDHN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Aug 2011 23:07:13 -0400
In-Reply-To: <1313543952.2981.132.camel@deadeye>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: bhutchings@solarflare.com
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jeffrey.t.kirsher@intel.com

From: Ben Hutchings <bhutchings@solarflare.com>
Date: Wed, 17 Aug 2011 02:19:12 +0100

> If you were to use just "yes", then of course it would.  But since there
> is no explicit default, "yes ''" will deselect them.
> 
> Maybe these guards should have "default y"?

The point is to declutter xconfig and friends, if it defaults to
'y' everything will just always expand.

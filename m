From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Fri, 12 Sep 2008 23:24:21 -0700 (PDT)
Message-ID: <20080912.232421.214954396.davem@davemloft.net>
References: <20080913150326.245fbb6f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:49525
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752285AbYIMGY2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sat, 13 Sep 2008 02:24:28 -0400
In-Reply-To: <20080913150326.245fbb6f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, juliusv@google.com, horms@verge.net.au

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sat, 13 Sep 2008 15:03:26 +1000

> net: ip_vs_proto_tcp build fix
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied, thanks Stephen.

I updated the commit message to mention ip_vs_proto_udp since you
fixed that too :-)

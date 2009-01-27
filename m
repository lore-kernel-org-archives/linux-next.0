From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: pppoe - stop using proc internals
Date: Mon, 26 Jan 2009 21:11:11 -0800 (PST)
Message-ID: <20090126.211111.122432985.davem@davemloft.net>
References: <20090125120243.GA29167@localhost>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:48780
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750898AbZA0FLN (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Jan 2009 00:11:13 -0500
In-Reply-To: <20090125120243.GA29167@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gorcunov@gmail.com
Cc: adobriyan@gmail.com, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mostrows@earthlink.net, netdev@vger.kernel.org

From: Cyrill Gorcunov <gorcunov@gmail.com>
Date: Sun, 25 Jan 2009 15:02:43 +0300

> Alexey Dobriyan pointed that using PDE_NET outside the
> proc code is plain bogus (thanks Alexey!). Fix it.
> 
> Signed-off-by: Cyrill Gorcunov <gorcunov@openvz.org>

Applied, thanks Cyrill.

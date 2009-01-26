From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Sun, 25 Jan 2009 20:46:23 -0800 (PST)
Message-ID: <20090125.204623.137022547.davem@davemloft.net>
References: <20090126135307.e4630fc7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:43915
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751287AbZAZEqV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 25 Jan 2009 23:46:21 -0500
In-Reply-To: <20090126135307.e4630fc7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@linux-foundation.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 26 Jan 2009 13:53:07 +1100

> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "com20020_netdev_ops" [drivers/net/arcnet/com20020-pci.ko] undefined!
> 
> We are not winning with this one :-(

I don't understand this.  If I mark it extern, as I did, it
should only be defined in one object file.

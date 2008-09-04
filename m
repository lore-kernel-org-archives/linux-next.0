From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the sparc tree
Date: Wed, 03 Sep 2008 18:17:56 -0700 (PDT)
Message-ID: <20080903.181756.61496204.davem@davemloft.net>
References: <20080904111717.8aec7545.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:35873
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752609AbYIDBSD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Sep 2008 21:18:03 -0400
In-Reply-To: <20080904111717.8aec7545.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 4 Sep 2008 11:17:17 +1000

> Today's linux-next merge of the sparc tree got a conflict in
> arch/sparc/kernel/of_device.c between commit
> e3c71a32915fabb095de7108c22672e457631a08 ("sparc: Fix resource flags for
> PCI children in OF device tree") from Linus' tree and commit
> 5280267c1dddb8d413595b87dc406624bb497946 ("sparc: Fix handling of LANCE
> and ESP parent nodes in of_device.c") from the sparc tree.
> 
> The former just changed the context of the latter.  I fixed it up (see
> below).

Looks good, thanks.

I'll pull sparc-2.6 into sparc-next-2.6 at some point to resolve
this.

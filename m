From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with Linus' tree
Date: Wed, 03 Jun 2009 03:33:51 -0700 (PDT)
Message-ID: <20090603.033351.193935428.davem@davemloft.net>
References: <20090603122048.f2b7fef2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:44006
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752256AbZFCKdv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2009 06:33:51 -0400
In-Reply-To: <20090603122048.f2b7fef2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, eswierk@aristanetworks.com, aabdulla@nvidia.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Jun 2009 12:20:48 +1000

> Hi Dave,
> 
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/forcedeth.c between commit
> 5a9a8e32ebe269c71d8d3e78f9435fe7729f38e9 ("forcedeth: add phy_power_down
> parameter, leave phy powered up by default (v2)") from Linus' tree and
> commit 88d7d8b00cdc3117150faab4c4ace6d464b71c22 ("forcedeth: add clock
> gating feature <resend>") from the net tree.
> 
> Just context changing.  I fixed it up (see below) and can carry the fix
> for a while.

This will be fixed with a push I'll do in a few moments.

Thanks Stephen!

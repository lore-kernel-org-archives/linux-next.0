From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Thu, 20 Nov 2008 20:11:02 -0800 (PST)
Message-ID: <20081120.201102.250443248.davem@davemloft.net>
References: <20081121132941.87c9eacc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:36275
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751026AbYKUELE (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 23:11:04 -0500
In-Reply-To: <20081121132941.87c9eacc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, jesse.brandeburg@intel.com, jgarzik@redhat.com, jeffrey.t.kirsher@intel.com, adobriyan@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 21 Nov 2008 13:29:41 +1100

> Hi Dave,
> 
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/ixgbe/ixgbe_main.c between commit
> 79aefa45b20940cbb9104464548ff74f80f2395e ("ixgbe: fix compilation with
> gcc-3.4") from the net-current tree and commit
> 0befdb3e0a26a8949063915274e1bec8873c526b ("ixgbe: add device support for
> 82598AT (copper 10GbE) adapters") from the net tree.
> 
> I fixed it up (see below) and assume you will do something similar.

If you would have pulled 20 minutes later you would have gotten
my tree after sorting out these merge hassles :)

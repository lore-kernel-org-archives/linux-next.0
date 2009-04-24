From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Fri, 24 Apr 2009 04:53:14 -0700 (PDT)
Message-ID: <20090424.045314.115818244.davem@davemloft.net>
References: <20090424170136.fb013660.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:48904
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751128AbZDXLxV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Apr 2009 07:53:21 -0400
In-Reply-To: <20090424170136.fb013660.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, ormi.linux@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 24 Apr 2009 17:01:36 +1000

> Caused by commit 362b76edb78923face033e18e4ffc85df8db0f28 ("8390p: Get
> rid of init_module/cleanup_module").
> 
> Clearly not even looked at hard, much less built ...

Yes I certainly regret applying that garbage patch.

And I do mean GARBAGE.

Alexander fixed it up and I pushed the fix onto kernel.org

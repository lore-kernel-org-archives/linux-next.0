From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with the net-current
 tree
Date: Fri, 25 Jun 2010 11:22:39 -0700 (PDT)
Message-ID: <20100625.112239.98879902.davem@davemloft.net>
References: <20100623125116.1370bdd4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:46280
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756658Ab0FYSW0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Jun 2010 14:22:26 -0400
In-Reply-To: <20100623125116.1370bdd4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au, xiaosuo@gmail.com, eric.dumazet@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 23 Jun 2010 12:51:16 +1000

> Hi all,
> 
> Today's linux-next merge of the net tree got a conflict in
> net/ipv4/ip_output.c between commit
> 26cde9f7e2747b6d254b704594eed87ab959afa5 ("udp: Fix bogus UFO packet
> generation") from the net-current tree and commit
> d8d1f30b95a635dbd610dcc5eb641aca8f4768cf ("net-next: remove useless union
> keyword") from the net tree.
> 
> Just context changes. I fixed it up (see below) and can carry the fix as
> necessary.

I recently merged net-2.6 into net-next-2.6, let me know if the problem
persists.

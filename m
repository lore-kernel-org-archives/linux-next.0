From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with the tree
Date: Fri, 08 May 2009 00:49:38 -0700 (PDT)
Message-ID: <20090508.004938.203704149.davem@davemloft.net>
References: <20090508132352.4763ae91.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:47190
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754891AbZEHHtn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2009 03:49:43 -0400
In-Reply-To: <20090508132352.4763ae91.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, dada1@cosmosbay.com, satoru.satoh@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 8 May 2009 13:23:52 +1000

> Today's linux-next merge of the net tree got a conflict in
> include/net/tcp.h between commit 0c266898b42fe4e4e2f9edfc9d3474c10f93aa6a
> ("tcp: Fix tcp_prequeue() to get correct rto_min value") from Linus' tree
> and commit f5f8d86b231e0489c33542c42afbb14d32411ee8 ("tcp: tcp_prequeue()
> cleanup") from the net tree.
> 
> I fixed it up (see below - please check) and can carry the fix for a
> while.

Thanks Stephen, I'll do a merge to fix this up.

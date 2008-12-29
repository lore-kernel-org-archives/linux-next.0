From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 29 (cxgb3i)
Date: Mon, 29 Dec 2008 12:35:17 -0800
Message-ID: <20081229123517.23fd6169.randy.dunlap@oracle.com>
References: <20081230031621.60acd90b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:20961 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753836AbYL2Ufb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Dec 2008 15:35:31 -0500
In-Reply-To: <20081230031621.60acd90b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, scsi <linux-scsi@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kxie@chelsio.com

On Tue, 30 Dec 2008 03:16:21 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20081219:
> 
> Undropped tree:
> 	scci
> 	mtd
> 
> Dropped trees (temporarily):
> 	nfs (akpm request due to 2.6.30 features)
> 	kvm (build problem)
> 	rr (build poblem)
> 	semaphore-removal (due to unfixed conflicts against Linus' tree)
> 	cpu_alloc (build problem)
> 	audit (difficult conflicts)
> 
> Linus' tree had three build failures requiring patches and one requiring
> a revert.


linux-next-20081229/drivers/scsi/cxgb3i/cxgb3i_offload.c:499: error: 'struct sk_buff' has no member named 'sp'
linux-next-20081229/drivers/scsi/cxgb3i/cxgb3i_offload.c:512: error: 'struct sk_buff' has no member named 'sp'
linux-next-20081229/drivers/scsi/cxgb3i/cxgb3i_offload.c:532: error: 'struct sk_buff' has no member named 'sp'
linux-next-20081229/drivers/scsi/cxgb3i/cxgb3i_offload.c:533: error: 'struct sk_buff' has no member named 'sp'


---
~Randy

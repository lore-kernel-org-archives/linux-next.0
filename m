From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: "hugetlb: hugepage migration core" breaks
 compilation on s390
Date: Mon, 11 Oct 2010 16:22:52 +0200
Message-ID: <20101011142252.GC10270@osiris.boeblingen.de.ibm.com>
References: <20101011111131.GA10270@osiris.boeblingen.de.ibm.com>
 <20101011140834.GA7962@gargoyle.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate5.uk.ibm.com ([194.196.100.165]:36366 "EHLO
	mtagate5.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754833Ab0JKOW6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2010 10:22:58 -0400
Received: from d06nrmr1707.portsmouth.uk.ibm.com (d06nrmr1707.portsmouth.uk.ibm.com [9.149.39.225])
	by mtagate5.uk.ibm.com (8.13.1/8.13.1) with ESMTP id o9BEMs4W008264
	for <linux-next@vger.kernel.org>; Mon, 11 Oct 2010 14:22:54 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com [9.149.37.216])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id o9BEMs5d3342470
	for <linux-next@vger.kernel.org>; Mon, 11 Oct 2010 15:22:54 +0100
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id o9BEMrxI002536
	for <linux-next@vger.kernel.org>; Mon, 11 Oct 2010 15:22:54 +0100
Content-Disposition: inline
In-Reply-To: <20101011140834.GA7962@gargoyle.fritz.box>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, linux-next@vger.kernel.org, Jun'ichi Nomura <j-nomura@ce.jp.nec.com>, Mel Gorman <mel@csn.ul.ie>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Mon, Oct 11, 2010 at 04:08:34PM +0200, Andi Kleen wrote:
> On Mon, Oct 11, 2010 at 01:11:31PM +0200, Heiko Carstens wrote:
> > "hugetlb: hugepage migration core" in linux-next breaks compilation on s390:
> > 
> >   CC      mm/migrate.o
> > mm/migrate.c: In function 'remove_migration_pte':
> > mm/migrate.c:143:3: error: implicit declaration of function 'pte_mkhuge'
> > mm/migrate.c:143:7: error: incompatible types when assigning to type 'pte_t' from type 'int'
> > make[1]: *** [mm/migrate.o] Error 1
> > make: *** [mm/migrate.o] Error 2
> > 
> > This is simply because a lot of CONFIG_HUGETLB_PAGE dependent code was added
> > to mm/migration.c which does not depend on that config option. Please fix.
> 
> Most of the functions have inline dummies, just pte_mkhuge() doesn't.
> Anyways the easiest fix would be a simple #ifdef. Does this patch
> work for you?

Yes.

> From: Andi Kleen <ak@linux.intel.com>
> Subject: [PATCH] Fix migration.c compilation on s390
> 
> s390 doesn't have huge pages and failed with

s390 has huge pages only in 64 bit mode, but not in 31 bit mode.

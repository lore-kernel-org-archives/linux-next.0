From: Andi Kleen <ak@linux.intel.com>
Subject: Re: linux-next: "hugetlb: hugepage migration core" breaks
 compilation on s390
Date: Mon, 11 Oct 2010 16:59:46 +0200
Message-ID: <20101011145946.GB9269@gargoyle.fritz.box>
References: <20101011111131.GA10270@osiris.boeblingen.de.ibm.com>
 <20101011140834.GA7962@gargoyle.fritz.box>
 <20101011142252.GC10270@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:25226 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754314Ab0JKO50 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Oct 2010 10:57:26 -0400
Content-Disposition: inline
In-Reply-To: <20101011142252.GC10270@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, linux-next@vger.kernel.org, Jun'ichi Nomura <j-nomura@ce.jp.nec.com>, Mel Gorman <mel@csn.ul.ie>, Martin Schwidefsky <schwidefsky@de.ibm.com>

> > From: Andi Kleen <ak@linux.intel.com>
> > Subject: [PATCH] Fix migration.c compilation on s390
> > 
> > s390 doesn't have huge pages and failed with
> 
> s390 has huge pages only in 64 bit mode, but not in 31 bit mode.

Ok I will fix the commit message.
-Andi

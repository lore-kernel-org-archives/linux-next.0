From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the sparc tree
Date: Tue, 16 Sep 2008 14:31:37 -0700 (PDT)
Message-ID: <20080916.143137.134226448.davem@davemloft.net>
References: <20080917062746.b292a96a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:54460
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751636AbYIPVbn (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Sep 2008 17:31:43 -0400
In-Reply-To: <20080917062746.b292a96a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 17 Sep 2008 06:27:46 +1000

> Today's linux-next merge of the sparc tree got a conflict in
> arch/sparc64/kernel/pci_psycho.c between commit
> f948cc6ab9e61a8e88d70ee9aafc690e6d26f92c("sparc64: Fix OOPS in
> psycho_pcierr_intr_other()") from the sparc-current tree and commit
> e6e003720fd7123482f77dcec19e930d272937fe ("sparc64: Commonize large
> portions of PSYCHO error handling") from the sparc tree.
> 
> The latter moves code that the former modifies.  So, as discsussed, I
> dropped the former fix for today as I assume you will fix it when you
> merge sparc-current.

Thanks Stephen.

I just pushed a merge resolution to this by pulling sparc-2.6
into sparc-next-2.6, moving the PCI config space address
computer into psycho_common.h, and propagating the bug fix
from sparc-2.6 into where the code lives now in psycho_common.c

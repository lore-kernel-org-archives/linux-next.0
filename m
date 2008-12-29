From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the iommu tree
Date: Mon, 29 Dec 2008 13:15:01 +0100
Message-ID: <20081229121501.GE9628@elte.hu>
References: <20081229230451.4e322cde.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:49426 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751528AbYL2MPV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 07:15:21 -0500
Content-Disposition: inline
In-Reply-To: <20081229230451.4e322cde.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, Jeremy Fitzhardinge <jeremy@goop.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> Today's linux-next merge of the iommu tree got a conflict in
> arch/x86/kernel/Makefile between commit
> b43d196c4d3fe46d6dda7c987c47792612b80b1b ("x86: corruption-check: some
> post-move cleanups") from Linus' tree and commit
> cfb80c9eae8c7ed8f2ee81090062d15ead51cbe8 ("x86: unify pci iommu setup and
> allow swiotlb to compile for 32 bit") from the iommu tree.
> 
> Simply overlapping additions.  I fixed it up (see below) and can carry
> the fix as necessary.

had a resolution for this cached from tip/master - so i just re-integrated 
and re-pushed auto-iommu-next so it should go away next time you pick it 
up. Thanks,

	Ingo

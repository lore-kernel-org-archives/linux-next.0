From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm-lpae tree with the arm tree
Date: Tue, 22 Nov 2011 09:47:38 +0000
Message-ID: <20111122094738.GB31064@arm.com>
References: <20111122120358.aa2cefdcdace9a98acafd4b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:37064 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751119Ab1KVJr7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Nov 2011 04:47:59 -0500
Content-Disposition: inline
In-Reply-To: <20111122120358.aa2cefdcdace9a98acafd4b9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King <rmk@arm.linux.org.uk>

Hi Stephen,

On Tue, Nov 22, 2011 at 01:03:58AM +0000, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-lpae tree got a conflict in
> arch/arm/mm/ioremap.c between commit 3afb51f744b6 ("ARM: add generic
> ioremap optimization by reusing static mappings") from the arm tree and
> commit ec93d80c4b07 ("ARM: LPAE: Page table maintenance for the 3-level
> format") from the arm-lpae tree.
> 
> I guessed (probably incorrectly) about the fix up (see below).  Please
> supply a better fix if necessary.

Thanks for pointing out. I'll have a look at the conflict and let you
know.

> More generally, is the LPAE stuff going to be merged soon?  

Hopefully I get it merged during the upcoming merging window (for
3.3-rc1) but it does not depend only on me.

> The above
> arm-lpae commit dates from February (though it was recommitted on Nov
> 15) ...

Maybe I should do a 'git rebase --ignore-date', it doesn't make much
sense for a reworked patch to still keep the original author date.

-- 
Catalin

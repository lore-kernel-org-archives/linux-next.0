From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Wed, 25 Jun 2008 09:15:08 +0200
Message-ID: <20080625071508.GA20454@elte.hu>
References: <20080625142034.59b343c7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:41373 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752115AbYFYHPb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 03:15:31 -0400
Content-Disposition: inline
In-Reply-To: <20080625142034.59b343c7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Bob Moore <robert.moore@intel.com>, Yinghai Lu <yhlu.kernel@gmail.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Len,
> 
> Today's linux-next merge of the acpi tree got a conflict in 
> arch/x86/kernel/srat_32.c between commit 
> 9920a004626a2dc2980693d634e4000f086cb283 ("x86: use acpi_numa_init to 
> parse on 32-bit numa") from the tree and commit 
> a27557c76c6e092ec886f0e3e443f3190f0b0fcc ("ACPICA: Eliminate 
> acpi_native_uint type") from the acpi tree.
> 
> The code modified by the latter was removed by the former.  So I used 
> the former.

thanks Stephen.

I suspect we cannot really eliminate this particular conflict because 
the latter change is a (much welcome!) infrastructure cleanup in all 
things ACPI, the former is an early init refactoring/cleanup that 
depends on a whole lot of other (non-ACPI) changes in tip/x86/*. It's
too late in .26-rc cycle to push the infrastructure cleanup upstream, so
i suspect we have to live with this conflict for a while.

	Ingo

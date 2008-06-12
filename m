From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: acpi/cpus4096 merge conflict
Date: Thu, 12 Jun 2008 14:18:24 +0200
Message-ID: <20080612121824.GA26504@elte.hu>
References: <20080612135032.b5d0c684.sfr@canb.auug.org.au> <alpine.LFD.1.10.0806120045320.12191@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:58449 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756079AbYFLMSw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 08:18:52 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.10.0806120045320.12191@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Mike Travis <travis@sgi.com>


* Len Brown <lenb@kernel.org> wrote:

> > Today's linux-next merge of the acpi tree got a trivial conflict in
> > drivers/acpi/processor_throttling.c between commit
> > 141ad0688adb53094d6f75b39b4b3b0625de0e07 ("acpi: use performance variant
> > for_each_cpu_mask_nr") from the cpus4096 tree and commit
> > 08a4ab4a5fd58438840524ce22199c6bbd05816f ("ACPI: change processors from
> > array to per_cpu variable") from the acpi tree.
> > 
> > It is just a context conflict and I did the obvious fixup.
> 
> thanks.
> 
> it would be ideal if the cpus4096 tree didn't scribble on drivers/acpi 
> -- though I don't know if partitioning those patches is practical.

well, it's a tree-wide API change and thus maintained in a separate 
tree.

	Ingo

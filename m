From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Mon, 23 Jun 2008 23:56:07 +0200
Message-ID: <20080623215607.GB12877@elte.hu>
References: <20080623141925.05a1d214.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:58664 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753527AbYFWV4c (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 17:56:32 -0400
Content-Disposition: inline
In-Reply-To: <20080623141925.05a1d214.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Zhao Yakui <yakui.zhao@intel.com>, Thomas Gleixner <tglx@linutronix.de>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Len,
> 
> Today's linux-next merge of the acpi tree got a conflict in
> arch/x86/kernel/process.c between commit
> 8750bf598db6a0ea3475d1cf8da922b325941e12 ("x86: add C1E aware idle
> function") from the x86 tree and commits
> bd08eac673842bab79ddaec048012b6e5d4074fd ("ACPI: Create "idle=halt" boot
> parameter") and 5ffc8862cc917ae5107049f3c5fd549fb6c19cac ("ACPI : Create
> "idle=nomwait" bootparam") from the acpi tree.
> 
> This is just an overlapping additions problem, so I took both in the 
> obvious manner.

thanks Stephen. I've cherry-picked the two ACPI commits into 
tip/x86/cpu, to make future merges easier.

	Ingo

From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the x86 tree
Date: Fri, 5 Sep 2008 20:22:17 +0200
Message-ID: <20080905182217.GB14258@elte.hu>
References: <20080902113210.bc27a75f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:58739 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751251AbYIESWi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Sep 2008 14:22:38 -0400
Content-Disposition: inline
In-Reply-To: <20080902113210.bc27a75f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the x86 tree got a conflict in
> drivers/pci/intel-iommu.c between commit
> 213f841f903ed16fc1dd29885560cdd159630ed6 ("intel-iommu.c: Blacklist Intel
> DG33BU motherboard") from the dwmw2 tree and commit
> 2ae21010694e56461a63bfc80e960090ce0a5ed9 ("x64, x2apic/intr-remap:
> Interrupt remapping infrastructure") from the x86 tree.
> 
> I think the easiest thing to do for today is just to revert the change in
> the dwmw2 tree and see if you guys can come up with a better patch for
> tomorrow.

i suspect that commit shouldnt be in the dwmw2 tree - David, agreed?

	Ingo

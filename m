From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the x86 tree
Date: Sun, 14 Sep 2008 17:16:50 +0200
Message-ID: <20080914151650.GA29290@elte.hu>
References: <20080912093751.f4a4314e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:53812 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752538AbYINPRI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 11:17:08 -0400
Content-Disposition: inline
In-Reply-To: <20080912093751.f4a4314e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Jesse Barnes <jbarnes@virtuousgeek.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the x86 tree got a conflict in
> drivers/pci/intel-iommu.c between commit
> cbda1ba898647aeb4ee770b803c922f595e97731 ("PCI/iommu: blacklist DMAR on
> Intel G31/G33 chipsets") from the pci-current tree and commit
> 2ae21010694e56461a63bfc80e960090ce0a5ed9 ("x64, x2apic/intr-remap:
> Interrupt remapping infrastructure") from the x86 tree.
> 
> It was a bit difficult to see how to easily fix this up, so I have
> effectively reverted the pci-current commit for now (by using the x86
> version of the file) but, I assume, that commit will end up in Linus'
> tree soon so that the x86 guys can fix the conflict in their tree.

yep, i've done a more intelligent merge (keeping the pci tree changes) 
and pushed the result out into tip/auto-x86-next.

	Ingo

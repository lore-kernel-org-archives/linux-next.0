From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip-core tree
Date: Wed, 25 Jun 2008 11:17:45 +0200
Message-ID: <20080625091745.GC11524@elte.hu>
References: <20080625104928.d26f77fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:40960 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753226AbYFYJSF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 05:18:05 -0400
Content-Disposition: inline
In-Reply-To: <20080625104928.d26f77fe.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip-core tree got a trivial context 
> conflicts in arch/x86/xen/enlighten.c, arch/x86/xen/mmu.c and 
> arch/x86/xen/mmu.h between commit 
> 28499143933f19b28008a556ed59255d6009391a ("xen: remove support for 
> non-PAE 32-bit") from Linus' tree (and also exists in the tip-core 
> tree) and commit e2426cf85f8db5891fb5831323d2d0c176c4dadc ("xen: avoid 
> hypercalls when updating unpinned pud/pmd") from the tip-core tree.
> 
> I fixed it up and will carry the fixup.

thanks Stephen. This conflict should go away on the next -tip 
integration run. (I'm wondering why Git didnt manage to do a clean merge 
here - this was a cleanly cherry-picked commit that went upstream.)

	Ingo

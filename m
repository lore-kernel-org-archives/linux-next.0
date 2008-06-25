From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: manual merge of the tip-core tree
Date: Tue, 24 Jun 2008 23:51:10 -0400
Message-ID: <4861C0AE.4080809@goop.org>
References: <20080625104928.d26f77fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw.goop.org ([64.81.55.164]:37604 "EHLO mail.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751637AbYFYDvZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 23:51:25 -0400
In-Reply-To: <20080625104928.d26f77fe.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the tip-core tree got a trivial context
> conflicts in arch/x86/xen/enlighten.c, arch/x86/xen/mmu.c and
> arch/x86/xen/mmu.h between commit
> 28499143933f19b28008a556ed59255d6009391a ("xen: remove support for
> non-PAE 32-bit") from Linus' tree (and also exists in the tip-core tree)
> and commit e2426cf85f8db5891fb5831323d2d0c176c4dadc ("xen: avoid
> hypercalls when updating unpinned pud/pmd") from the tip-core tree.
>
> I fixed it up and will carry the fixup.
>
>   

Great thanks.

    J

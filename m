From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Fri, 15 Aug 2008 10:17:00 +0200
Message-ID: <20080815081700.GA4776@elte.hu>
References: <20080815164512.3f36d7a6.sfr@canb.auug.org.au> <48A525A3.8050705@cs.helsinki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:55253 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751600AbYHOIR0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 04:17:26 -0400
Content-Disposition: inline
In-Reply-To: <48A525A3.8050705@cs.helsinki.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vegard Nossum <vegard.nossum@gmail.com>, linux-next@vger.kernel.org, "Gustavo F. Padovan" <gustavo@las.ic.unicamp.br>


* Pekka Enberg <penberg@cs.helsinki.fi> wrote:

> Stephen Rothwell wrote:
>> Today's linux-next merge of the kmemcheck tree got a conflict in
>> arch/x86/kernel/process_64.c between commits
>> 8092c654de9a964c14d89da56834f73a80548a58 ("x86: add KERN_INFO to printks
>> on process_64.c") and 7de08b4e1ed8d80e6086f71b7e99fc4b397aae39 ("x86:
>> coding styles fixes to arch/x86/kernel/process_64.c") from the x86 tree
>> and commit afdb7023b849cffda679fcec324ff592d7b24a51 ("x86:
>> __show_registers() and __show_regs() API unification") from the kmemcheck
>> tree.
>
> Ingo, can we push the unification patch to mainline before kmemcheck 
> to get rid of the conflict?

hm, i think it's too late for that. The 130+ arch/x86 contributors were 
very busy in this cycle too [1300+ commits (!)] so we need to slow down 
during -rc's much harder and much sooner than other, lower-flux 
subsystems.

Furthermore, this particular piece of code is not in a high-flux area so 
git-rerere should properly take care of it i think, even in the longer 
run. I've been carrying that merge fixup in tip/master for a long time.

	Ingo

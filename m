From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: manual merge of the x86 tree
Date: Mon, 07 Jul 2008 20:22:10 -0700
Message-ID: <4872DD62.1060708@goop.org>
References: <20080708105658.1a9deedc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw.goop.org ([64.81.55.164]:47280 "EHLO mail.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755381AbYGHDWU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 23:22:20 -0400
In-Reply-To: <20080708105658.1a9deedc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>

Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the x86 tree got a conflict in
> include/asm-x86/irqflags.h between commit
> 81d68a96a39844853b37f20cc8282d9b65b78ef3 ("ftrace: trace irq disabled
> critical timings") from the ftrace tree and commits
> f56c208ae2a6705a40c0f7d43bfc4ede7eb20a83 ("x86, 64-bit: swapgs pvop with
> a user-stack can never be called") and
> 6d2a6e57be1582b017a39f52385adf49d7cc4b0f ("x86_64: fix non-paravirt
> compilation") from the x86 tree.
>   

I must be missing something.  Don't all those already come from tip.git 
pre-merged?  Or are you merging various tip.git topic branches 
yourself?  Or are some of these coming from elsewhere?

> Just contextual remove/move of code.  I can carry the fixup.
>   

Thanks,
    J

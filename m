From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the rseq tree with Linus' tree
Date: Wed, 15 Nov 2017 09:07:12 +0100
Message-ID: <20171115080712.tehklwmcvol7iiic@gmail.com>
References: <20171115153536.7fab87b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:35987 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755355AbdKOIHQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Nov 2017 03:07:16 -0500
Content-Disposition: inline
In-Reply-To: <20171115153536.7fab87b7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mathieu,
> 
> [I may regret adding the rseq tree ...]
> 
> Today's linux-next merge of the rseq tree got a conflict in:
> 
>   arch/x86/entry/entry_64.S
> 
> between commits:
> 
>   9da78ba6b47b ("x86/entry/64: Remove the restore_c_regs_and_iret label")
>   26c4ef9c49d8 ("x86/entry/64: Split the IRET-to-user and IRET-to-kernel paths")
>   e53178328c9b ("x86/entry/64: Shrink paranoid_exit_restore and make labels local")
> 
> from Linus' tree and commit:
> 
>   60a77bfd24d5 ("membarrier: x86: Provide core serializing command (v2)")
> 
> from the rseq tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

NAK!

There's absolutely no way such invasive x86 changes should be done outside the x86 
tree and be merged into linux-next.

linux-next should be for the regular maintenance flow, for changes pushed by 
maintainers and part of the regular maintenance process - not for work-in-progress 
features that may or may not be merged upstream in that form ...

Thanks,

	Ingo

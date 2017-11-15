From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: linux-next: manual merge of the rseq tree with Linus' tree
Date: Wed, 15 Nov 2017 14:49:19 +0000 (UTC)
Message-ID: <526269455.15785.1510757359340.JavaMail.zimbra@efficios.com>
References: <20171115153536.7fab87b7@canb.auug.org.au> <20171115080712.tehklwmcvol7iiic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.efficios.com ([167.114.142.141]:39923 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758147AbdKOOse (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Nov 2017 09:48:34 -0500
In-Reply-To: <20171115080712.tehklwmcvol7iiic@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>

----- On Nov 15, 2017, at 3:07 AM, Ingo Molnar mingo@kernel.org wrote:

> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi Mathieu,
>> 
>> [I may regret adding the rseq tree ...]
>> 
>> Today's linux-next merge of the rseq tree got a conflict in:
>> 
>>   arch/x86/entry/entry_64.S
>> 
>> between commits:
>> 
>>   9da78ba6b47b ("x86/entry/64: Remove the restore_c_regs_and_iret label")
>>   26c4ef9c49d8 ("x86/entry/64: Split the IRET-to-user and IRET-to-kernel paths")
>>   e53178328c9b ("x86/entry/64: Shrink paranoid_exit_restore and make labels
>>   local")
>> 
>> from Linus' tree and commit:
>> 
>>   60a77bfd24d5 ("membarrier: x86: Provide core serializing command (v2)")
>> 
>> from the rseq tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> NAK!
> 
> There's absolutely no way such invasive x86 changes should be done outside the
> x86
> tree and be merged into linux-next.

Hi Ingo,

These "invasive" changes to entry*.S is simply adding comments such as:

++        /*
++         * ARCH_HAS_MEMBARRIER_SYNC_CORE rely on iret core serialization
++         * when returning from IPI handler.
++         */
 +        INTERRUPT_RETURN

The more extensive change is from Andy Lutomirski, which went through the
x86 tree.

> 
> linux-next should be for the regular maintenance flow, for changes pushed by
> maintainers and part of the regular maintenance process - not for
> work-in-progress features that may or may not be merged upstream in that form ...

If you prefer, I'd be happy to send the patch
"membarrier: x86: Provide core serializing command (v2)"
for integration through the x86 maintainer tree. However, you'd have to wait until
the rest of the "rseq" tree gets pulled by Linus, given that the generic code
is provided within that tree.

By the way, I was awaiting feedback on the core serializing membarrier command from
Android guys on arm 64, and things are looking good. They have done integration into
their platform, have successfully run their tests on a board, and are now moving to
another board which is known to reproduce the core serialization issue within minutes.

What course of action do you prefer ?

Thanks,

Mathieu


> 
> Thanks,
> 
> 	Ingo

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

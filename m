From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the m68knommu tree with the m68k tree
Date: Fri, 27 Nov 2009 09:43:17 +0100
Message-ID: <10f740e80911270043h567f6bf3l9fc51cfe5a6ac0af@mail.gmail.com>
References: <20091126115806.c53684f5.sfr@canb.auug.org.au>
	 <10f740e80911261329s35f62au37e6b209c657e09@mail.gmail.com>
	 <4B0F5908.3090900@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:60817 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752497AbZK0InM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2009 03:43:12 -0500
In-Reply-To: <4B0F5908.3090900@snapgear.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Ungerer <gerg@snapgear.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Schwab <schwab@linux-m68k.org>

On Fri, Nov 27, 2009 at 05:43, Greg Ungerer <gerg@snapgear.com> wrote:
> Geert Uytterhoeven wrote:
>>
>> On Thu, Nov 26, 2009 at 01:58, Stephen Rothwell <sfr@canb.auug.org.a=
u>
>> wrote:
>>>
>>> Today's linux-next merge of the m68knommu tree got a conflict in
>>> arch/m68k/include/asm/ptrace.h between commit
>>> 63c361b65f6540043c4baabf1a044a45c7465858 ("m68k: use generic code f=
or
>>> ptrace requests") from the m68k tree and commit
>>> 03a03164e8084b810e9f92906a51232d63bac72c ("m68knommu: define
>>> arch_has_single_step() and friends") from the m68knommu tree.
>>>
>>> These mostly add the same stuff but not quite :-(
>>
>> Ah sorry, my bad. I'm not yet used to the uClinux guys touching "my"
>> includes ;-)
>> So we need better coordination between us.
>>
>> IIRC, Greg's changes were inspired by Andreas' patch.
>
> Yes, largely they are.
>
>
>>> I have done a fixup (see below) and can carry it as necessary. =C2=A0=
Please
>>> check the result.
>>
>> At first sight, it looks OK. Thanks for fixing it up!
>
> Yep, looks ok from what I can see.
>
> Geert, how do you want to handle for the real linus merge?
> Do you want me to drop the changes to ptrace.h from that patch?

I can apply your patch (modified to apply on top of Andreas') to the
m68k for-linus branch.
Does that sound OK for you?

>>> --
>>> Cheers,
>>> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
>>>
>>> diff --cc arch/m68k/include/asm/ptrace.h
>>> index eef9309,beb2091..0000000
>>> --- a/arch/m68k/include/asm/ptrace.h
>>> +++ b/arch/m68k/include/asm/ptrace.h
>>> @@@ -86,14 -84,15 +86,18 @@@ struct switch_stack
>>> =C2=A0extern void show_regs(struct pt_regs *);
>>>
>>> =C2=A0/*
>>> =C2=A0- * These are defined as per linux/ptrace.h.
>>> =C2=A0+ * These are defined as per linux/ptrace.h, which see.
>>> =C2=A0*/
>>> + struct task_struct;
>>> +
>>> =C2=A0-#ifndef CONFIG_MMU
>>> =C2=A0-#define =C2=A0 =C2=A0 =C2=A0 arch_has_single_step() =C2=A0(1=
)
>>> =C2=A0+#define arch_has_single_step() =C2=A0 =C2=A0 =C2=A0 =C2=A0(1=
)
>>> =C2=A0extern void user_enable_single_step(struct task_struct *);
>>> =C2=A0extern void user_disable_single_step(struct task_struct *);
>>> =C2=A0+
>>> ++#ifdef CONFIG_MMU
>>> =C2=A0+#define arch_has_block_step() (1)
>>> =C2=A0+extern void user_enable_block_step(struct task_struct *);
>>> + #endif
>>>
>>> =C2=A0#endif /* __KERNEL__ */
>>> =C2=A0#endif /* __ASSEMBLY__ */

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds

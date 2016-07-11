From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: manual merge of the tip tree with the kspp tree
Date: Mon, 11 Jul 2016 14:02:48 -0400
Message-ID: <CAGXu5j+yp1hOcuJ-GkWG1SkjDZMvB=G5LeUz3AU66j9ZhjT8Ug@mail.gmail.com>
References: <20160711151100.02c0b012@canb.auug.org.au> <20160711071307.GB6835@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:37874 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751136AbcGKSCu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Jul 2016 14:02:50 -0400
Received: by mail-wm0-f51.google.com with SMTP id i5so28652417wmg.0
        for <linux-next@vger.kernel.org>; Mon, 11 Jul 2016 11:02:49 -0700 (PDT)
In-Reply-To: <20160711071307.GB6835@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Len Brown <len.brown@intel.com>

On Mon, Jul 11, 2016 at 3:13 AM, Ingo Molnar <mingo@kernel.org> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Hi all,
>>
>> Today's linux-next merge of the tip tree got a conflict in:
>>
>>   arch/x86/kernel/x86_init.c
>>
>> between commit:
>>
>>   255303026193 ("x86: apply more __ro_after_init and const")
>>
>> from the kspp tree and commit:
>
> Kees, did you plan to submit this patch (and any other pending x86 patches) to the
> x86 tree?

I already submitted it, but since it was part of the __ro_after_init
work which was cross-architecture, it seemed best to carry it
separately. I'm happy to do whatever you'd like.

-Kees

-- 
Kees Cook
Brillo & Chrome OS Security

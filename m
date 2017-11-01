From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: manual merge of the tip tree with the block tree
Date: Wed, 1 Nov 2017 07:37:56 -0700
Message-ID: <CAGXu5j+okG+N+xy=9u9rx8FZudO+dM9dsZgq-Ey_Nr51vqWLVw@mail.gmail.com>
References: <20171101171007.6a340098@canb.auug.org.au> <bc21c070-3a7d-b469-62fd-1258ab265e3b@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:44141 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754516AbdKAOh6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Nov 2017 10:37:58 -0400
Received: by mail-io0-f177.google.com with SMTP id m16so6530500iod.1
        for <linux-next@vger.kernel.org>; Wed, 01 Nov 2017 07:37:58 -0700 (PDT)
In-Reply-To: <bc21c070-3a7d-b469-62fd-1258ab265e3b@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 1, 2017 at 7:25 AM, Jens Axboe <axboe@kernel.dk> wrote:
> On 11/01/2017 12:10 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the tip tree got a conflict in:
>>
>>   drivers/block/amiflop.c
>>
>> between commit:
>>
>>   f37ecbfc238b ("amifloppy: Convert timers to use timer_setup()")
>>
>> from the block tree and commit:
>>
>>   3c557df67257 ("timer: Remove meaningless .data/.function assignments")
>>
>> from the tip tree.
>>
>> I fixed it up (I just used the former version of the motor_on_callback
>> definition) and can carry the fix as necessary. This is now fixed as
>> far as linux-next is concerned, but any non trivial conflicts should be
>> mentioned to your upstream maintainer when your tree is submitted for
>> merging.  You may also want to consider cooperating with the maintainer
>> of the conflicting tree to minimise any particularly complex conflicts.
>
> Kees, why are we in this situation? Making similar timer fixups in the
> same driver and submitting it through two different trees is a mess.

It's a large conversion with a lot of moving parts and about 1100
callsites. I've tried to minimize conflicts, but without being able to
carry everything in a single tree, it's made things extremely complex.
I'm doing my best to avoid these glitches, but I haven't been 100%
successful. This is mainly the fault of the conversion uncovering more
and more corner cases as I went. :(

-Kees

-- 
Kees Cook
Pixel Security

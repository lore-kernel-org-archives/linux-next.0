From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH] objtool: Disable stack validation when CROSS_COMPILE is used
Date: Thu, 3 Mar 2016 08:31:57 +0100
Message-ID: <CA+icZUXsFowWpGaY9nYd_w_pP6=qTb7qH-pTP5zFK1QZR8ueZg@mail.gmail.com>
References: <20160301122910.74ff0a92@canb.auug.org.au>
	<20160301070750.GA6636@gmail.com>
	<20160301204001.5594bed3@canb.auug.org.au>
	<20160301215451.GC4852@treble.redhat.com>
	<20160302132735.37262b34@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f46.google.com ([209.85.213.46]:33920 "EHLO
	mail-vk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751402AbcCCHb6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Mar 2016 02:31:58 -0500
In-Reply-To: <20160302132735.37262b34@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 3/2/16, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Josh,
>
> On Tue, 1 Mar 2016 15:54:51 -0600 Josh Poimboeuf <jpoimboe@redhat.com>
> wrote:
>>
>> Changing it to use the host compiler would probably be an easy fix, but
>> that would expose a harder bug related to endianness.
>
> Just by luck, my PowerPC host is little endian :-)
>
>> How about the below workaround patch to disable objtool and warn when
>> CROSS_COMPILE is used?  If anybody complains about lack of cross-compile
>> support later, we could try to fix it then.
>
> This seems reasonable.
>
>> From a3c65947011a420743f308b698171c4209105d3f Mon Sep 17 00:00:00 2001
>> Message-Id:
>> <a3c65947011a420743f308b698171c4209105d3f.1456868910.git.jpoimboe@redhat.com>
>> From: Josh Poimboeuf <jpoimboe@redhat.com>
>> Date: Tue, 1 Mar 2016 13:35:51 -0600
>> Subject: [PATCH] objtool: Disable stack validation when CROSS_COMPILE is
>> used
>
> I have applied this to the merge of the tip tree in linux-next today
> and it compiles fine for me.  I will continue applying it until
> something better comes along or it is applied to the tip tree.
>

Does Linux next-20160303 has this patch?
On a quick view I could not find it.

- Sedat -

> Thanks for that.
> --
> Cheers,
> Stephen Rothwell
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

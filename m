From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: linux-next: x86 tree build warning
Date: Fri, 6 Mar 2009 08:23:53 +0300
Message-ID: <aa79d98a0903052123i770bc198i425ac2389a8986fa@mail.gmail.com>
References: <20090306114744.faf153c5.sfr@canb.auug.org.au>
	 <aa79d98a0903052001w57142b11p5c4dfa228f94c1f7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f178.google.com ([209.85.218.178]:62748 "EHLO
	mail-bw0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750808AbZCFFX5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2009 00:23:57 -0500
Received: by bwz26 with SMTP id 26so217510bwz.37
        for <linux-next@vger.kernel.org>; Thu, 05 Mar 2009 21:23:53 -0800 (PST)
In-Reply-To: <aa79d98a0903052001w57142b11p5c4dfa228f94c1f7@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

On Fri, Mar 6, 2009 at 7:01 AM, Cyrill Gorcunov <gorcunov@gmail.com> wrote:
> On 3/6/09, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>>
>> In file included from drivers/char/epca.c:49:
>> drivers/char/digiFep1.h:7:1: warning: "GLOBAL" redefined
>> In file included from include/linux/linkage.h:5,
>>                  from include/linux/kernel.h:11,
>>                  from arch/x86/include/asm/system.h:10,
>>                  from arch/x86/include/asm/processor.h:17,
>>                  from include/linux/prefetch.h:14,
>>                  from include/linux/list.h:6,
>>                  from include/linux/module.h:9,
>>                  from drivers/char/epca.c:29:
>> arch/x86/include/asm/linkage.h:55:1: warning: this is the location of the
>> previous definition
>>
>> Probably introduced by commit 95695547a7db44b88a7ee36cf5df188de267e99e
>> ("x86: asm linkage - introduce GLOBAL macro") from the x86 tree.
>> --
>> Cheers,
>> Stephen Rothwell                    sfr@canb.auug.org.au
>> http://www.canb.auug.org.au/~sfr/
>>
>
> Thanks Stephen, i will take a look. Iirc the same macro used as well
> in ia64 arch, weird.
>

I've just checked the sources -- it seems some definitions in
arch/x86/include/asm/linkage.h  should be guarded by __ASSEMBLY__ (ie
-- __ALIGN, __ALIGN_STR and eventually GLOBAL). I'll make a patch
today evening (can't get access to linux machine right now). Ingo?

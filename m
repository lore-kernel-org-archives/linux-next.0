From: Dan Streetman <ddstreet@ieee.org>
Subject: Re: linux-next: Tree for Dec 16 (lib/842/842_decompress)
Date: Mon, 21 Dec 2015 12:12:08 -0500
Message-ID: <CALZtONCW9gwbGg_Yzb-QbcNq4bOajKjS8d4-XYz0sw5bFP0rQg@mail.gmail.com>
References: <20151216164343.0cb641ce@canb.auug.org.au> <5671C83C.7@infradead.org>
 <CALZtONAX=HeofcK1F1CPbiQONVubD-eQmZTNK+MGnO1qL2bnig@mail.gmail.com> <56742F8E.90803@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34100 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208AbbLURMs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Dec 2015 12:12:48 -0500
In-Reply-To: <56742F8E.90803@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Fri, Dec 18, 2015 at 11:08 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 12/18/15 06:32, Dan Streetman wrote:
>> On Wed, Dec 16, 2015 at 3:23 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
>>> On 12/15/15 21:43, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20151215:
>>>>
>>>> The drm-misc tree gained a conflict against Linus' tree.
>>>>
>>>> The i2c tree gained a build failure for which I applied a patch.
>>>>
>>>> The gpio tree gained a build failure so I used the version from
>>>> next-20151215.
>>>>
>>>
>>> on i386, when CONFIG_PRINTK is not enabled:
>>>
>>>
>>> ../lib/842/842_decompress.c: In function '__do_index':
>>> ../lib/842/842_decompress.c:205:2: error: implicit declaration of function 'no_printk' [-Werror=implicit-function-declaration]
>>>   pr_debug("index%x to %lx off %lx adjoff %lx tot %lx data %lx\n",
>>>   ^
>>
>> Hmm, it's not failing for me, can you send your config?
>
> Attached.
>
> FYI, I had 5 of these failures in 20 randconfig builds.

Heh, ok I figured it out, the pr_debug() uses a macro for one of its
params, which internally calls WARN, which then calls printk
again...in the case of no printk, that makes the macro no_printk() try
to recursively call no_printk()...

I'll remove the WARN so there's not a printk-inside-a-printk.

thanks!

>
>
> --
> ~Randy

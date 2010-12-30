From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build failure after merge of the final tree (input
 tree related)
Date: Thu, 30 Dec 2010 20:58:17 +0100
Message-ID: <AANLkTik3M2msXQA2Q--r492Oohph9cD7=JYBWx=vNzg-@mail.gmail.com>
References: <20101229125129.d48fb6fc.sfr@canb.auug.org.au>
	<20101229023457.GA4206@core.coreip.homeip.net>
	<20101230105130.5d27a82b.sfr@canb.auug.org.au>
	<AANLkTik38TzE_L_m8KpG-PmWGPeHjC8FYU=reRN8L7E5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:57864 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755041Ab0L3T6S convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Dec 2010 14:58:18 -0500
In-Reply-To: <AANLkTik38TzE_L_m8KpG-PmWGPeHjC8FYU=reRN8L7E5@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ping Cheng <pinglinux@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Dec 30, 2010 at 19:06, Ping Cheng <pinglinux@gmail.com> wrote:
> On Wed, Dec 29, 2010 at 3:51 PM, Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>> On Tue, 28 Dec 2010 18:34:58 -0800 Dmitry Torokhov <dmitry.torokhov@=
gmail.com> wrote:
>>> On Wed, Dec 29, 2010 at 12:51:29PM +1100, Stephen Rothwell wrote:
>>> > After merging the final tree, today's linux-next build (powerpc
>>> > allyesconfig) failed like this:
>>> >
>>> > drivers/input/touchscreen/wacom_w8001.c: In function 'w8001_setup=
':
>>> > drivers/input/touchscreen/wacom_w8001.c:287: error: implicit decl=
aration of function 'mdelay'
>>> >
>>> > Caused by commit b8fe15cb1b435928f9967d660e925fe7afb32787 ("Input=
:
>>> > wacom_w8001 - support pen or touch only devices"). =C2=A0See Rule=
 1 in
>>> > Documentation/SubmitChecklist.
>
> I do not see the error on my testing systems somehow. Does adding the
> following line resolve the issue?
>
> #include < include/linux/delay.h>

"#include <linux/delay.h>", I assume?

>>> > I have reverted that commit for today.
>>>
>>> Thank you Stephen, I'll fix this up in my tree.
>>
>> I note that this commit has been redone in your tree (as commit
>> 11a862ed9f04558e222fa15a5fbd76698fed11ff) but there have been no cha=
nges
>> to it at all (except the commit date).
>>
>> I have reverted that commit from today's linux-next.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds

From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] PTI implicit declaration fix.
Date: Mon, 11 Jul 2011 18:57:14 +0200
Message-ID: <CAMuHMdWnTn2FpsKo73NsLpDs=Pr_aM7fO01FzyU6xHuDbxLBAQ@mail.gmail.com>
References: <james_p_freyensee@linux.intel.com>
	<1310160851-26415-1-git-send-email-james_p_freyensee@linux.intel.com>
	<CAMuHMdV5OC6ENMK9uOXZBv3Z3MrOMiu0P6az5baM9jdRFwSAvA@mail.gmail.com>
	<4E1B208D.1000708@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:64758 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758096Ab1GKQ5Q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Jul 2011 12:57:16 -0400
In-Reply-To: <4E1B208D.1000708@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: J Freyensee <james_p_freyensee@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, randy.dunlap@oracle.com, sfr@canb.auug.org.au, christophe.guerard@intel.com, pranav.k.sanghadia@intel.com

On Mon, Jul 11, 2011 at 18:10, J Freyensee
<james_p_freyensee@linux.intel.com> wrote:
> On 07/09/2011 01:08 AM, Geert Uytterhoeven wrote:
>> On Fri, Jul 8, 2011 at 23:34,<james_p_freyensee@linux.intel.com> =C2=
=A0wrote:
>>>
>>> From: J Freyensee<james_p_freyensee@linux.intel.com>
>>>
>>> In a certain compile configuration, functions like
>>> 'kmalloc' and 'copy_from_user' were coming up as
>>> implicit errors. =C2=A0This patch adds slab.h and
>>> uaccess.h to the driver.
>>>
>>> Reported-by: Geert Uytterhoeven<geert@linux-m68k.org>
>>> Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>
>>
>> Please don't add "Acked-by" lines before people have ack'ed your pat=
ches.
>>
>
> Okay...so should I re-send this patch out without the Acked-by in it?=
 Or is
> it okay this time and next time please do this?

It's OK for now. It's a trivial patch anyway.

>>> Signed-off-by: J Freyensee<james_p_freyensee@linux.intel.com>
>>> ---
>>> =C2=A0drivers/misc/pti.c | =C2=A0 =C2=A02 ++
>>> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/drivers/misc/pti.c b/drivers/misc/pti.c
>>> index 8653bd0..4ba4e5f 100644
>>> --- a/drivers/misc/pti.c
>>> +++ b/drivers/misc/pti.c
>>> @@ -22,6 +22,8 @@
>>> =C2=A0*/
>>>
>>> =C2=A0#include<linux/init.h>
>>> +#include<linux/slab.h>
>>> +#include<linux/uaccess.h>
>>> =C2=A0#include<linux/sched.h>
>>> =C2=A0#include<linux/interrupt.h>
>>> =C2=A0#include<linux/console.h>

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

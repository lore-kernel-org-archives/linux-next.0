From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH -next] i2c: fix xiic build error
Date: Tue, 2 Mar 2010 21:36:40 +0100
Message-ID: <10f740e81003021236i662aa20fs7e092295f07aecd4@mail.gmail.com>
References: <20100204185736.6628ab9a.sfr@canb.auug.org.au>
	 <4B6B29DD.7060502@oracle.com> <4B7AC2A9.4070203@oracle.com>
	 <20100216173326.091c1c77@hyperion.delvare>
	 <4B7AC999.3060103@oracle.com> <4B82B28F.10104@oracle.com>
	 <10f740e81002221103h7408d52ajf5a67da39d6ae8dd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:48722 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751391Ab0CBUgm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2010 15:36:42 -0500
In-Reply-To: <10f740e81002221103h7408d52ajf5a67da39d6ae8dd@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: ben-linux@fluff.org, Jean Delvare <khali@linux-fr.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Feb 22, 2010 at 20:03, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> On Mon, Feb 22, 2010 at 17:36, Randy Dunlap <randy.dunlap@oracle.com>=
 wrote:
>> On 02/16/10 08:36, Randy Dunlap wrote:
>>> On 02/16/10 08:33, Jean Delvare wrote:
>>>> On Tue, 16 Feb 2010 08:07:05 -0800, Randy Dunlap wrote:
>>>>> On 02/04/10 12:11, Randy Dunlap wrote:
>>>>>
>>>>> This patch is still needed in linux-next-20100216.
>>>>
>>>> Nothing I can do about it, as the i2c-xiic driver is neither upstr=
eam
>>>> nor in my tree.
>>>
>>> Thanks, Jean.
>>>
>>> Next/merge.log tells me:
>>> Merge remote branch 'bjdooks-i2c/next-i2c'
>>>
>>> Ben??
>>>
>>
>> ping Ben.
>
> Yes, please. Thx!

Ping? This build problem is almost one month old now...

>> Here's the patch again.
>>
>> ---
>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> Add header file to fix build error:
>>
>> drivers/i2c/busses/i2c-xiic.c:493: error: implicit declaration of fu=
nction 'mdelay'
>>
>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
>> Cc: "Ben Dooks (embedded platforms)" <ben-linux@fluff.org>
>> Cc: linux-i2c@vger.kernel.org
>> ---
>> =C2=A0drivers/i2c/busses/i2c-xiic.c | =C2=A0 =C2=A01 +
>> =C2=A01 file changed, 1 insertion(+)
>>
>> --- linux-next-20100204.orig/drivers/i2c/busses/i2c-xiic.c
>> +++ linux-next-20100204/drivers/i2c/busses/i2c-xiic.c
>> @@ -31,6 +31,7 @@
>> =C2=A0#include <linux/module.h>
>> =C2=A0#include <linux/init.h>
>> =C2=A0#include <linux/errno.h>
>> +#include <linux/delay.h>
>> =C2=A0#include <linux/platform_device.h>
>> =C2=A0#include <linux/i2c.h>
>> =C2=A0#include <linux/interrupt.h>

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

From: Ping Cheng <pinglinux@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree (input
 tree related)
Date: Thu, 30 Dec 2010 10:06:46 -0800
Message-ID: <AANLkTik38TzE_L_m8KpG-PmWGPeHjC8FYU=reRN8L7E5@mail.gmail.com>
References: <20101229125129.d48fb6fc.sfr@canb.auug.org.au>
	<20101229023457.GA4206@core.coreip.homeip.net>
	<20101230105130.5d27a82b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:35317 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754861Ab0L3SGt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Dec 2010 13:06:49 -0500
In-Reply-To: <20101230105130.5d27a82b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 29, 2010 at 3:51 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Dmitry,
>
> On Tue, 28 Dec 2010 18:34:58 -0800 Dmitry Torokhov <dmitry.torokhov@g=
mail.com> wrote:
>>
>> On Wed, Dec 29, 2010 at 12:51:29PM +1100, Stephen Rothwell wrote:
>> >
>> > After merging the final tree, today's linux-next build (powerpc
>> > allyesconfig) failed like this:
>> >
>> > drivers/input/touchscreen/wacom_w8001.c: In function 'w8001_setup'=
:
>> > drivers/input/touchscreen/wacom_w8001.c:287: error: implicit decla=
ration of function 'mdelay'
>> >
>> > Caused by commit b8fe15cb1b435928f9967d660e925fe7afb32787 ("Input:
>> > wacom_w8001 - support pen or touch only devices"). =A0See Rule 1 i=
n
>> > Documentation/SubmitChecklist.

I do not see the error on my testing systems somehow. Does adding the
following line resolve the issue?

#include < include/linux/delay.h>

Ping

>> > I have reverted that commit for today.
>>
>> Thank you Stephen, I'll fix this up in my tree.
>
> I note that this commit has been redone in your tree (as commit
> 11a862ed9f04558e222fa15a5fbd76698fed11ff) but there have been no chan=
ges
> to it at all (except the commit date).
>
> I have reverted that commit from today's linux-next.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>

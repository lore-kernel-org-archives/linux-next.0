From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Related build errors (was: use ext2_find_next_bit)
Date: Sun, 28 Feb 2010 11:07:44 +0100
Message-ID: <10f740e81002280207x67b0109dyc889f227fa51bfaa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:41023 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031648Ab0B1KHp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 28 Feb 2010 05:07:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>

On Sun, Feb 28, 2010 at 11:04, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Feb 25, 2010 at 15:29, Akinobu Mita <akinobu.mita@gmail.com> wrote:
>> 2010/2/25 Geert Uytterhoeven <geert@linux-m68k.org>:
>>> On Thu, Feb 25, 2010 at 02:38, Akinobu Mita <akinobu.mita@gmail.com> wrote:
>>>> 2010/2/25 Jan Kara <jack@suse.cz>:
>>>>> On Tue 23-02-10 23:11:13, Akinobu Mita wrote:
>>>>>> Use ext2_find_next_bit (generic_find_next_le_bit) to find the set bit
>>>>>> in little endian bitmap region.
>>>
>>> Is any of this in linux-next now?
>>>
>>> http://kisskb.ellerman.id.au/kisskb/buildresult/2208481/
>>> | fs/udf/balloc.c:274: error: implicit declaration of function
>>> 'generic_find_next_le_bit'
>>
>> Yep, Jan's patch caused the build breakage.
>>
>> Because generic_find_next_le_bit() is not available for all
>> archtectures. So we should use ext2_find_next_bit() here.
>
> Most architectures use the definitions in asm-generic, so they're OK.
> M68k doesn't. S390 is also affected, and I think arm as well (but there's no
> arm all-modconfig build in linux-next, so I'm not 100% sure).

Which brings me to another question. In the past, I wondered several times
whether a build error happened on other architectures as well.
Going through all failed logs manually is a bit tedious.
So would it be possible to have some method to find related build errors
on different configs/architectures? E.g. a scoreboard with the most popular
build errors/compiler warnings and links to the affected configs?

Thx again for the great linux-next work!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

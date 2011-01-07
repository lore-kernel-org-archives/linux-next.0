From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Fri, 7 Jan 2011 14:19:33 +0100
Message-ID: <AANLkTimpVMLGBnP33Ro8MBtW3GJjskg0bBK717Xf-Mh_@mail.gmail.com>
References: <20110107110513.30776114.sfr@canb.auug.org.au>
	<4D26C179.7030704@kernel.dk>
	<AANLkTinyaZfsYv43046LWgu8U3kg6_79y+PTFO1RxtnY@mail.gmail.com>
	<20110107231748.76170ff3.sfr@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:64807 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752629Ab1AGNTe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Jan 2011 08:19:34 -0500
In-Reply-To: <20110107231748.76170ff3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 7, 2011 at 1:17 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi All,
>
> On Fri, 7 Jan 2011 11:52:08 +0100 Sedat Dilek <sedat.dilek@googlemail=
=2Ecom> wrote:
>>
>> JFYI:
>> I pulled in patches from linux-2.6-block#for-next (up to commit
>> 6573422f81efa3bd71848dc584c35d4318d3de0b):
>> "Merge branch 'for-2.6.38/core' into for-next"
>> ...into linux-next (next-20110107) and now I get:
>>
>> $ grep block build_linux-next_next20110107.dileks.2.log
>> 30886 blocks
>> =C2=A0 CC =C2=A0 =C2=A0 =C2=A0fs/block_dev.o
>> =C2=A0 CC =C2=A0 =C2=A0 =C2=A0mm/memblock.o
>> =C2=A0 CC =C2=A0 =C2=A0 =C2=A0kernel/power/block_io.o
>> /home/sd/src/linux-2.6/linux-2.6.37/debian/build/source_i386_none/ke=
rnel/trace/blktrace.c:999:2:
>> warning: passing argument 1 of =E2=80=98register_trace_block_bio_com=
plete=E2=80=99
>> from incompatible pointer type
>> /home/sd/src/linux-2.6/linux-2.6.37/debian/build/source_i386_none/in=
clude/trace/events/block.h:240:1:
>> note: expected =E2=80=98void (*)(void *, struct request_queue *, str=
uct bio *,
>> int)=E2=80=99 but argument is of type =E2=80=98void (*)(void *, stru=
ct request_queue
>> *, struct bio *)=E2=80=99
>> /home/sd/src/linux-2.6/linux-2.6.37/debian/build/source_i386_none/ke=
rnel/trace/blktrace.c:1038:2:
>> warning: passing argument 1 of =E2=80=98unregister_trace_block_bio_c=
omplete=E2=80=99
>> from incompatible pointer type
>> /home/sd/src/linux-2.6/linux-2.6.37/debian/build/source_i386_none/in=
clude/trace/events/block.h:240:1:
>> note: expected =E2=80=98void (*)(void *, struct request_queue *, str=
uct bio *,
>> int)=E2=80=99 but argument is of type =E2=80=98void (*)(void *, stru=
ct request_queue
>> *, struct bio *)=E2=80=99
>
> I reported that separately today and Mathieu Desnoyers (cc'd) has sai=
d
> that he will supply a patch.
>
> --
> Cheers,
> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>

Hmm, I have pulled-in freshly from linux-2.6-block#for-next after you
published latest linux-next (next-20110107).
So, I guessed the (reported) issue is fixed, now.

- Sedat -

[1] http://git.kernel.org/?p=3Dlinux/kernel/git/axboe/linux-2.6-block.g=
it;a=3Dcommit;h=3Db7908c1035af7652cd613991b54dbff9c8b6bd3a

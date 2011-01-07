From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Fri, 7 Jan 2011 11:52:08 +0100
Message-ID: <AANLkTinyaZfsYv43046LWgu8U3kg6_79y+PTFO1RxtnY@mail.gmail.com>
References: <20110107110513.30776114.sfr@canb.auug.org.au>
	<4D26C179.7030704@kernel.dk>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:55012 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751385Ab1AGKwJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Jan 2011 05:52:09 -0500
In-Reply-To: <4D26C179.7030704@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 7, 2011 at 8:32 AM, Jens Axboe <axboe@kernel.dk> wrote:
> On 2011-01-07 01:05, Stephen Rothwell wrote:
>> Hi Jens,
>>
>> After merging the block tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> arch/powerpc/platforms/built-in.o: In function `.pmf_get_function':
>> (.text+0x723c): undefined reference to `.kref_get'
>> arch/powerpc/platforms/built-in.o: In function `.pmf_unregister_driv=
er':
>> (.text+0x72c8): undefined reference to `.kref_get'
>> arch/powerpc/platforms/built-in.o: In function `.pmf_do_functions':
>> (.text+0x793c): undefined reference to `.kref_get'
>> arch/powerpc/platforms/built-in.o: In function `.__pmf_find_function=
':
>> (.text+0x7c80): undefined reference to `.kref_get'
>> arch/powerpc/platforms/built-in.o: In function `.pmf_register_driver=
':
>> (.text+0x8044): undefined reference to `.kref_get'
>> arch/powerpc/platforms/built-in.o:(.text+0x8310): more undefined ref=
erences to `.kref_get' follow
>> lib/lib.a(kref.o):(__ksymtab+0x10): undefined reference to `kref_get=
'
>> drivers/built-in.o: In function `.get_current_tty':
>> (.text+0x60970): undefined reference to `.kref_get'
>> drivers/built-in.o: In function `.__proc_set_tty':
>> tty_io.c:(.text+0x61624): undefined reference to `.kref_get'
>> drivers/built-in.o: In function `.tty_init_dev':
>> (.text+0x64d2c): undefined reference to `.kref_get'
>> drivers/built-in.o: In function `.tty_open':
>> tty_io.c:(.text+0x64ee4): undefined reference to `.kref_get'
>> tty_io.c:(.text+0x64f20): undefined reference to `.kref_get'
>> drivers/built-in.o:tty_io.c:(.text+0x64f58): more undefined referenc=
es to `.kref_get' follow
>>
>> Caused by commit 15454034cb3021d8bb9d21b4f35072a809197fdd ("block: a=
dd
>> internal hd part table references") which removes kref_get() instead=
 of
>> kref_test_and_get()!
>>
>> This really wasn't tested, right?
>
> Irk, it was tested and booted, but apparently I merged the first bad
> version of the patch.
>
>> I have used the block tree from next-20110106 for today.
>
> Thanks, I'll get this fixed up now.
>
>
> --
> Jens Axboe
>

JFYI:
I pulled in patches from linux-2.6-block#for-next (up to commit
6573422f81efa3bd71848dc584c35d4318d3de0b):
"Merge branch 'for-2.6.38/core' into for-next"
=2E..into linux-next (next-20110107) and now I get:

$ grep block build_linux-next_next20110107.dileks.2.log
30886 blocks
  CC      fs/block_dev.o
  CC      mm/memblock.o
  CC      kernel/power/block_io.o
/home/sd/src/linux-2.6/linux-2.6.37/debian/build/source_i386_none/kerne=
l/trace/blktrace.c:999:2:
warning: passing argument 1 of =E2=80=98register_trace_block_bio_comple=
te=E2=80=99
from incompatible pointer type
/home/sd/src/linux-2.6/linux-2.6.37/debian/build/source_i386_none/inclu=
de/trace/events/block.h:240:1:
note: expected =E2=80=98void (*)(void *, struct request_queue *, struct=
 bio *,
int)=E2=80=99 but argument is of type =E2=80=98void (*)(void *, struct =
request_queue
*, struct bio *)=E2=80=99
/home/sd/src/linux-2.6/linux-2.6.37/debian/build/source_i386_none/kerne=
l/trace/blktrace.c:1038:2:
warning: passing argument 1 of =E2=80=98unregister_trace_block_bio_comp=
lete=E2=80=99
from incompatible pointer type
/home/sd/src/linux-2.6/linux-2.6.37/debian/build/source_i386_none/inclu=
de/trace/events/block.h:240:1:
note: expected =E2=80=98void (*)(void *, struct request_queue *, struct=
 bio *,
int)=E2=80=99 but argument is of type =E2=80=98void (*)(void *, struct =
request_queue
*, struct bio *)=E2=80=99
  CC      arch/x86/mm/memblock.o
  CC      block/elevator.o
  CC      block/blk-core.o
  CC      block/blk-tag.o
  CC      block/blk-sysfs.o
  CC      block/blk-flush.o
  CC      block/blk-settings.o
  CC      block/blk-ioc.o
  CC      block/blk-map.o
  CC      block/blk-exec.o
  CC      block/blk-merge.o
  CC      block/blk-softirq.o
  CC      block/blk-timeout.o
  CC      block/blk-iopoll.o
  CC      block/blk-lib.o
  CC      block/ioctl.o
  CC      block/genhd.o
  CC      block/scsi_ioctl.o
  CC      block/bsg.o
  CC      block/blk-cgroup.o
  CC      block/noop-iosched.o
  CC      block/deadline-iosched.o
  CC      block/cfq-iosched.o
  CC      block/blk-integrity.o
  LD      block/built-in.o

- Sedat -

From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for Oct 25 (block ?)
Date: Tue, 25 Oct 2011 16:03:44 +0200
Message-ID: <CA+icZUXnW6s-rXhX3USET-_RSbtQNH_3DLHPydPSgNhX8b7uqw@mail.gmail.com>
References: <CA+icZUVe7DrbrbDB7wJWrT9FHUsV62UFdifWbe3MGL7ujkX5Vw@mail.gmail.com>
	<CA+icZUUO3rxx4OFBNbHm4J3BFH66HBDY2LXC6-r2WY8ioo+8Dg@mail.gmail.com>
	<4EA6BBC2.2060406@kernel.dk>
	<CA+icZUUYcdS5C5DL3RnSbkWWu4hVuq4ecy5u1+0QLwEuSzJMeg@mail.gmail.com>
	<4EA6BFC4.3040905@kernel.dk>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:48586 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755132Ab1JYODp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Oct 2011 10:03:45 -0400
In-Reply-To: <4EA6BFC4.3040905@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

On Tue, Oct 25, 2011 at 3:55 PM, Jens Axboe <axboe@kernel.dk> wrote:
> On 2011-10-25 15:43, Sedat Dilek wrote:
>> On Tue, Oct 25, 2011 at 3:38 PM, Jens Axboe <axboe@kernel.dk> wrote:
>>> On 2011-10-25 15:10, Sedat Dilek wrote:
>>>> On Tue, Oct 25, 2011 at 3:04 PM, Sedat Dilek <sedat.dilek@googlema=
il.com> wrote:
>>>>> On Tue, Oct 25, 2011 at 11:36 AM, Stephen Rothwell <sfr@canb.auug=
=2Eorg.au> wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> *Note well*
>>>>>>
>>>>>> This tree has nate had any build testing at all. =C2=A0As such, =
it probably
>>>>>> doesn't build :-) This tree is really just a roll up of the curr=
ent state
>>>>>> of the trees when the v3.2 merge window opened. =C2=A0It will no=
t be put into
>>>>>> the build system referred to below.
>>>>>>
>>>>>
>>>>> I have generated a single linux-next (next-20111025) patch on top=
 of
>>>>> v3.1, it's approx. 100M!
>>>>>
>>>>> $ du -h patch-v3.1-next-20111025.patch
>>>>> 96M =C2=A0 =C2=A0 patch-v3.1-next-20111025.patch
>>>>>
>>>>> I noticed this build-failure:
>>>>>
>>>>> =C2=A0CC =C2=A0 =C2=A0 =C2=A0block/blk-throttle.o
>>>>> =C2=A0CC [M] =C2=A0fs/fuse/dir.o
>>>>> /mnt/sdb3/linux-kernel/linux-3.1/debian/build/source_i386_none/bl=
ock/blk-throttle.c:
>>>>> In function 'blk_throtl_drain':
>>>>> /mnt/sdb3/linux-kernel/linux-3.1/debian/build/source_i386_none/bl=
ock/blk-throttle.c:1221:2:
>>>>> error: implicit declaration of function 'lockdep_is_held'
>>>>> [-Werror=3Dimplicit-function-declaration]
>>>>> cc1: some warnings being treated as errors
>>>>>
>>>>> make[5]: *** [block/blk-throttle.o] Error 1
>>>>> make[4]: *** [block] Error 2
>>>>>
>>>>> This happens with Debian's gcc-4.6 (4.6.1-16) and default
>>>>> KBUILD_ENABLE_EXTRA_GCC_CHECKS value.
>>>>>
>>>>> - Sedat -
>>>>>
>>>>
>>>> Looks like "#include <linux/lockdep.h>" is missing in block/blk-th=
rottle.c?
>>>
>>> Hmm, I wonder why it isn't triggering for cfq-iosched.o or elevator=
=2Eo as
>>> well. Is blk-throttle modular? What is your .config?
>>>
>>> --
>>> Jens Axboe
>>>
>>>
>>
>> CONFIG_BLK_DEV_THROTTLING=3Dy
>>
>> My kernel-config is attached.
>
> The below should work, I checked it in.
>
>
> commit 334c2b0b8b2ab186fa198413386cba41fffcb4f2
> Author: Jens Axboe <axboe@kernel.dk>
> Date: =C2=A0 Tue Oct 25 15:51:48 2011 +0200
>
> =C2=A0 =C2=A0blk-throttle: use queue_is_locked() instead of lockdep_i=
s_held()
>
> =C2=A0 =C2=A0We can't use the latter if !CONFIG_LOCKDEP.
>
> =C2=A0 =C2=A0Reported-by: Sedat Dilek <sedat.dilek@googlemail.com>
> =C2=A0 =C2=A0Signed-off-by: Jens Axboe <axboe@kernel.dk>
>
> diff --git a/block/blk-throttle.c b/block/blk-throttle.c
> index 8edb949..4553245 100644
> --- a/block/blk-throttle.c
> +++ b/block/blk-throttle.c
> @@ -1218,7 +1218,7 @@ void blk_throtl_drain(struct request_queue *q)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct bio_list bl;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct bio *bio;
>
> - =C2=A0 =C2=A0 =C2=A0 lockdep_is_held(q->queue_lock);
> + =C2=A0 =C2=A0 =C2=A0 WARN_ON_ONCE(!queue_is_locked(q));
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bio_list_init(&bl);
>
>
> --
> Jens Axboe
>
>

Hi Jens,

Thanks for the explanations and the quick fix!

Continued with 'make':
=2E..
  CC      block/blk-throttle.o
  CC      block/noop-iosched.o
  CC      block/deadline-iosched.o
  CC      block/cfq-iosched.o
  CC      block/blk-integrity.o
  LD      block/built-in.o
=2E..

=46eel free to add:

    Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -

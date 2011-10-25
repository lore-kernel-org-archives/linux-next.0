From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for Oct 25 (block ?)
Date: Tue, 25 Oct 2011 15:10:55 +0200
Message-ID: <CA+icZUUO3rxx4OFBNbHm4J3BFH66HBDY2LXC6-r2WY8ioo+8Dg@mail.gmail.com>
References: <CA+icZUVe7DrbrbDB7wJWrT9FHUsV62UFdifWbe3MGL7ujkX5Vw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:45736 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756355Ab1JYNK4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Oct 2011 09:10:56 -0400
In-Reply-To: <CA+icZUVe7DrbrbDB7wJWrT9FHUsV62UFdifWbe3MGL7ujkX5Vw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>

On Tue, Oct 25, 2011 at 3:04 PM, Sedat Dilek <sedat.dilek@googlemail.co=
m> wrote:
> On Tue, Oct 25, 2011 at 11:36 AM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>> Hi all,
>>
>> *Note well*
>>
>> This tree has nate had any build testing at all. =C2=A0As such, it p=
robably
>> doesn't build :-) This tree is really just a roll up of the current =
state
>> of the trees when the v3.2 merge window opened. =C2=A0It will not be=
 put into
>> the build system referred to below.
>>
>
> I have generated a single linux-next (next-20111025) patch on top of
> v3.1, it's approx. 100M!
>
> $ du -h patch-v3.1-next-20111025.patch
> 96M =C2=A0 =C2=A0 patch-v3.1-next-20111025.patch
>
> I noticed this build-failure:
>
> =C2=A0CC =C2=A0 =C2=A0 =C2=A0block/blk-throttle.o
> =C2=A0CC [M] =C2=A0fs/fuse/dir.o
> /mnt/sdb3/linux-kernel/linux-3.1/debian/build/source_i386_none/block/=
blk-throttle.c:
> In function 'blk_throtl_drain':
> /mnt/sdb3/linux-kernel/linux-3.1/debian/build/source_i386_none/block/=
blk-throttle.c:1221:2:
> error: implicit declaration of function 'lockdep_is_held'
> [-Werror=3Dimplicit-function-declaration]
> cc1: some warnings being treated as errors
>
> make[5]: *** [block/blk-throttle.o] Error 1
> make[4]: *** [block] Error 2
>
> This happens with Debian's gcc-4.6 (4.6.1-16) and default
> KBUILD_ENABLE_EXTRA_GCC_CHECKS value.
>
> - Sedat -
>

Looks like "#include <linux/lockdep.h>" is missing in block/blk-throttl=
e.c?

- Sedat -

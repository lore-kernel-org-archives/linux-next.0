From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for Oct 25 (block ?)
Date: Tue, 25 Oct 2011 15:04:53 +0200
Message-ID: <CA+icZUVe7DrbrbDB7wJWrT9FHUsV62UFdifWbe3MGL7ujkX5Vw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:55539 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933213Ab1JYNEy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Oct 2011 09:04:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>

On Tue, Oct 25, 2011 at 11:36 AM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> Hi all,
>
> *Note well*
>
> This tree has nate had any build testing at all. =C2=A0As such, it pr=
obably
> doesn't build :-) This tree is really just a roll up of the current s=
tate
> of the trees when the v3.2 merge window opened. =C2=A0It will not be =
put into
> the build system referred to below.
>

I have generated a single linux-next (next-20111025) patch on top of
v3.1, it's approx. 100M!

$ du -h patch-v3.1-next-20111025.patch
96M     patch-v3.1-next-20111025.patch

I noticed this build-failure:

  CC      block/blk-throttle.o
  CC [M]  fs/fuse/dir.o
/mnt/sdb3/linux-kernel/linux-3.1/debian/build/source_i386_none/block/bl=
k-throttle.c:
In function 'blk_throtl_drain':
/mnt/sdb3/linux-kernel/linux-3.1/debian/build/source_i386_none/block/bl=
k-throttle.c:1221:2:
error: implicit declaration of function 'lockdep_is_held'
[-Werror=3Dimplicit-function-declaration]
cc1: some warnings being treated as errors

make[5]: *** [block/blk-throttle.o] Error 1
make[4]: *** [block] Error 2

This happens with Debian's gcc-4.6 (4.6.1-16) and default
KBUILD_ENABLE_EXTRA_GCC_CHECKS value.

- Sedat -

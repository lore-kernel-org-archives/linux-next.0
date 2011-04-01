From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for April 1 [BROKEN ubifs when CONFIG_DEBUG_SECTION_MISMATCH=y]
Date: Fri, 1 Apr 2011 17:55:52 +0200
Message-ID: <AANLkTi=td3J2duwv9RuXJHquA6=wRRq8vWLkJY97xtP9@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:60894 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752508Ab1DAPzx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Apr 2011 11:55:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Apr 1, 2011 at 5:25 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Changes since 20110331:
>
> Dropped tree: xen
>
> The sparc-current tree lost its build failure.
>
> The gfs2 tree gained a conflict against Linus' tree.
>
> The tip tree gained a build failure (due to a change in the bjdooks-i2c
> tree) for which I applied a patch.
>

With CONFIG_DEBUG_SECTION_MISMATCH=y set, I see in my build.log:
...
MODPOST 2742 modules
...
ERROR: "empty_aops" [fs/ubifs/ubifs.ko] undefined!
make[5]: *** [__modpost] Error 1
make[4]: *** [modules] Error 2
make[3]: *** [sub-make] Error 2
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/sd/src/linux-2.6/linux-2.6.39-rc1/debian/build/build_i386_none_686-iniza'

- Sedat -

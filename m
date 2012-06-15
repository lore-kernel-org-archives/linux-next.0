From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: build failure in Linus' tree
Date: Fri, 15 Jun 2012 12:15:15 +0200
Message-ID: <CA+icZUUxEgdZ6iKz-eg9ztaxaJx_bmWDmuxpnqLXMYLbBO6cDQ@mail.gmail.com>
References: <20120614114722.0fd16fb906b6a5503cfbc51a@canb.auug.org.au>
	<20120614030606.GC27673@linux-sh.org>
	<20120614034036.GE27673@linux-sh.org>
	<20120615101407.369c754da872e18c854ab481@canb.auug.org.au>
	<CA+icZUURfHZwcrVxgy+co+crKFOOT+Pp_EMR9PRTr8vXYU-sEA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:55771 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127Ab2FOKPQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jun 2012 06:15:16 -0400
In-Reply-To: <CA+icZUURfHZwcrVxgy+co+crKFOOT+Pp_EMR9PRTr8vXYU-sEA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mundt <lethal@linux-sh.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>

On Fri, Jun 15, 2012 at 11:23 AM, Sedat Dilek
<sedat.dilek@googlemail.com> wrote:
> On Fri, Jun 15, 2012 at 2:14 AM, Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>> Hi Paul,
>>
>> On Thu, 14 Jun 2012 12:40:36 +0900 Paul Mundt <lethal@linux-sh.org> =
wrote:
>>>
>>> (adding Arnd to Cc, who I forgot to include previously)
>>>
>>> On Thu, Jun 14, 2012 at 12:06:06PM +0900, Paul Mundt wrote:
>>> > On Thu, Jun 14, 2012 at 11:47:22AM +1000, Stephen Rothwell wrote:
>>> > > While building Linus' tree, today's linux-next build (powerpc
>>> > > ppc64_defconfig) failed like this:
>>> > >
>>> > > In file included from include/asm-generic/bug.h:5:0,
>>> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
rom arch/powerpc/include/asm/bug.h:127,
>>> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
rom arch/powerpc/kernel/head_64.S:31:
>>> > > include/linux/kernel.h:44:0: warning: "ALIGN" redefined [enable=
d by default]
>>> > > include/linux/linkage.h:57:0: note: this is the location of the=
 previous definition
>>> > > include/linux/sysinfo.h: Assembler messages:
>>> > > include/linux/sysinfo.h:7: Error: Unrecognized opcode: `struct'
>>> > > include/linux/sysinfo.h:8: Error: Unrecognized opcode: `__kerne=
l_long_t'
>>> > >
>>> > > And it went downhill from there :-(
>>> > >
>>> > > Caused by commit 3777808873b0 ("bug.h: need linux/kernel.h for
>>> > > TAINT_WARN") which, unfortunately never made it into linux-next=
=2E
>>> > >
>>> > > I have reverted that commit for today (which presumably means t=
hat sh
>>> > > builds will be broken again).
>>> >
>>> > I'm still unsure as to the best way to fix this, and there was no
>>> > response to the original mail I posted about it either:
>>> >
>>> > http://marc.info/?l=3Dlinux-kernel&m=3D133879579014853&w=3D2
>>> >
>>> > I'll fetch a powerpc cross compiler and see if I can figure out w=
hat went
>>> > wrong.
>>> >
>>> Ok, it's because the asm-generic/bug.h __ASSEMBLY__ guarding is
>>> completely bogus. This should hopefully fix it once and for all.
>>> Sorry for the trouble.
>>>
>>> Signed-off-by: Paul Mundt <lethal@linux-sh.org>
>>
>> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>
>> Can you create a proper commit message and send this to Linus, pleas=
e? =C2=A0I
>> have included it in my fixes tree in linux-next for today.
>>
>
> Reference: commit 2a6f7f6bd7a9eb3c835c7e5a7d51b43675fb3881 ("fix
> bug.h's inclusion of kernel.h")
>

Hope people don't treat this as nitpicking:
I looked through the last commits to the involved file, all commits
are labeled with "bug.h: ...", so follow the "rule"...

"bug.h: Fix inclusion of kernel.h"

> - Sedat -
>
> [1] http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=
=3Dcommitdiff;h=3D2a6f7f6bd7a9eb3c835c7e5a7d51b43675fb3881
>
>> --
>> Cheers,
>> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au

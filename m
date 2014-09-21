From: Helge Deller <deller@gmx.de>
Subject: Re: linux-next: Tree for Sep 19
Date: Sun, 21 Sep 2014 21:43:46 +0200
Message-ID: <541F2A72.8030007@gmx.de>
References: <20140919165817.225eb8b8@canb.auug.org.au> <20140919191514.GA5358@roeck-us.net> <541DD754.4040000@gmx.de> <541DEB33.2070508@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:61020 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751374AbaIUTn6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Sep 2014 15:43:58 -0400
In-Reply-To: <541DEB33.2070508@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

Hi G=FCnter,

On 09/20/2014 11:01 PM, Guenter Roeck wrote:
> On 09/20/2014 12:36 PM, Helge Deller wrote:
>> Hi G=FCnter,
>>
>> On 09/19/2014 09:15 PM, Guenter Roeck wrote:
>>> On Fri, Sep 19, 2014 at 04:58:17PM +1000, Stephen Rothwell wrote:
>>>> Changes since 20140917:
>>>>
>>>> The fsl tree still had its build failure so I used the version fro=
m
>>>> next-20140917.
>>>>
>>>> The v4l-dvb tree lost its build failure.
>>>>
>>>> The security tree gained a conflict against the file-locks tree.
>>>>
>>>> Non-merge commits (relative to Linus' tree): 6014
>>>>   5488 files changed, 217522 insertions(+), 129375 deletions(-)
>>>>
>>>> ------------------------------------------------------------------=
----------
>>>>
>>>
>>> parisc:defconfig, parisc:generic-32bit_defconfig:
>>>
>>> --------------
>>> Error log:
>>> arch/parisc/kernel/ptrace.c: In function 'do_syscall_trace_enter':
>>> arch/parisc/kernel/ptrace.c:274:2: error: implicit declaration of f=
unction
>>> 'secure_computing' [-Werror=3Dimplicit-function-declaration]
>>> cc1: some warnings being treated as errors
>>> make[1]: *** [arch/parisc/kernel/ptrace.o] Error 1
>>>
>>> Bisect points to commit 273299fb6380 ('Merge branch 'x86/seccomp') =
which
>>> obviously doesn't help much. Suspected culprit is c90f06943e05 ('pa=
risc: Wire up
>>> seccomp, getrandom and memfd_create syscalls') which seems to be mi=
ssing an
>>> include file.
>
>> I've added this patch to my for-next tree:
>> http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/=
commit/?h=3Dfor-next&id=3D0f18557b017b3469e1f8edf5cf34c1cba856fdbe
>
> That doesn't solve the problem for me, most likely because
> HAVE_ARCH_SECCOMP_FILTER is not set for parisc in next-20140919.
> This is what seccomp.h does with it:
>
> #ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
> static inline int secure_computing(void) { return 0; }
> #else
> static inline void secure_computing_strict(int this_syscall) { return=
; }
> #endif
>
> You don't have this flag in your tree. It was introduced in -next wit=
h
> commit 'seccomp,x86,arm,mips,s390: Remove nr parameter from secure_co=
mputing'.

Thanks for the hint!
Since parisc currently only supports the strict mode, I've changed the =
code
to call secure_computing_strict() instead of secure_computing() with th=
is commit in my for-next tree:
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/com=
mit/?h=3Dfor-next&id=3Dfe5c873459a973e59854bd235a7e6b3eaa8e5fe0

It now builds cleanly with the next-20140919 tree.

Thanks!
Helge

From: Helge Deller <deller@gmx.de>
Subject: Re: linux-next: Tree for Sep 19
Date: Sat, 20 Sep 2014 21:36:52 +0200
Message-ID: <541DD754.4040000@gmx.de>
References: <20140919165817.225eb8b8@canb.auug.org.au> <20140919191514.GA5358@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:61012 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754691AbaITThG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Sep 2014 15:37:06 -0400
In-Reply-To: <20140919191514.GA5358@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

Hi G=FCnter,

On 09/19/2014 09:15 PM, Guenter Roeck wrote:
> On Fri, Sep 19, 2014 at 04:58:17PM +1000, Stephen Rothwell wrote:
>> Changes since 20140917:
>>
>> The fsl tree still had its build failure so I used the version from
>> next-20140917.
>>
>> The v4l-dvb tree lost its build failure.
>>
>> The security tree gained a conflict against the file-locks tree.
>>
>> Non-merge commits (relative to Linus' tree): 6014
>>   5488 files changed, 217522 insertions(+), 129375 deletions(-)
>>
>> --------------------------------------------------------------------=
--------
>>
>
> parisc:defconfig, parisc:generic-32bit_defconfig:
>
> --------------
> Error log:
> arch/parisc/kernel/ptrace.c: In function 'do_syscall_trace_enter':
> arch/parisc/kernel/ptrace.c:274:2: error: implicit declaration of fun=
ction
> 'secure_computing' [-Werror=3Dimplicit-function-declaration]
> cc1: some warnings being treated as errors
> make[1]: *** [arch/parisc/kernel/ptrace.o] Error 1
>
> Bisect points to commit 273299fb6380 ('Merge branch 'x86/seccomp') wh=
ich
> obviously doesn't help much. Suspected culprit is c90f06943e05 ('pari=
sc: Wire up
> seccomp, getrandom and memfd_create syscalls') which seems to be miss=
ing an
> include file.

I could not reproduce this error with current git head.

Nevertheless, it probably makes sense to #include <linux/seccomp.h> in =
ptrace.c to
avoid a dependency on other header files to include it instead.
I've added this patch to my for-next tree:
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/com=
mit/?h=3Dfor-next&id=3D0f18557b017b3469e1f8edf5cf34c1cba856fdbe

Could you try again?

Helge

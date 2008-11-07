From: "stephane eranian" <eranian@googlemail.com>
Subject: Re: linux-next: perfmon3 tree build failure
Date: Fri, 7 Nov 2008 14:16:32 +0100
Message-ID: <7c86c4470811070516x21e7f77fk1129db02e2237fc4@mail.gmail.com>
References: <20081107200336.57abfca7.sfr@canb.auug.org.au>
Reply-To: eranian@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.191]:14033 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751019AbYKGNQf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Nov 2008 08:16:35 -0500
Received: by mu-out-0910.google.com with SMTP id g7so1190619muf.1
        for <linux-next@vger.kernel.org>; Fri, 07 Nov 2008 05:16:33 -0800 (PST)
In-Reply-To: <20081107200336.57abfca7.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Stephen,

All problems have been fixed in my linux-next tree.

For sched.h, it is a bit more complicated because of Itanium.
On Itanium, there is an older version of perfmon called v2.0. It used
to use CONFIG_PERFMON but that clashed with new perfmon also
using the same macro. So my first patch renamed CONFIG_PERFMON
into CONFIG_PERFMON_V20 for Itanium. In sched.h however, the pfm_context
field is used by both the legacy Itanium v2.0 and new perfmon. The fix is
to add this field if either CONFIG_PERFMON or CONFIG_PERFMON_V20
is set.

I also made the changes for fsuid and fsgid.

Just pull from my linux-next tree again.

Thanks.


On Fri, Nov 7, 2008 at 10:03 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Stephane,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> In file included from arch/x86/perfmon/perfmon.c:26:
> include/linux/perfmon_kern.h: In function 'pfm_exit_thread':
> include/linux/perfmon_kern.h:200: error: 'struct task_struct' has no member named 'pfm_context'
>
> and lots more.  Caused by commit 46b4dfdc1dd4976d892fa47b5e8a2551fe6278fa
> ("perfmon(ia64): rename CONFIG_PERFMON to CONFIG_PERFMON_V20") which
> probably should not have renamed CONFIG_PERFMON to CONFIG_PERFMON_V20 in
> sched.h.
>
> I would suggest that you clean this up by rebasing your tree onto Linus'
> latest (to fix the merge conflicts) and in the process, do the
> CONFIG_PERFMON rename patch first ...
>
> I also got these errors:
>
> perfmon/perfmon_file.c: In function 'pfm_alloc_fd':
> perfmon/perfmon_file.c:270: error: 'struct task_struct' has no member named 'fsuid'
> perfmon/perfmon_file.c:271: error: 'struct task_struct' has no member named 'fsgid'
>
> These fields are being removed by another tree in linux-next, but there
> are already accessor functions in Linus' tree that you should be using
> anyway (see current_fsuid() and current_fsgid() in include/linux/cred.h).
>
> So I will drop your tree for today in the hope that it will be fixed by
> Monday.
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>

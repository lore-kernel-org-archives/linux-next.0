From: Matt Turner <mattst88@gmail.com>
Subject: Re: linux-next: manual merge of the namespace tree with Linus' tree
Date: Mon, 16 May 2011 00:00:15 -0400
Message-ID: <BANLkTinvz_jCQhdZP46FY89e8amqvdqaeg@mail.gmail.com>
References: <20110516134733.e448f6fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:63335 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750787Ab1EPEAg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 May 2011 00:00:36 -0400
In-Reply-To: <20110516134733.e448f6fe.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>

On Sun, May 15, 2011 at 11:47 PM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> Hi Eric,
>
> Today's linux-next merge of the namespace tree got a conflict in
> arch/alpha/include/asm/unistd.h arch/alpha/kernel/systbls.S between
> commit 90b57f35164a ("alpha: Wire up syscalls new to 2.6.39") from Li=
nus'
> tree and commit e975ee91dcc1 ("ns: Wire up the setns system call") fr=
om
> the namespace tree.
>
> I fixed it up (see below) and can carry the fix as necessary.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc arch/alpha/include/asm/unistd.h
> index b183416,664383d..0000000
> --- a/arch/alpha/include/asm/unistd.h
> +++ b/arch/alpha/include/asm/unistd.h
> @@@ -452,14 -452,11 +452,15 @@@
> =A0#define __NR_fanotify_init =A0 =A0 =A0 =A0 =A0 =A0494
> =A0#define __NR_fanotify_mark =A0 =A0 =A0 =A0 =A0 =A0495
> =A0#define __NR_prlimit64 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0496
> =A0-#define __NR_setns =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0497
> =A0+#define __NR_name_to_handle_at =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0497
> =A0+#define __NR_open_by_handle_at =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0498
> =A0+#define __NR_clock_adjtime =A0 =A0 =A0 =A0 =A0 =A0499
> =A0+#define __NR_syncfs =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 500
> ++#define __NR_setns =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0501
>
> =A0#ifdef __KERNEL__
>
> - #define NR_SYSCALLS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 501
> =A0-#define NR_SYSCALLS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 498
> ++#define NR_SYSCALLS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 502
>
> =A0#define __ARCH_WANT_IPC_PARSE_VERSION
> =A0#define __ARCH_WANT_OLD_READDIR
> diff --cc arch/alpha/kernel/systbls.S
> index 15f999d,4663fd5..0000000
> --- a/arch/alpha/kernel/systbls.S
> +++ b/arch/alpha/kernel/systbls.S
> @@@ -513,12 -513,9 +513,13 @@@ sys_call_table
> =A0 =A0 =A0 =A0.quad sys_rt_tgsigqueueinfo
> =A0 =A0 =A0 =A0.quad sys_perf_event_open
> =A0 =A0 =A0 =A0.quad sys_fanotify_init
> =A0- =A0 =A0 =A0.quad sys_fanotify_mark =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 /* 495 */
> =A0+ =A0 =A0 =A0.quad sys_fanotify_mark =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 /* 495 */
> =A0 =A0 =A0 =A0.quad sys_prlimit64
> =A0+ =A0 =A0 =A0.quad sys_name_to_handle_at
> =A0+ =A0 =A0 =A0.quad sys_open_by_handle_at
> =A0+ =A0 =A0 =A0.quad sys_clock_adjtime
> =A0+ =A0 =A0 =A0.quad sys_syncfs =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0/* 500 */
> + =A0 =A0 =A0 .quad sys_setns
>
> =A0 =A0 =A0 =A0.size sys_call_table, . - sys_call_table
> =A0 =A0 =A0 =A0.type sys_call_table, @object

Thanks for handling this, Stephen.

I don't know what the best way to avoid this is. Sometimes (and
_sometimes_ is the problem) new syscalls are added through another
tree. Other times, they're added to only x86 and amd64 or something
and leave us to find out later.

So, should all syscall additions go through the respective arch trees,
or should syscall additions make sure to include all architectures?

Thanks,
Matt

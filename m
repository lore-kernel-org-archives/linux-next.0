From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: linux-next: manual merge of the luto-misc tree with Linus' tree
Date: Fri, 15 Jan 2016 08:34:25 -0800
Message-ID: <CALCETrVBqiSfg769maAgEoGxdbpu+WCpasTfJUoGYGdkU5DLeg@mail.gmail.com>
References: <20160115134528.5e2831a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33097 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbcAOQep (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jan 2016 11:34:45 -0500
Received: by mail-ob0-f172.google.com with SMTP id is5so114261651obc.0
        for <linux-next@vger.kernel.org>; Fri, 15 Jan 2016 08:34:44 -0800 (PST)
In-Reply-To: <20160115134528.5e2831a7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 14, 2016 at 6:45 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andy,
>
> Today's linux-next merge of the luto-misc tree got a conflict in:
>
>   tools/testing/selftests/x86/Makefile
>
> between commit:
>
>   0f672809f91a ("selftests/x86: Disable the ldt_gdt_64 test for now")
>
> from Linus' tree and commit:
>
>   4b154c54fff1 ("x86/signal/64: Re-add support for SS in the 64-bit signal context")
>
> from the luto-misc tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

This isn't quite correct.  I'll fix it up, since semantically it's
more a functionality change than a merge issue.

--Andy

>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> diff --cc tools/testing/selftests/x86/Makefile
> index d0c473f65850,7d01da819d83..000000000000
> --- a/tools/testing/selftests/x86/Makefile
> +++ b/tools/testing/selftests/x86/Makefile
> @@@ -4,11 -4,9 +4,11 @@@ include ../lib.m
>
>   .PHONY: all all_32 all_64 warn_32bit_failure clean
>
> - TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs syscall_nt ptrace_syscall
> - TARGETS_C_32BIT_ONLY := entry_from_vm86 syscall_arg_fault sigreturn test_syscall_vdso unwind_vdso \
>  -TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs ldt_gdt syscall_nt ptrace_syscall sigreturn
> ++TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs syscall_nt ptrace_syscall sigreturn
> + TARGETS_C_32BIT_ONLY := entry_from_vm86 syscall_arg_fault test_syscall_vdso unwind_vdso \
>  -                      test_FCMOV test_FCOMI test_FISTTP
>  +                      test_FCMOV test_FCOMI test_FISTTP \
>  +                      ldt_gdt \
>  +                      vdso_restorer
>
>   TARGETS_C_32BIT_ALL := $(TARGETS_C_BOTHBITS) $(TARGETS_C_32BIT_ONLY)
>   BINARIES_32 := $(TARGETS_C_32BIT_ALL:%=%_32)



-- 
Andy Lutomirski
AMA Capital Management, LLC

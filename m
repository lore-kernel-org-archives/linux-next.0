From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: linux-next: manual merge of the tip tree with the audit tree
Date: Wed, 24 Sep 2014 11:12:09 -0700
Message-ID: <CALCETrWED3LzZzRwVL+X2dtLGVcQ7fPijbObJa-UvyARySoDeQ@mail.gmail.com>
References: <20140924154737.50db90eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:57388 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742AbaIXSMb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Sep 2014 14:12:31 -0400
Received: by mail-la0-f50.google.com with SMTP id ty20so11360768lab.9
        for <linux-next@vger.kernel.org>; Wed, 24 Sep 2014 11:12:29 -0700 (PDT)
In-Reply-To: <20140924154737.50db90eb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Eric Paris <eparis@redhat.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 23, 2014 at 10:47 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in
> arch/x86/kernel/ptrace.c between commit 91397401bb50 ("ARCH: AUDIT:
> audit_syscall_entry() should not require the arch") from the audit tree
> and commit e0ffbaabc46d ("x86: Split syscall_trace_enter into two
> phases") from the tip tree.
>
> I fixed it up (see below - there is more cleanup possible since
> do_audit_syscall_entry() no longer needs its "arch" argument) and can
> carry the fix as necessary (no action is required).

[mainly for Eric]

This appears to re-introduce the bug fixed in:

commit 81f49a8fd7088cfcb588d182eeede862c0e3303e
Author: Andy Lutomirski <luto@amacapital.net>
Date:   Fri Sep 5 15:13:52 2014 -0700

    x86, x32, audit: Fix x32's AUDIT_ARCH wrt audit

This bug is not currently observable because enabling x32 disables
syscall auditing.

Eric, do you want to fix this or should I?

--Andy

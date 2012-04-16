From: Will Drewry <wad@chromium.org>
Subject: Re: linux-next: build failure after merge of the final tree (security
 tree related)
Date: Mon, 16 Apr 2012 11:15:36 -0500
Message-ID: <CABqD9hYhC3dNX3CVSbsuJaG=zBUC4VMyMVYYmyOTN+Xfb=uC8w@mail.gmail.com>
References: <20120416154607.302f7ae245472e1e917dacef@canb.auug.org.au>
	<CABqD9hauxzd4vVbxyC5M1p9e6mLt1cjYP7wbhzTKPi3iMpc0kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABqD9hauxzd4vVbxyC5M1p9e6mLt1cjYP7wbhzTKPi3iMpc0kg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Eric Paris <eparis@redhat.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 16, 2012 at 10:32 AM, Will Drewry <wad@chromium.org> wrote:
> On Mon, Apr 16, 2012 at 12:46 AM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>> Hi all,
>>
>> After merging the final tree, today's linux-next build (powerpc
>> allnoconfig) failed like this:
>>
>> arch/powerpc/kernel/ptrace.c: In function 'do_syscall_trace_enter':
>> arch/powerpc/kernel/ptrace.c:1713:2: error: statement with no effect=
 [-Werror=3Dunused-value]
>> cc1: all warnings being treated as errors
>>
>> Introduced by commit acf3b2c71ed2 ("seccomp: add SECCOMP_RET_ERRNO")=
=2E =A0I
>> have applied the following hack fix that fixes the build, but the ot=
her
>> seven call sites of secure_computing() should be fixed up properly.
>
> Thanks for this, and the other two fixes! =A0I'll pull together a pat=
ch
> fixing up the other call sites.

Hrm - with liberal application of grep and lxr, I'm not seeing any
other call sites that need to be fixed.  I ended up with the exact
same patch as yours.

At present, the return value from secure_computing() can be ignored
for every arch that supports CONFIG_SECCOMP and does not support
CONFIG_HAVE_ARCH_SECCOMP_FILTER, so I don't necessarily see your patch
as a hack.  Then as the pieces needed to support
CONFIG_HAVE_ARCH_SECCOMP_FILTER end up in place, the (void) cast will
be removed.  (Respecting the return value is noted in the arch/Kconfig
description for adding support.)

I certainly don't mind bouncing the casts patch (broken out per-arch)
over to James's tree so that you don't have to carry the fix, but I
wonder if I'm missing some implicit context.

Thanks!
will

>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Mon, 16 Apr 2012 15:39:49 +1000
>> Subject: [PATCH] seccomp: hack fix for build failures with secure_co=
mputing
>> =A0return value change
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>> =A0arch/microblaze/kernel/ptrace.c | =A0 =A02 +-
>> =A0arch/mips/kernel/ptrace.c =A0 =A0 =A0 | =A0 =A02 +-
>> =A0arch/powerpc/kernel/ptrace.c =A0 =A0| =A0 =A02 +-
>> =A0arch/s390/kernel/ptrace.c =A0 =A0 =A0 | =A0 =A02 +-
>> =A0arch/sh/kernel/ptrace_32.c =A0 =A0 =A0| =A0 =A02 +-
>> =A0arch/sh/kernel/ptrace_64.c =A0 =A0 =A0| =A0 =A02 +-
>> =A0arch/sparc/kernel/ptrace_64.c =A0 | =A0 =A02 +-
>> =A07 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/microblaze/kernel/ptrace.c b/arch/microblaze/kerne=
l/ptrace.c
>> index 6eb2aa9..9e3ffc9 100644
>> --- a/arch/microblaze/kernel/ptrace.c
>> +++ b/arch/microblaze/kernel/ptrace.c
>> @@ -136,7 +136,7 @@ asmlinkage long do_syscall_trace_enter(struct pt=
_regs *regs)
>> =A0{
>> =A0 =A0 =A0 =A0long ret =3D 0;
>>
>> - =A0 =A0 =A0 secure_computing(regs->r12);
>> + =A0 =A0 =A0 (void)secure_computing(regs->r12);
>>
>> =A0 =A0 =A0 =A0if (test_thread_flag(TIF_SYSCALL_TRACE) &&
>> =A0 =A0 =A0 =A0 =A0 =A0tracehook_report_syscall_entry(regs))
>> diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
>> index 7c24c29..4f83d73 100644
>> --- a/arch/mips/kernel/ptrace.c
>> +++ b/arch/mips/kernel/ptrace.c
>> @@ -535,7 +535,7 @@ static inline int audit_arch(void)
>> =A0asmlinkage void syscall_trace_enter(struct pt_regs *regs)
>> =A0{
>> =A0 =A0 =A0 =A0/* do the secure computing check first */
>> - =A0 =A0 =A0 secure_computing(regs->regs[2]);
>> + =A0 =A0 =A0 (void)secure_computing(regs->regs[2]);
>>
>> =A0 =A0 =A0 =A0if (!(current->ptrace & PT_PTRACED))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
>> diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptra=
ce.c
>> index 8d8e028..53cebc4 100644
>> --- a/arch/powerpc/kernel/ptrace.c
>> +++ b/arch/powerpc/kernel/ptrace.c
>> @@ -1710,7 +1710,7 @@ long do_syscall_trace_enter(struct pt_regs *re=
gs)
>> =A0{
>> =A0 =A0 =A0 =A0long ret =3D 0;
>>
>> - =A0 =A0 =A0 secure_computing(regs->gpr[0]);
>> + =A0 =A0 =A0 (void)secure_computing(regs->gpr[0]);
>>
>> =A0 =A0 =A0 =A0if (test_thread_flag(TIF_SYSCALL_TRACE) &&
>> =A0 =A0 =A0 =A0 =A0 =A0tracehook_report_syscall_entry(regs))
>> diff --git a/arch/s390/kernel/ptrace.c b/arch/s390/kernel/ptrace.c
>> index 02f300f..96e0dea 100644
>> --- a/arch/s390/kernel/ptrace.c
>> +++ b/arch/s390/kernel/ptrace.c
>> @@ -719,7 +719,7 @@ asmlinkage long do_syscall_trace_enter(struct pt=
_regs *regs)
>> =A0 =A0 =A0 =A0long ret =3D 0;
>>
>> =A0 =A0 =A0 =A0/* Do the secure computing check first. */
>> - =A0 =A0 =A0 secure_computing(regs->gprs[2]);
>> + =A0 =A0 =A0 (void)secure_computing(regs->gprs[2]);
>>
>> =A0 =A0 =A0 =A0/*
>> =A0 =A0 =A0 =A0 * The sysc_tracesys code in entry.S stored the syste=
m
>> diff --git a/arch/sh/kernel/ptrace_32.c b/arch/sh/kernel/ptrace_32.c
>> index 9698671..cf55945 100644
>> --- a/arch/sh/kernel/ptrace_32.c
>> +++ b/arch/sh/kernel/ptrace_32.c
>> @@ -503,7 +503,7 @@ asmlinkage long do_syscall_trace_enter(struct pt=
_regs *regs)
>> =A0{
>> =A0 =A0 =A0 =A0long ret =3D 0;
>>
>> - =A0 =A0 =A0 secure_computing(regs->regs[0]);
>> + =A0 =A0 =A0 (void)secure_computing(regs->regs[0]);
>>
>> =A0 =A0 =A0 =A0if (test_thread_flag(TIF_SYSCALL_TRACE) &&
>> =A0 =A0 =A0 =A0 =A0 =A0tracehook_report_syscall_entry(regs))
>> diff --git a/arch/sh/kernel/ptrace_64.c b/arch/sh/kernel/ptrace_64.c
>> index bc81e07..3d3600f 100644
>> --- a/arch/sh/kernel/ptrace_64.c
>> +++ b/arch/sh/kernel/ptrace_64.c
>> @@ -522,7 +522,7 @@ asmlinkage long long do_syscall_trace_enter(stru=
ct pt_regs *regs)
>> =A0{
>> =A0 =A0 =A0 =A0long long ret =3D 0;
>>
>> - =A0 =A0 =A0 secure_computing(regs->regs[9]);
>> + =A0 =A0 =A0 (void)secure_computing(regs->regs[9]);
>>
>> =A0 =A0 =A0 =A0if (test_thread_flag(TIF_SYSCALL_TRACE) &&
>> =A0 =A0 =A0 =A0 =A0 =A0tracehook_report_syscall_entry(regs))
>> diff --git a/arch/sparc/kernel/ptrace_64.c b/arch/sparc/kernel/ptrac=
e_64.c
>> index 6f97c07..6ddec1f 100644
>> --- a/arch/sparc/kernel/ptrace_64.c
>> +++ b/arch/sparc/kernel/ptrace_64.c
>> @@ -1062,7 +1062,7 @@ asmlinkage int syscall_trace_enter(struct pt_r=
egs *regs)
>> =A0 =A0 =A0 =A0int ret =3D 0;
>>
>> =A0 =A0 =A0 =A0/* do the secure computing check first */
>> - =A0 =A0 =A0 secure_computing(regs->u_regs[UREG_G1]);
>> + =A0 =A0 =A0 (void)secure_computing(regs->u_regs[UREG_G1]);
>>
>> =A0 =A0 =A0 =A0if (test_thread_flag(TIF_SYSCALL_TRACE))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D tracehook_report_syscall_entr=
y(regs);
>> --
>> 1.7.10.rc3
>>
>> --
>> Cheers,
>> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auu=
g.org.au
>> http://www.canb.auug.org.au/~sfr/

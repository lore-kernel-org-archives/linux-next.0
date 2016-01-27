From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2016-01-27-14-04 uploaded
Date: Thu, 28 Jan 2016 09:57:59 +1100
Message-ID: <20160128095759.44af98f5@canb.auug.org.au>
References: <56a93efb.wTNmPJ0+jR+bz7eT%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <56a93efb.wTNmPJ0+jR+bz7eT%akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, mhocko@suse.cz, broonie@kernel.org
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On Wed, 27 Jan 2016 14:04:43 -0800 akpm@linux-foundation.org wrote:
>
> * compat-add-in_compat_syscall-to-ask-whether-were-in-a-compat-syscall.patch
> * sparc-compat-provide-an-accurate-in_compat_syscall-implementation.patch
> * sparc-compat-provide-an-accurate-in_compat_syscall-implementation-fix.patch
> * sparc-syscall-fix-syscall_get_arch.patch
> * seccomp-check-in_compat_syscall-not-is_compat_task-in-strict-mode.patch
> * ptrace-in-peek_siginfo-check-syscall-bitness-not-task-bitness.patch
> * auditsc-for-seccomp-events-log-syscall-compat-state-using-in_compat_syscall.patch
> * staging-lustre-switch-from-is_compat_task-to-in_compat_syscall.patch
> * ext4-in-ext4_dir_llseek-check-syscall-bitness-directly.patch
> * net-sctp-use-in_compat_syscall-for-sctp_getsockopt_connectx3.patch
> * net-xfrm_user-use-in_compat_syscall-to-deny-compat-syscalls.patch
> * firewire-use-in_compat_syscall-to-check-ioctl-compatness.patch
> * efivars-use-in_compat_syscall-to-check-for-compat-callers.patch
> * amdkfd-use-in_compat_syscall-to-check-open-caller-type.patch
> * input-redefine-input_compat_test-as-in_compat_syscall.patch
> * uhid-check-write-bitness-using-in_compat_syscall.patch
> * x86-compat-remove-is_compat_task.patch

> * compat-add-in_compat_syscall-to-ask-whether-were-in-a-compat-syscall.patch
> * sparc-compat-provide-an-accurate-in_compat_syscall-implementation.patch
> * sparc-compat-provide-an-accurate-in_compat_syscall-implementation-fix.patch
> * sparc-syscall-fix-syscall_get_arch.patch
> * seccomp-check-in_compat_syscall-not-is_compat_task-in-strict-mode.patch
> * ptrace-in-peek_siginfo-check-syscall-bitness-not-task-bitness.patch
> * auditsc-for-seccomp-events-log-syscall-compat-state-using-in_compat_syscall.patch
> * staging-lustre-switch-from-is_compat_task-to-in_compat_syscall.patch
> * ext4-in-ext4_dir_llseek-check-syscall-bitness-directly.patch
> * net-sctp-use-in_compat_syscall-for-sctp_getsockopt_connectx3.patch
> * net-xfrm_user-use-in_compat_syscall-to-deny-compat-syscalls.patch
> * firewire-use-in_compat_syscall-to-check-ioctl-compatness.patch
> * efivars-use-in_compat_syscall-to-check-for-compat-callers.patch
> * amdkfd-use-in_compat_syscall-to-check-open-caller-type.patch
> * input-redefine-input_compat_test-as-in_compat_syscall.patch
> * uhid-check-write-bitness-using-in_compat_syscall.patch
> * x86-compat-remove-is_compat_task.patch

Note that the above patches appear twice in the series file.  I just
applied the first ones :-)
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

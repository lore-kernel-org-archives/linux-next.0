From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2015-09-10-16-30 uploaded
Date: Fri, 11 Sep 2015 10:35:05 +1000
Message-ID: <20150911103505.47f95d72@canb.auug.org.au>
References: <55f212ae.jOhLy+/WerFdt/xh%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <55f212ae.jOhLy+/WerFdt/xh%akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, mhocko@suse.cz
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On Thu, 10 Sep 2015 16:30:54 -0700 akpm@linux-foundation.org wrote:
>
>   sys_membarrier-system-wide-memory-barrier-generic-x86.patch

Because that patch is not in the set for -next ...

> * mm-mlock-add-new-mlock-system-call.patch

This did not apply properly.  I ended up with:

diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index 477bfa6db370..41e72a50c2ed 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -381,3 +381,4 @@
 372	i386	recvmsg			sys_recvmsg			compat_sys_recvmsg
 373	i386	shutdown		sys_shutdown
 374	i386	userfaultfd		sys_userfaultfd
+375	i386	mlock2			sys_mlock2
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index 81c490634db9..23669007b85d 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -330,6 +330,7 @@
 321	common	bpf			sys_bpf
 322	64	execveat		stub_execveat
 323	common	userfaultfd		sys_userfaultfd
+324	common	mlock2			sys_mlock2
 
 #
 # x32-specific system call numbers start at 512 to avoid cache impact
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 08001317aee7..890632cbf353 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -885,4 +885,6 @@ asmlinkage long sys_execveat(int dfd, const char __user *filename,
 			const char __user *const __user *argv,
 			const char __user *const __user *envp, int flags);
 
+asmlinkage long sys_mlock2(unsigned long start, size_t len, int flags);
+
 #endif
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index e016bd9b1a04..14a6013cbdac 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -709,9 +709,11 @@ __SYSCALL(__NR_memfd_create, sys_memfd_create)
 __SYSCALL(__NR_bpf, sys_bpf)
 #define __NR_execveat 281
 __SC_COMP(__NR_execveat, sys_execveat, compat_sys_execveat)
+#define __NR_mlock2 282
+__SYSCALL(__NR_mlock2, sys_mlock2)
 
 #undef __NR_syscalls
-#define __NR_syscalls 282
+#define __NR_syscalls 283
 
 /*
  * All syscalls below here should go away really,
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index 03c3875d9958..8de5b2645796 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -194,6 +194,7 @@ cond_syscall(sys_mlock);
 cond_syscall(sys_munlock);
 cond_syscall(sys_mlockall);
 cond_syscall(sys_munlockall);
+cond_syscall(sys_mlock2);
 cond_syscall(sys_mincore);
 cond_syscall(sys_madvise);
 cond_syscall(sys_mremap);
diff --git a/mm/mlock.c b/mm/mlock.c
index c32ad8f6a9d1..fb6912f3efe6 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -644,6 +644,15 @@ SYSCALL_DEFINE2(mlock, unsigned long, start, size_t, len)
 	return do_mlock(start, len, VM_LOCKED);
 }
 
+SYSCALL_DEFINE3(mlock2, unsigned long, start, size_t, len, int, flags)
+{
+	vm_flags_t vm_flags = VM_LOCKED;
+	if (flags)
+		return -EINVAL;
+
+	return do_mlock(start, len, vm_flags);
+}
+
 SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 {
 	int ret;

> * page-flags-introduce-page-flags-policies-wrt-compound-pages-fix.patch

That did not apply either because proc-add-kpageidle-file.patch is
not among the -next included stuff. I just dropped it.

Everything else applied fine ...
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

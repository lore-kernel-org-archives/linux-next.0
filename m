From: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>
Subject: Re: [PATCH] -mm/linux-next: procfs: Mark thread stack correctly in proc/<pid>/maps
Date: Wed, 14 Mar 2012 09:28:47 +0530
Message-ID: <CAAHN_R2y6_y7ukzHAGmLxarmY_f=S3TBpt2VDRb=wbmb4TE63w@mail.gmail.com>
References: <4F57A3EC.7070101@gmail.com>
	<1331660076-32766-1-git-send-email-siddhesh.poyarekar@gmail.com>
	<20120313131616.f66dbdad.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:48027 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752224Ab2CND6t convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Mar 2012 23:58:49 -0400
In-Reply-To: <20120313131616.f66dbdad.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next <linux-next@vger.kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Jamie Lokier <jamie@shareable.org>, KOSAKI Motohiro <kosaki.motohiro@gmail.com>, Matt Mackall <mpm@selenic.com>, Mike Frysinger <vapier@gentoo.org>, Oleg Nesterov <oleg@redhat.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Mark Salter <msalter@redhat.com>

On Wed, Mar 14, 2012 at 1:46 AM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> Boy, that's a lot of changes (below). =A0What does it all do?
>
> Why did the sched.h inclusions get taken out again?
>

Most of it is code shuffling in addition to the feature change I
mentioned earlier. I've elaborated on the changes inline.

> diff -puN Documentation/filesystems/proc.txt~procfs-mark-thread-stack=
-correctly-in-proc-pid-maps-v3 Documentation/filesystems/proc.txt
> --- a/Documentation/filesystems/proc.txt~procfs-mark-thread-stack-cor=
rectly-in-proc-pid-maps-v3
> +++ a/Documentation/filesystems/proc.txt
<snip>
>
> =A0The /proc/PID/task/TID/maps is a view of the virtual memory from t=
he viewpoint
> =A0of the individual tasks of a process. In this file you will see a =
mapping marked
> -as [stack:TID] only if that task sees it as a stack. This is a key d=
ifference
> -from the content of /proc/PID/maps, where you will see all mappings =
that are
> -being used as stack by all of those tasks.
> +as [stack] if that task sees it as a stack. This is a key difference=
 from the
> +content of /proc/PID/maps, where you will see all mappings that are =
being used
> +as stack by all of those tasks. Hence, for the example above, the ta=
sk-level
> +map, i.e. /proc/PID/task/TID/maps for thread 1001 will look like thi=
s:
> +
> +08048000-08049000 r-xp 00000000 03:00 8312 =A0 =A0 =A0 /opt/test
> +08049000-0804a000 rw-p 00001000 03:00 8312 =A0 =A0 =A0 /opt/test
> +0804a000-0806b000 rw-p 00000000 00:00 0 =A0 =A0 =A0 =A0 =A0[heap]
> +a7cb1000-a7cb2000 ---p 00000000 00:00 0
> +a7cb2000-a7eb2000 rw-p 00000000 00:00 0
> +a7eb2000-a7eb3000 ---p 00000000 00:00 0
> +a7eb3000-a7ed5000 rw-p 00000000 00:00 0 =A0 =A0 =A0 =A0 =A0[stack]
> +a7ed5000-a8008000 r-xp 00000000 03:00 4222 =A0 =A0 =A0 /lib/libc.so.=
6
> +a8008000-a800a000 r--p 00133000 03:00 4222 =A0 =A0 =A0 /lib/libc.so.=
6
> +a800a000-a800b000 rw-p 00135000 03:00 4222 =A0 =A0 =A0 /lib/libc.so.=
6
> +a800b000-a800e000 rw-p 00000000 00:00 0
> +a800e000-a8022000 r-xp 00000000 03:00 14462 =A0 =A0 =A0/lib/libpthre=
ad.so.0
> +a8022000-a8023000 r--p 00013000 03:00 14462 =A0 =A0 =A0/lib/libpthre=
ad.so.0
> +a8023000-a8024000 rw-p 00014000 03:00 14462 =A0 =A0 =A0/lib/libpthre=
ad.so.0
> +a8024000-a8027000 rw-p 00000000 00:00 0
> +a8027000-a8043000 r-xp 00000000 03:00 8317 =A0 =A0 =A0 /lib/ld-linux=
=2Eso.2
> +a8043000-a8044000 r--p 0001b000 03:00 8317 =A0 =A0 =A0 /lib/ld-linux=
=2Eso.2
> +a8044000-a8045000 rw-p 0001c000 03:00 8317 =A0 =A0 =A0 /lib/ld-linux=
=2Eso.2
> +aff35000-aff4a000 rw-p 00000000 00:00 0
> +ffffe000-fffff000 r-xp 00000000 00:00 0 =A0 =A0 =A0 =A0 =A0[vdso]

I extended the documentation a bit to give an example of how
/proc/PID/task/TID/maps would look like. This reflects the feature
change that KOSAKI-san requested (keeping process stack as [stack] in
/proc/PID/maps).

> --- a/fs/proc/task_mmu.c~procfs-mark-thread-stack-correctly-in-proc-p=
id-maps-v3
> +++ a/fs/proc/task_mmu.c
> @@ -222,7 +222,7 @@ show_map_vma(struct seq_file *m, struct
> =A0 =A0 =A0 =A0unsigned long start, end;
> =A0 =A0 =A0 =A0dev_t dev =3D 0;
> =A0 =A0 =A0 =A0int len;
> - =A0 =A0 =A0 const char *name;
> + =A0 =A0 =A0 const char *name =3D NULL;
>
> =A0 =A0 =A0 =A0if (file) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct inode *inode =3D vma->vm_file->=
f_path.dentry->d_inode;
> @@ -256,33 +256,47 @@ show_map_vma(struct seq_file *m, struct
> =A0 =A0 =A0 =A0if (file) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pad_len_spaces(m, len);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0seq_path(m, &file->f_path, "\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto done;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0name =3D arch_vma_name(vma);
> =A0 =A0 =A0 =A0if (!name) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (mm) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (vma->vm_start <=3D =
mm->brk &&
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 vma->vm_end >=3D mm->start_brk) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 name =3D=
 "[heap]";
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pid_t t=
id;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pid_t tid;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tid =3D=
 vm_is_stack(task, vma, is_pid);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (tid=
 !=3D 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 pad_len_spaces(m, len);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 seq_printf(m, "[stack:%d]", tid);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!mm) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0name =3D "[vdso]";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto done;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (vma->vm_start <=3D mm->brk &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vma->vm_end >=3D mm->start_brk)=
 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 name =3D "[heap]";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto done;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tid =3D vm_is_stack(task, vma, is_pid);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (tid !=3D0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Thread stack in /p=
roc/PID/task/TID/maps or
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* the main process s=
tack.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!is_pid || (vma->vm=
_start <=3D mm->start_stack &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vma->vm_end >=3D=
 mm->start_stack)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 name =3D=
 "[stack]";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Thre=
ad stack in /proc/PID/maps */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pad_len=
_spaces(m, len);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 seq_pri=
ntf(m, "[stack:%d]", tid);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> +
> +done:
> =A0 =A0 =A0 =A0if (name) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pad_len_spaces(m, len);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0seq_puts(m, name);
> =A0 =A0 =A0 =A0}
> -out:
> =A0 =A0 =A0 =A0seq_putc(m, '\n');
> =A0}
>
> @@ -1134,8 +1148,17 @@ static int show_numa_map(struct seq_file
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0seq_printf(m, " heap");
> =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pid_t tid =3D vm_is_stack(proc_priv->t=
ask, vma, is_pid);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (tid !=3D 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 seq_printf(m, " stack:%=
d", tid);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (tid !=3D0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Thread stack in /p=
roc/PID/task/TID/maps or
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* the main process s=
tack.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!is_pid || (vma->vm=
_start <=3D mm->start_stack &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vma->vm_end >=3D=
 mm->start_stack))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 seq_pri=
ntf(m, " stack");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 seq_pri=
ntf(m, " stack:%d", tid);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0}

The request to keep process stack marked as [stack] meant an
additional nested condition, so I cleaned up the code like you had
suggested earlier.

> diff -puN mm/util.c~procfs-mark-thread-stack-correctly-in-proc-pid-ma=
ps-v3 mm/util.c
> --- a/mm/util.c~procfs-mark-thread-stack-correctly-in-proc-pid-maps-v=
3
> +++ a/mm/util.c
> @@ -239,6 +239,47 @@ void __vma_link_list(struct mm_struct *m
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0next->vm_prev =3D vma;
> =A0}
>
> +/* Check if the vma is being used as a stack by this task */
> +static int vm_is_stack_for_task(struct task_struct *t,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
vm_area_struct *vma)
> +{
> + =A0 =A0 =A0 return (vma->vm_start <=3D KSTK_ESP(t) && vma->vm_end >=
=3D KSTK_ESP(t));
> +}
> +
> +/*
> + * Check if the vma is being used as a stack.
> + * If is_group is non-zero, check in the entire thread group or else
> + * just check in the current task. Returns the pid of the task that
> + * the vma is stack for.
> + */
> +pid_t vm_is_stack(struct task_struct *task,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct vm_area_struct *vma, int in_=
group)
> +{
> + =A0 =A0 =A0 pid_t ret =3D 0;
> +
> + =A0 =A0 =A0 if (vm_is_stack_for_task(task, vma))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return task->pid;
> +
> + =A0 =A0 =A0 if (in_group) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct task_struct *t;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rcu_read_lock();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pid_alive(task))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto done;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t =3D task;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 do {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (vm_is_stack_for_tas=
k(t, vma)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D=
 t->pid;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto do=
ne;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } while_each_thread(task, t);
> +done:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rcu_read_unlock();
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> =A0#if defined(CONFIG_MMU) && !defined(HAVE_ARCH_PICK_MMAP_LAYOUT)
> =A0void arch_pick_mmap_layout(struct mm_struct *mm)
> =A0{
> _
>

I had duplicated the vm_is_stack functions for mmu and nommu in
memory.c and nommu.c, which I unified and moved to util.c (above),
which is built in both mmu and nommu and also seemed like a good
enough place for it since it is a utility function. util.c already
includes sched.h, which is why the sched.h inclusions are not needed
anymore.

I forgot to mention how I have tested this:

* Build and functionality test on x86_64
* Build test for i386
* Build test for nommu with a bit of a hack; removing mmu code in x86
and building it as if it were nommu.

--=20
Siddhesh Poyarekar
http://siddhesh.in

From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: build failure after merge of the userns tree
Date: Wed, 28 Mar 2018 13:32:25 -0500
Message-ID: <87efk4aw5i.fsf@xmission.com>
References: <20180328184125.3dbcfbf5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180328184125.3dbcfbf5@canb.auug.org.au> (Stephen Rothwell's
        message of "Wed, 28 Mar 2018 18:41:25 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> After merging the userns tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>
> In file included from include/linux/sched.h:16:0,
>                  from arch/powerpc/lib/xor_vmx_glue.c:14:
> include/linux/shm.h:17:35: error: 'struct file' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>  bool is_file_shm_hugepages(struct file *file);
>                                    ^~~~
>
> and many, many more (most warnings, but some errors - arch/powerpc is
> mostly built with -Werror)
>
> Maybe caused by commit
>
>   1a5c1349d105 ("sem: Move struct sem and struct sem_array into ipc/sem.c")
>
> I have appplied the following fix patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 28 Mar 2018 18:36:27 +1100
> Subject: [PATCH] fix up for struct file no longer being available in shm.h
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied.  With the addition of:

> I dug through this and I discovered that the error was caused by the
> removal of struct shmid_kernel from shm.h when building on powerpc.
> Except for observing the existence of "struct file *shm_file" in
> struct shmid_kernel I have no clue why the structure move would
> cause such a failure.  I suspect shm.h always needed the forward
> declaration and someting had been confusing gcc into not issuing the
> warning. --EWB
> 
> Fixes: a2e102cd3cdd ("shm: Move struct shmid_kernel into ipc/shm.c")

Has anyone ever seen anything like that?

Eric

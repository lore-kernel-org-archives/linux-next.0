From: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the pidfd tree
Date: Fri, 24 May 2019 11:15:17 +0300
Message-ID: <CAEXW_YR99jkobkTUJLKjX-swR_AVYrjFzQcaD8j1JuZZ=dK9Qw@mail.gmail.com>
References: <20190522114314.515b410d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522114314.515b410d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <christian@brauner.io>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, May 22, 2019 at 4:43 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   kernel/pid.c
>
> between commit:
>
>   99e9da7f2796 ("pid: add pidfd_open()")

Fix LGTM. Thank you.


>
> from the pidfd tree and commit:
>
>   51c59c914840 ("kernel/pid.c: convert struct pid:count to refcount_t")
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc kernel/pid.c
> index 39181ccca846,b59681973dd6..000000000000
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@@ -37,8 -36,7 +37,8 @@@
>   #include <linux/init_task.h>
>   #include <linux/syscalls.h>
>   #include <linux/proc_ns.h>
> - #include <linux/proc_fs.h>
> + #include <linux/refcount.h>
>  +#include <linux/sched/signal.h>
>   #include <linux/sched/task.h>
>   #include <linux/idr.h>
>

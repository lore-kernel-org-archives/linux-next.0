From: Matteo Croce <mcroce@redhat.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 30 May 2019 11:02:22 +0200
Message-ID: <CAGnkfhwQY6mw--2=QD+BR1ceOWb5E1Wnzp57dO-pbiNnYwS2PA@mail.gmail.com>
References: <20190530145525.3cca17cb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530145525.3cca17cb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, May 30, 2019 at 6:55 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> net/tipc/sysctl.c:42:12: warning: 'one' defined but not used [-Wunused-variable]
>  static int one = 1;
>             ^~~
> net/tipc/sysctl.c:41:12: warning: 'zero' defined but not used [-Wunused-variable]
>  static int zero;
>             ^~~~
>
> Introduced by commit
>
>   6a33853c5773 ("proc/sysctl: add shared variables for range check")
>
> --
> Cheers,
> Stephen Rothwell

Hi,

this is due the merge of:

commit 4bcd4ec1017205644a2697bccbc3b5143f522f5f
Author: Jie Liu <liujie165@huawei.com>
Date:   Tue Apr 16 13:10:09 2019 +0800

    tipc: set sysctl_tipc_rmem and named_timeout right range

I'm making a patch to suppress the warning.

Regards,
-- 
Matteo Croce
per aspera ad upstream

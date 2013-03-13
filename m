From: Li Zefan <lizefan@huawei.com>
Subject: Re: linux-next: build failure after merge of the final tree (cgroup
 tree related)
Date: Wed, 13 Mar 2013 14:33:15 +0800
Message-ID: <51401DAB.1070602@huawei.com>
References: <20130313161236.760c25633a4e8ea8d4847ccb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130313161236.760c25633a4e8ea8d4847ccb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 2013/3/13 13:12, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> In file included from include/linux/memcontrol.h:22:0,
>                  from include/linux/swap.h:8,
>                  from include/linux/suspend.h:4,
>                  from arch/powerpc/kernel/asm-offsets.c:24:
> include/linux/cgroup.h:748:13: warning: 'struct cgroupstats' declared inside parameter list [enabled by default]
> include/linux/cgroup.h:748:13: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
> cc1: all warnings being treated as errors
> 
> and many more similar.
> 
> Caused by commit c2c9ad164fa3 ("cgroup: remove unneeded includes from
> cgroup.h").
> 

Tejun has dropped this patch.

From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: build failure after merge of the bpf-next tree
Date: Wed, 27 Feb 2019 18:18:37 -0800
Message-ID: <CAADnVQJXiZyCvDVTN4_Z=CnEo2hb3nxGWg6YhArxN9zrPaC8JQ@mail.gmail.com>
References: <20190228123136.064f94a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228123136.064f94a4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 27, 2019 at 5:31 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the bpf-next tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> kernel/sysctl.c:1238:13: error: 'sysctl_bpf_stats_enabled' undeclared here (not in a function); did you mean 'sysctl_base_table'?
>    .data  = &sysctl_bpf_stats_enabled,
>              ^~~~~~~~~~~~~~~~~~~~~~~~
>              sysctl_base_table
>
> Caused by commit
>
>   492ecee892c2 ("bpf: enable program stats")
>
> CONFIG_BPF=y
> # CONFIG_BPF_SYSCALL is not set
>
> I applied the following patch for today, but it should be done
> properly. Also this patch leaves proc_dointvec_minmax_bpf_stats() as an
> unused function.

thanks for the report.
working on the fix.

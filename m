From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: build failure after merge of the bpf-next tree
Date: Tue, 12 Dec 2017 17:47:32 -0800
Message-ID: <20171213014730.hpv474d6ihh7mtfm@ast-mbp>
References: <20171213123245.44c86f3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171213123245.44c86f3f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 13, 2017 at 12:32:45PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bpf-next tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> kernel/events/core.o: In function `perf_ioctl':
> core.c:(.text+0x98c4): undefined reference to `bpf_event_query_prog_array'
> 
> Caused by commit
> 
>   f371b304f12e ("bpf/tracing: allow user space to query prog array on the same tp")
> 
> CONFIG_BPF_SYSCALL is not set for this build.
> 
> I have used the bpf-next tree from next-20171212 for today.

Thanks for the report.
Yonghong, please take a look and send a followup fix based on bpf-next tree.

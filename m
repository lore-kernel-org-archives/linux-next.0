From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Wed, 10 Jan 2018 17:58:54 -0800
Message-ID: <20180111015853.2pmxtqlrsyxelqf6@ast-mbp>
References: <20180111115355.29c2f905@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:43874 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752567AbeAKB66 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Jan 2018 20:58:58 -0500
Content-Disposition: inline
In-Reply-To: <20180111115355.29c2f905@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jan 11, 2018 at 11:53:55AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> kernel/bpf/verifier.o: In function `bpf_check':
> verifier.c:(.text+0xd86e): undefined reference to `bpf_patch_call_args'
> 
> Caused by commit
> 
>   1ea47e01ad6e ("bpf: add support for bpf_call to interpreter")
> 
> interacting with commit
> 
>   290af86629b2 ("bpf: introduce BPF_JIT_ALWAYS_ON config")
> 
> from the bpf and net trees.
> 
> I have just reverted commit 290af86629b2 for today.  A better solution
> would be nice (lie fixing this in a merge between the net-next and net
> trees).

that's due to 'endif' from 290af86629b2 needs to be moved above
bpf_patch_call_args() definition.
There is another fixup needed for net-next.
I'll send a follow up patch when net gets merged into net-next.

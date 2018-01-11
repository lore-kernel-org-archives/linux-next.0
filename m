From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Thu, 11 Jan 2018 11:53:55 +1100
Message-ID: <20180111115355.29c2f905@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

kernel/bpf/verifier.o: In function `bpf_check':
verifier.c:(.text+0xd86e): undefined reference to `bpf_patch_call_args'

Caused by commit

  1ea47e01ad6e ("bpf: add support for bpf_call to interpreter")

interacting with commit

  290af86629b2 ("bpf: introduce BPF_JIT_ALWAYS_ON config")

from the bpf and net trees.

I have just reverted commit 290af86629b2 for today.  A better solution
would be nice (lie fixing this in a merge between the net-next and net
trees).

-- 
Cheers,
Stephen Rothwell

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the bpf-next tree
Date: Wed, 13 Dec 2017 12:32:45 +1100
Message-ID: <20171213123245.44c86f3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59983 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750749AbdLMBcr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Dec 2017 20:32:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>

Hi all,

After merging the bpf-next tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/events/core.o: In function `perf_ioctl':
core.c:(.text+0x98c4): undefined reference to `bpf_event_query_prog_array'

Caused by commit

  f371b304f12e ("bpf/tracing: allow user space to query prog array on the same tp")

CONFIG_BPF_SYSCALL is not set for this build.

I have used the bpf-next tree from next-20171212 for today.

-- 
Cheers,
Stephen Rothwell

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the net tree
Date: Thu, 16 Feb 2017 14:02:15 +1100
Message-ID: <20170216140215.69d39914@canb.auug.org.au>
References: <20170214091250.57d054b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33937 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752822AbdBPDCT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Feb 2017 22:02:19 -0500
In-Reply-To: <20170214091250.57d054b2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@fb.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Joe Stringer <joe@ovn.org>, Jiri Olsa <jolsa@redhat.com>

Hi all,

On Tue, 14 Feb 2017 09:12:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the net tree, today's linux-next build (powerpc64le perf)
> failed like this:
> 
> Warning: tools/include/uapi/linux/bpf.h differs from kernel
> bpf.c: In function 'bpf_prog_attach':
> bpf.c:180:6: error: 'union bpf_attr' has no member named 'attach_flags'; did you mean 'map_flags'?
>   attr.attach_flags  = flags;
>       ^
> 
> Caused by commit
> 
>   7f677633379b ("bpf: introduce BPF_F_ALLOW_OVERRIDE flag")
> 

So do we have a fix for this?  I am sure that Dave would like to send
his "net" tree to Linus sometime soonish ...

-- 
Cheers,
Stephen Rothwell

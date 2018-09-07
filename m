From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: build failure after merge of the bpf-next tree
Date: Thu, 6 Sep 2018 17:22:24 -0700
Message-ID: <20180907002223.tpizglyhrwn26oox@ast-mbp.dhcp.thefacebook.com>
References: <20180907101923.4d2a85c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180907101923.4d2a85c6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 07, 2018 at 10:19:23AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bpf-next tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: ".xsk_reuseq_swap" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!
> ERROR: ".xsk_reuseq_free" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!
> ERROR: ".xsk_reuseq_prepare" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined
> 
> Caused by commit
> 
>   9654bd10da60 ("i40e: clean zero-copy XDP Rx ring on shutdown/reset")
> 
> CONFIG_XDP_SOCKETS is not set for this build.
> 
> I have used the version of the bfp-next tree from next-20180906 for today.

merge conflict and build error...
Bjorn, I'm thinking to toss the patches out of bpf-next and reapply
cleaned up version of the patches...
what do you think?

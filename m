From: Florian Westphal <fw@strlen.de>
Subject: Re: linux-next: build failure after merge of the netfilter-next tree
Date: Fri, 12 Apr 2019 10:15:27 +0200
Message-ID: <20190412081527.vrym3czsko2lbqx7@breakpoint.cc>
References: <20190412163720.576c6610@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190412163720.576c6610@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the netfilter tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
> 
> In file included from /home/sfr/next/next/net/bridge/br_input.c:19:
> /home/sfr/next/next/include/net/netfilter/nf_queue.h:16:23: error: field 'state'
>  has incomplete type
>   struct nf_hook_state state;
>                        ^~~~~
> Caused by commit
> 
>   971502d77faa ("bridge: netfilter: unroll NF_HOOK helper in bridge input path")
> 
> This build has CONFIG_NETFILTER not set.
> 
> I have applied this patch for today:

Can you submit this fix formally to netfilter-devel@vger.kernel.org?

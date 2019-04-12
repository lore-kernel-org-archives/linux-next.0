From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: linux-next: build failure after merge of the netfilter-next tree
Date: Fri, 12 Apr 2019 18:36:12 +0200
Message-ID: <20190412163612.zpshjw774aqjdked@salvia>
References: <20190412163720.576c6610@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190412163720.576c6610@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: NetFilter <netfilter-devel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 12, 2019 at 04:37:20PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the netfilter tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
> 
> In file included from /home/sfr/next/next/net/bridge/br_input.c:19:
> /home/sfr/next/next/include/net/netfilter/nf_queue.h:16:23: error: field 'state'
>  has incomplete type
>   struct nf_hook_state state;
>                        ^~~~~
> 
> Caused by commit
> 
>   971502d77faa ("bridge: netfilter: unroll NF_HOOK helper in bridge input path")
> 
> This build has CONFIG_NETFILTER not set.

I have applied this to nf-next, thanks.

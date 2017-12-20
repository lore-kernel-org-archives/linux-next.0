From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Wed, 20 Dec 2017 15:59:00 -0800
Message-ID: <20171220155900.76409619@cakuba.netronome.com>
References: <20171221104304.38f94a00@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171221104304.38f94a00@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
List-Id: linux-next.vger.kernel.org

On Thu, 21 Dec 2017 10:43:04 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/net/netdevsim/bpf.c: In function 'nsim_bpf_setup_tc_block_cb':
> drivers/net/netdevsim/bpf.c:127:7: error: 'TC_CLSBPF_REPLACE' undeclared (first use in this function)
>   case TC_CLSBPF_REPLACE:
>        ^
> drivers/net/netdevsim/bpf.c:129:7: error: 'TC_CLSBPF_ADD' undeclared (first use in this function)
>   case TC_CLSBPF_ADD:
>        ^
> drivers/net/netdevsim/bpf.c:131:7: error: 'TC_CLSBPF_DESTROY' undeclared (first use in this function)
>   case TC_CLSBPF_DESTROY:
>        ^
> 
> Caused by commit
> 
>   31d3ad832948 ("netdevsim: add bpf offload support")
> 
> interacting with commit
> 
>   102740bd9436 ("cls_bpf: fix offload assumptions after callback conversion")
> 
> from the net tree.
> 
> I applied the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 21 Dec 2017 10:18:46 +1100
> Subject: [PATCH] netdevsim: fix up for "cls_bpf: fix offload assumptions after
>  callback conversion"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Hi Stephen, sorry about those merges today.  The proper fix is queued
up in patchwork for when net-next is merged in to net:

http://patchwork.ozlabs.org/patch/851063/

I will CC you on patches which may cause/fix merge trouble in the
future, often the information about how to resolve the conflict is
not part of the commit message.

Sorry I didn't think about CCing you earlier!

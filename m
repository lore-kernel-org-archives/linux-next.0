From: Sabrina Dubroca <sd@queasysnail.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Tue, 3 Jul 2018 09:34:40 +0200
Message-ID: <20180703073440.GA9437@bistromath.localdomain>
References: <20180703104712.30a36f1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703104712.30a36f1a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

2018-07-03, 10:47:12 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
[...]
> I took a guess and aplied the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 3 Jul 2018 10:37:05 +1000
> Subject: [PATCH] net: update for conversion of GRO SKB handling
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks Stephen, this looks correct.

-- 
Sabrina

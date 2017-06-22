From: Alan Modra <amodra@gmail.com>
Subject: Re: linux-next: build failure after merge of most trees
Date: Thu, 22 Jun 2017 23:43:10 +0930
Message-ID: <20170622141310.GF8406@bubble.grove.modra.org>
References: <20170622152441.3704b3d9@canb.auug.org.au>
 <20170622184116.0ebaabd9@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170622184116.0ebaabd9@roar.ozlabs.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jun 22, 2017 at 06:41:16PM +1000, Nicholas Piggin wrote:
> Is there any way for the linker to place the inputs to avoid unresolvable
> relocations where possible?

Not without quite a lot of work writing support for that feature.

-- 
Alan Modra
Australia Development Lab, IBM

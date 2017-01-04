From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: build failure after merge of the swiotlb tree
Date: Tue, 3 Jan 2017 19:11:38 -0500
Message-ID: <20170104001138.GA22030@char.us.oracle.com>
References: <20170104105749.6f305c35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170104105749.6f305c35@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Jan 04, 2017 at 10:57:49AM +1100, Stephen Rothwell wrote:
> Hi Konrad,
> 
> After merging the swiotlb tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> net/bridge/br_input.o: In function `.swiotlb_max_segment':
> (.text+0x780): multiple definition of `.swiotlb_max_segment'
> net/bridge/br.o:br.c:(.text+0x3c0): first defined here
> 
> and many, many more :-(
> Caused by commit
> 
>   f196f1294fd2 ("swiotlb: Export swiotlb_max_segment to users")
> 
> Forgotten "static nline" in include/linux/swiotlb.h ...

Duh!

	Fixed it up and pushed the fix in. Thanks!
> 
> I have used the swiotlb tree from next-20170103 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell

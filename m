From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the net-next
 tree
Date: Thu, 20 Dec 2018 07:32:25 +0100
Message-ID: <20181220063225.GA2294@kroah.com>
References: <20181220170253.011d0b10@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181220170253.011d0b10@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 20, 2018 at 05:02:53PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/ptp/ptp_clock.c
> 
> between commit:
> 
>   aea0a897af9e ("ptp: Fix pass zero to ERR_PTR() in ptp_clock_register")
> 
> from the net-next tree and commit:
> 
>   b9d93594c767 ("ptp: fix an IS_ERR() vs NULL check")
> 
> from the char-misc tree.
> 
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks for the merge fix, that is correct.

greg k-h

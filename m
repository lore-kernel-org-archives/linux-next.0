From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Fri, 26 Apr 2019 08:25:48 +0200
Message-ID: <20190426062548.GB5920@kroah.com>
References: <20190426155653.2cdebc5d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190426155653.2cdebc5d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Patrick Venture <venture@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 26, 2019 at 03:56:53PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/misc/aspeed-p2a-ctrl.c: In function 'aspeed_p2a_mmap':
> drivers/misc/aspeed-p2a-ctrl.c:110:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>   pgprot_t prot = vma->vm_page_prot;
>   ^~~~~~~~
> 
> Introduced by commit
> 
>   01c60dcea9f7 ("drivers/misc: Add Aspeed P2A control driver")

Patrick, I thought you fixed all of these already?  Can you send a patch
again?

Can you also make the driver so it can build with CONFIG_COMPILE_TEST
enabled so that others can find your problems earlier in the review
process?

thanks,

greg k-h

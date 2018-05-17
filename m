From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Thu, 17 May 2018 07:06:57 -0300
Message-ID: <20180517070657.642d3784@vento.lan>
References: <20180517141727.3119e1da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180517141727.3119e1da@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alan Cox <alan@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Em Thu, 17 May 2018 14:17:27 +1000
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/media/atomisp/TODO
> 
> between commit:
> 
>   51b8dc5163d2 ("media: staging: atomisp: Remove driver")
> 
> from the v4l-dvb tree and commit:
> 
>   1bd421154821 ("staging: atomisp: Augment TODO file with GPIO work item")
> 
> from the staging tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

Hi Stephen,

What do you use in order to check it? Maybe we could have some git
hook running such check, in order to prevent merging patches without
the right SOBs.

Thanks,
Mauro

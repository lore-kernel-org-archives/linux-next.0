From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the staging
 tree
Date: Mon, 22 Feb 2016 17:36:25 -0800
Message-ID: <20160223013625.GA761@kroah.com>
References: <20160216135548.6da63be6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160216135548.6da63be6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shraddha Barke <shraddha.6596@gmail.com>, Christoffer Dall <christoffer.dall@linaro.org>, Jason Hu <jia-cheng.hu@intel.com>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 16, 2016 at 01:55:48PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/platform/goldfish/goldfish_pipe.c
> 
> between commit:
> 
>   1d427da1d7f9 ("Platform: goldfish: goldfish_pipe.c: Add DMA support using managed version")
> 
> from the staging tree and commits:
> 
>   2f3be88237a3 ("goldfish_pipe: Pin pages to memory while copying and other cleanups")
>   d62f324b0ac8 ("goldfish: Enable ACPI-based enumeration for android pipe")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks for letting me know. I've now pulled in the char-misc tree into
staging due to the confusion that was happening with this driver, people
were modifying it in both repos, so now everything should be synced up.

thanks,

greg k-h

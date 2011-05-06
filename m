From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the trivial tree with the ux500-core tree
Date: Fri, 6 May 2011 11:29:43 +0200
Message-ID: <BANLkTimHgUorm4HKuX7veUNR6M1o9LiTNA@mail.gmail.com>
References: <20110429115948.e949234b.sfr@canb.auug.org.au>
	<BANLkTikJ5CVvS+P17T_Mhtqyb29vpDcmvw@mail.gmail.com>
	<alpine.LNX.2.00.1105051547000.28291@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1105051547000.28291@pobox.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

2011/5/5 Jiri Kosina <jkosina@suse.cz>:
> On Fri, 29 Apr 2011, Linus Walleij wrote:
>>
>> I rewrote the driver completely so likely it will rather be dropped, but
>> please check! I'll be happy to carry any patches.
>
> Seems to me that all the calls to request_mem_region() and
> release_mem_region() still need the resource_size() fixup even in the new
> driver.

OK I went in and tweaked the patch like this:

	if (request_mem_region(gpio->memres->start,
			       resource_size(gpio->memres),
			       "GPIO Controller")
	    == NULL) {
		dev_err(gpio->dev, "could not reserve GPIO memory region\n");
		err = -ENODEV;
		goto err_no_ioregion;
	}
(...)
err_no_ioremap:
	release_mem_region(gpio->memres->start, resource_size(gpio->memres));
(...)
	release_mem_region(gpio->memres->start,
			   resource_size(gpio->memres));

It'll appear in the next tree tomorrow or so. OK?

Yours,
Linus Walleij

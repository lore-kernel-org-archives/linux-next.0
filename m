From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the battery tree
Date: Fri, 2 Oct 2015 11:49:32 +1000
Message-ID: <20151002114932.043376ca@canb.auug.org.au>
References: <20150929114531.2d611a2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60981 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750868AbbJBBtf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Oct 2015 21:49:35 -0400
In-Reply-To: <20150929114531.2d611a2a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Belisko <marek@goldelico.com>

Hi Sebastian,

On Tue, 29 Sep 2015 11:45:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the battery tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> ERROR (phandle_references): Reference to non-existent node or label "twl4030_madc"
> ERROR: Input tree has errors, aborting (use -f to force output)
> scripts/Makefile.lib:293: recipe for target 'arch/arm/boot/dts/omap3-beagle-xm-ab.dtb' failed
> 
> and many more ...
> 
> Caused by commit
> 
>   af19161aaed7 ("ARM: dts: twl4030: Add iio properties for bci subnode")
> 
> Presumably some updates to other files were missed.
> 
> I have used the battery tree from next-20150925 fot today.

I am still getting this error.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

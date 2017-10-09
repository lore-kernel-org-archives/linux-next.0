From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the media tree
Date: Mon, 9 Oct 2017 21:05:32 +0200
Message-ID: <20171009190532.GA4335@kroah.com>
References: <20171009182653.5phanxtnwwtrx34e@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:40743 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754018AbdJITFX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Oct 2017 15:05:23 -0400
Content-Disposition: inline
In-Reply-To: <20171009182653.5phanxtnwwtrx34e@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Aishwarya Pant <aishpant@gmail.com>, Branislav Radocaj <branislav@radocaj.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Oct 09, 2017 at 07:26:54PM +0100, Mark Brown wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_firmware.c
> 
> between commit:
> 
>    866af46e6ebbc ("media: Staging: atomisp: fix alloc_cast.cocci warnings")
> 
> from the media tree and commit:
> 
>    4d962df5a7771 ("atomisp2: remove cast from memory allocation")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.


What fix?  :(

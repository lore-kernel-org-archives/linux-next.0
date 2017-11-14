From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: linux-next: manual merge of the staging tree with the media tree
Date: Wed, 15 Nov 2017 01:28:06 +0200
Message-ID: <20171114232805.vvb5jbpf4fuwkw76@kekkonen.localdomain>
References: <20171009182653.5phanxtnwwtrx34e@sirena.co.uk>
 <20171113162433.3ad70a11@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:2432 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755591AbdKNX2M (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Nov 2017 18:28:12 -0500
Content-Disposition: inline
In-Reply-To: <20171113162433.3ad70a11@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Mark Brown <broonie@kernel.org>, Aishwarya Pant <aishpant@gmail.com>, Branislav Radocaj <branislav@radocaj.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stephen, Greg, others,

On Mon, Nov 13, 2017 at 04:24:47PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 9 Oct 2017 19:26:54 +0100 Mark Brown <broonie@kernel.org> wrote:
> >
> > Hi Greg,
> > 
> > Today's linux-next merge of the staging tree got a conflict in:
> > 
> >   drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_firmware.c
> > 
> > between commit:
> > 
> >    866af46e6ebbc ("media: Staging: atomisp: fix alloc_cast.cocci warnings")
> > 
> > from the media tree and commit:
> > 
> >    4d962df5a7771 ("atomisp2: remove cast from memory allocation")
> > 
> > from the staging tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Just a reminder that this conflict still exists.

Both patches essentially contain the same change, the difference is in the
indentation only. There's a number of atomisp patches in the media tree,
how about simply reverting the patch in the staging tree?

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com

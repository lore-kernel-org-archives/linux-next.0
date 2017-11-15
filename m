From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: Re: linux-next: manual merge of the staging tree with the media
 tree
Date: Tue, 14 Nov 2017 23:25:20 -0200
Message-ID: <20171114232520.1079a5c3@vento.lan>
References: <20171009182653.5phanxtnwwtrx34e@sirena.co.uk>
        <20171113162433.3ad70a11@canb.auug.org.au>
        <20171114232805.vvb5jbpf4fuwkw76@kekkonen.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from osg.samsung.com ([64.30.133.232]:45515 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752092AbdKOBZ1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Nov 2017 20:25:27 -0500
In-Reply-To: <20171114232805.vvb5jbpf4fuwkw76@kekkonen.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Mark Brown <broonie@kernel.org>, Aishwarya Pant <aishpant@gmail.com>, Branislav Radocaj <branislav@radocaj.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Em Wed, 15 Nov 2017 01:28:06 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Stephen, Greg, others,
> 
> On Mon, Nov 13, 2017 at 04:24:47PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Mon, 9 Oct 2017 19:26:54 +0100 Mark Brown <broonie@kernel.org> wrote:  
> > >
> > > Hi Greg,
> > > 
> > > Today's linux-next merge of the staging tree got a conflict in:
> > > 
> > >   drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_firmware.c
> > > 
> > > between commit:
> > > 
> > >    866af46e6ebbc ("media: Staging: atomisp: fix alloc_cast.cocci warnings")
> > > 
> > > from the media tree and commit:
> > > 
> > >    4d962df5a7771 ("atomisp2: remove cast from memory allocation")
> > > 
> > > from the staging tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.  
> > 
> > Just a reminder that this conflict still exists.  
> 
> Both patches essentially contain the same change, the difference is in the
> indentation only. There's a number of atomisp patches in the media tree,
> how about simply reverting the patch in the staging tree?

Today morning I merged the changeset from staging tree that Greg 
sent to Linux (and that was already merged upstream), solving the conflict.

So, except if something else pops up, the conflict at -next will
cease to exist after it gets merged back there :-)

Regards,
Mauro

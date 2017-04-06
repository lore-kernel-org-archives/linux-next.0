From: Sean Young <sean@mess.org>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Thu, 6 Apr 2017 21:39:05 +0100
Message-ID: <20170406203905.GA20704@gofer.mess.org>
References: <20170406133420.3e231d2a@canb.auug.org.au>
 <20170406185857.GA19194@gofer.mess.org>
 <20170406191922.GB6631@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gofer.mess.org ([88.97.38.141]:42821 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753742AbdDFUjI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Apr 2017 16:39:08 -0400
Content-Disposition: inline
In-Reply-To: <20170406191922.GB6631@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Derek Robson <robsonde@gmail.com>

On Thu, Apr 06, 2017 at 09:19:22PM +0200, Greg KH wrote:
> On Thu, Apr 06, 2017 at 07:58:57PM +0100, Sean Young wrote:
> > On Thu, Apr 06, 2017 at 01:34:20PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the staging tree got conflicts in:
> > > 
> > >   drivers/staging/media/lirc/lirc_sasem.c
> > >   drivers/staging/media/lirc/lirc_sir.c
> > > 
> > > between commits:
> > > 
> > >   e66267161971 ("[media] rc: promote lirc_sir out of staging")
> > >   51bb3fd788cb ("[media] staging: lirc_sasem: remove")
> > > 
> > > from the v4l-dvb tree and commit:
> > > 
> > >   87ddb91067b9 ("Staging: media: lirc - style fix")
> > 
> > There are two commits which do similar things. In the v4l-dvb tree we have
> > 5cd6522 ("[media] staging: lirc: use octal instead of symbolic permission"
> > and in the staging tree there is 
> > 87ddb91067b9 ("Staging: media: lirc - style fix")
> > 
> > Is it possible to drop the latter from the staging tree? That would resolve
> > the issue.
> 
> I can revert the staging patch, if that really helps anything.  Is is
> really an issue as both patches do the same thing?

I think this is happening:

On the v4l-dvb tree, 5cd6522 modifies both lirc_sasem.c and lirc_sir.c;
then both files are removed. Now 87ddb91067b9 is merged from the staging
tree and both files don't exist any more, so it no longer applies even
though the patch is the same.

If I drop 87ddb91067b9 from staging-next, I can merge it to v4l-dvb, 
otherwise I get merge conflicts.

Thanks
Sean

From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Date: Fri, 9 Jun 2017 07:59:05 -0400
Message-ID: <20170609115905.GA11110@redhat.com>
References: <20170609131237.41b77828@canb.auug.org.au>
 <e56ef218-bbbd-2445-3cd4-4ff1dd05d3e7@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47298 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751524AbdFIL7H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Jun 2017 07:59:07 -0400
Content-Disposition: inline
In-Reply-To: <e56ef218-bbbd-2445-3cd4-4ff1dd05d3e7@wdc.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alasdair G Kergon <agk@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jun 09 2017 at 12:28am -0400,
Damien Le Moal <damien.lemoal@wdc.com> wrote:

> Stephen,
> 
> On 6/9/17 12:12, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the device-mapper tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/md/dm-zoned-target.c:947:2: error: unknown field 'suspend' specified in initializer
> >   .suspend  = dmz_suspend,
> >   ^
> > drivers/md/dm-zoned-target.c:947:14: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> >   .suspend  = dmz_suspend,
> >               ^
> > 
> > Caused by commit
> > 
> >   02da2e15e81f ("dm zoned: drive-managed zoned block device target")
> > 
> > I have used the device-mapper tree from next-20170608 for today.
> 
> My apologies for that. My mistake.
> I just posted a patch to dm-devel to fix this.
> Everything should come in order after Mike's review.

I'm to blame for the above issue.  I've now fixed it up.

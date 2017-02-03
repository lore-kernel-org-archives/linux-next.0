From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Thu, 2 Feb 2017 22:24:35 -0200
Message-ID: <20170202222435.2798402e@vento.lan>
References: <20170131115505.3f8c769b@canb.auug.org.au>
        <20170203092446.7e86e8af@canb.auug.org.au>
        <20170202204620.75b20605@vento.lan>
        <20170203095934.2bbbbf45@canb.auug.org.au>
        <20170202212440.5e514ebc@vento.lan>
        <20170203110117.4a0c5628@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:51084
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751570AbdBCAYm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Feb 2017 19:24:42 -0500
In-Reply-To: <20170203110117.4a0c5628@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Young <sean@mess.org>

Em Fri, 3 Feb 2017 11:01:17 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Mauro,
> 
> On Thu, 2 Feb 2017 21:24:40 -0200 Mauro Carvalho Chehab <mchehab@osg.samsung.com> wrote:
> >
> > I actually push the patches on a different tree:
> > 	git://linuxtv.org/media_tree.git
> > 
> > At the branches "master" and "fixes", where
> > 
> > master - for rolling develoment patches
> > fixes - for bug fixes against current -rc release  
> 
> So maybe I should fetch those 2 branches separately and save you the
> bother of merging them yourself?  There will be occasional conflicts,
> but I get those with others trees as well.

Yeah, that makes sense.

> 
> > My current procedure is to manually merge both branches
> > at git://linuxtv.org/mchehab/media-next.git, but this is a manual
> > work, that I use to do by the end of the days I merge patches.
> > Unfortunately, sometimes, I got side-tracked by something and
> > I forget to do such manual merge.  
> 
> Unless you need to do that for your own testing.

Yes, when I merge there, I usually run a batch process that takes
about 2 hours on my current build machine[1] and compile it with 57
different config/arch combinations.

[1] I'm waiting for a new machine that will hopefully reduce it.

With Kernel test robot, this usually get good results.

It would be still interesting if you could pull from it, as
sometimes I need to create topic branches (either when there's
a controversial patchset that I would be sending in separate, or
when I need to pull from some other subsystem tree to solve a
complex merge conflict).

So, if this is not a problem to you, maybe you can setup your
environment to pull (in this order) from:

	git://linuxtv.org/media_tree.git fixes
	git://linuxtv.org/media_tree.git master
	git://linuxtv.org/mchehab/media-next.git master

Most of the time, the last pull won't get anything.

-- 
Thanks,
Mauro

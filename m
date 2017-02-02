From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Thu, 2 Feb 2017 20:46:20 -0200
Message-ID: <20170202204620.75b20605@vento.lan>
References: <20170131115505.3f8c769b@canb.auug.org.au>
        <20170203092446.7e86e8af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:50576
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751726AbdBBWq2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Feb 2017 17:46:28 -0500
In-Reply-To: <20170203092446.7e86e8af@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Young <sean@mess.org>

Em Fri, 3 Feb 2017 09:24:46 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Mauro,
> 
> On Tue, 31 Jan 2017 11:55:05 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the v4l-dvb tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > In file included from arch/arm/mach-omap2/pdata-quirks.c:15:0:
> > arch/arm/mach-omap2/pdata-quirks.c:536:49: error: 'rx51_lirc_data' undeclared here (not in a function)
> >   OF_DEV_AUXDATA("nokia,n900-ir", 0, "n900-ir", &rx51_lirc_data),
> >                                                  ^
> > include/linux/of_platform.h:52:21: note: in definition of macro 'OF_DEV_AUXDATA'
> >     .platform_data = _pdata }
> >                      ^
> > 
> > Caused by commit
> > 
> >   a92def1becf3 ("[media] ir-rx51: port to rc-core")
> > 
> > I have used the v4l-dvb tree from next-20170130 for today.  
> 
> I am still getting this error.

Gah, forgot to push the fix on the -next branch. Should be ok now.

Regards,
Mauro

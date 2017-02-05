From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 6 Feb 2017 09:19:14 +1100
Message-ID: <20170206091914.56836dd3@canb.auug.org.au>
References: <20170131115505.3f8c769b@canb.auug.org.au>
        <20170203092446.7e86e8af@canb.auug.org.au>
        <20170202204620.75b20605@vento.lan>
        <20170203095934.2bbbbf45@canb.auug.org.au>
        <20170202212440.5e514ebc@vento.lan>
        <20170203110117.4a0c5628@canb.auug.org.au>
        <20170202222435.2798402e@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51819 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751416AbdBEWTR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Feb 2017 17:19:17 -0500
In-Reply-To: <20170202222435.2798402e@vento.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Young <sean@mess.org>

Hi Mauro,

On Thu, 2 Feb 2017 22:24:35 -0200 Mauro Carvalho Chehab <mchehab@osg.samsung.com> wrote:
>
> So, if this is not a problem to you, maybe you can setup your
> environment to pull (in this order) from:
> 
> 	git://linuxtv.org/media_tree.git fixes
> 	git://linuxtv.org/media_tree.git master
> 	git://linuxtv.org/mchehab/media-next.git master
> 
> Most of the time, the last pull won't get anything.

OK, from today I have those three trees called v4l-dvb-fixes, v4l-dvb
and v4l-dvb-next respectively.  We'll see how it goes.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window. 

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and 
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

-- 
Cheers,
Stephen Rothwell 
sfr@canb.auug.org.au

From: Adrian Bunk <bunk@kernel.org>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Fri, 18 Jul 2008 13:49:54 +0300
Message-ID: <20080718104954.GG18326@cs181140183.pp.htv.fi>
References: <20080718182015.bf3ef4e5.sfr@canb.auug.org.au> <20080718094912.42d9c043@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:34810 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752040AbYGRKuP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 06:50:15 -0400
Content-Disposition: inline
In-Reply-To: <20080718094912.42d9c043@the-village.bc.nu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>

On Fri, Jul 18, 2008 at 09:49:12AM +0100, Alan Cox wrote:
> On Fri, 18 Jul 2008 18:20:15 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Alan,
> > 
> > Today's linux-next merge of the ttydev tree got a conflict in
> > drivers/net/wireless/strip.c between commit
> > 94d9842403f770239a656586442454b7a8f2df29 ("remove the strip driver") from
> > the wireless tree and commit 08bec19ee22b6d02bf354323e6b5a3e61070c04a
> > ("tty-fix-strip") from the ttydev tree.
> > 
> > I just removed the file for now.
> > 
> > I think I remember some discussion of this a while ago ...
> 
> 
> Yes - the strip driver should not be getting dropped. I asked Adrian to
> stop this. I am suprised he hasn't done so.

mea culpa

That got lost somewhere in my linux-kernel folder.

John, can you either drop my commit or add a revert commit for the 
driver removal commit?

> Alan

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

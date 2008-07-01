From: Adrian Bunk <bunk@kernel.org>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 17:43:31 +0300
Message-ID: <20080701144330.GA32598@cs181140183.pp.htv.fi>
References: <20080702000712.3698a7f9.sfr@canb.auug.org.au> <20080701151205.2b728f94@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp5.pp.htv.fi ([213.243.153.39]:52631 "EHLO smtp5.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754395AbYGAOnu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 10:43:50 -0400
Content-Disposition: inline
In-Reply-To: <20080701151205.2b728f94@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, Jul 01, 2008 at 03:12:05PM +0100, Alan Cox wrote:
> On Wed, 2 Jul 2008 00:07:12 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi ,
> > 
> > Today's linux-next merge of the ttydev tree got a conflict in
> > drivers/net/wireless/strip.c between commit
> > 94d9842403f770239a656586442454b7a8f2df29 ("remove the strip driver") from
> > the net tree and commit 7636d4eb65deca18568e3ec4bfa65b85078042ce
> > ("01-ldisc-ref") from the ttydev tree.
> > 
> > The former removed the file.
> 
> Perhaps whoever removed the file would care to talk to the tty driver
> maintainer before doing so - please drop the strip driver removal. It
> still has a couple of users

When we discussed the removal of the driver we weren't able to find any 
realistic chance that people both have this hardware and this kind of 
wireless network.

What users do you know about?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

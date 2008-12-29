From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Sun, 28 Dec 2008 20:00:55 -0800 (PST)
Message-ID: <20081228.200055.170405541.davem@davemloft.net>
References: <20081208144851.c02cc7da.sfr@canb.auug.org.au>
	<20081207.232658.64516148.davem@davemloft.net>
	<20081229145300.0a86e1de.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:53911
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752242AbYL2EAx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Dec 2008 23:00:53 -0500
In-Reply-To: <20081229145300.0a86e1de.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, johannes@sipsolutions.net, sam@ravnborg.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Dec 2008 14:53:00 +1100

> Hi Dave,
> 
> On Sun, 07 Dec 2008 23:26:58 -0800 (PST) David Miller <davem@davemloft.net> wrote:
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 8 Dec 2008 14:48:51 +1100
> > 
> > > Today's linux-next merge of the net tree got a conflict in
> > > arch/sparc64/kernel/idprom.c between commit
> > > a88b5ba8bd8ac18aad65ee6c6a254e2e74876db3 (sparc,sparc64: unify kernel/"")
> > > from the sparc tree and commit 7c510e4b730a92cecf94ada45c989d8be0200d47
> > > ("net: convert more to %pM") from the net tree.
> > 
> > Thanks for reporting this.
> > 
> > > The former renamed the file while the latter modified it.  I just deleted
> > > the renamed file for now, the %pM conversion can be done later.
> > 
> > Yes it's probably the best way to handle this for now.
> 
> This conflict is now between the sparc tree and Linus' tree ...

I'll take care of this as I prepare the sparc-next-2.6 tree for
merging.

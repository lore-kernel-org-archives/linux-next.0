From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the mailbox
 tree
Date: Thu, 20 Jun 2013 23:53:10 -0700
Message-ID: <20130621065310.GK5523@atomide.com>
References: <20130621162656.bb94e0fa8b6813781b804a73@canb.auug.org.au>
 <20130621164149.598b39bb78b6015057d03f6f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:62343 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758607Ab3FUGxS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Jun 2013 02:53:18 -0400
Content-Disposition: inline
In-Reply-To: <20130621164149.598b39bb78b6015057d03f6f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>, Omar Ramirez Luna <omar.ramirez@copitl.com>, Loic Pallardy <loic.pallardy@st.com>

* Stephen Rothwell <sfr@canb.auug.org.au> [130620 23:48]:
> Hi all,
> 
> On Fri, 21 Jun 2013 16:26:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the arm-soc tree got a conflict in
> > drivers/mailbox/Kconfig between commit a1824eaab70f ("mailbox: OMAP:
> > introduce mailbox framework") from the mailbox tree and commit
> > c869c75c16b3 ("mailbox/omap: move the OMAP mailbox framework to drivers")
> > from the arm-soc tree.
> > 
> > I fixed it up (I suspect not properly - see below) and can carry the fix
> > as necessary (no action is required).
> > 
> > It looks like we have two different versions of these changes in
> > linux-next now, so please clean it all up.  i.e. can I just drop the
> > mailbox tree now?
> 
> OK, things went steeply downhill from here, so I went back and removed
> the mailbox tree ...

I think Olof dropped the earlier version of the mailbox branch, and
remerged the updated mailbox branch. So if there was also yet another
mailbox branch being pulled into Linux next, then yes, dropping it is
the way to go.

Regards,

Tony

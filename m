From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the mailbox tree
Date: Fri, 21 Jun 2013 09:36:09 +0200
Message-ID: <201306210936.09593.arnd@arndb.de>
References: <20130621162656.bb94e0fa8b6813781b804a73@canb.auug.org.au> <CAOesGMjszju75jo6Ej6C=0-rfdPLuEj0mwmU1zYvFvYw1dyQCA@mail.gmail.com> <20130621071239.GM5523@atomide.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:65006 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161296Ab3FUHgm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Jun 2013 03:36:42 -0400
In-Reply-To: <20130621071239.GM5523@atomide.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Olof Johansson <olof@lixom.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>, Omar Ramirez Luna <omar.ramirez@copitl.com>, Loic Pallardy <loic.pallardy@st.com>

On Friday 21 June 2013, Tony Lindgren wrote:
> > I wonder if this mess is caused by the fact that I did the revert
> > instead of rebuilding our for-next and dropping the merge in the first
> > place.
> > 
> > I'll rebuild our for-next (or maybe Arnd will beat me to it) before
> > next linux-next build, i.e. Sunday night my time.
> 
> Could be, especially if some of the commits are the same in the reverted
> branch and newly merged branch as git might think that some merges have
> been already resolved the right way earlier.

I already rebuilt the arm-soc tree before Stephen started with today's
linux-next, so I think the conflict is elsewhere.

It's probably best if Suman Anna rebases the mailbox tree on top of
the omap mailbox branch that I took.

	Arnd

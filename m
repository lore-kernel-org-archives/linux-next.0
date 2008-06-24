From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: manual merge of the firmware tree
Date: Tue, 24 Jun 2008 09:04:37 +0100
Message-ID: <1214294678.27974.58.camel@shinybook.infradead.org>
References: <20080624165508.b9bcabbe.sfr@canb.auug.org.au>
	 <20080624175706.21d5f02d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:42437 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752081AbYFXIEi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Jun 2008 04:04:38 -0400
In-Reply-To: <20080624175706.21d5f02d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, 2008-06-24 at 17:57 +1000, Stephen Rothwell wrote:
> Hi David,
> 
> On Tue, 24 Jun 2008 16:55:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the firmware tree got a conflict in
> > drivers/net/Kconfig between commit
> > 158d7abdae85e9ac43d99780c372d79c119f7626 ("tg3: Add mdio bus
> > registration") from the  tree and commit
>                           ^
> "net"

I've been doing nothing about many of these mails, on the assumption
that that's the most useful thing to do.

I can't really merge the net tree into mine and I assume you already
_have_ the fix and a way to make sure it remains applied if you re-pull?

Do let me know if there's something else I could do to make it easier on
your side.

-- 
dwmw2

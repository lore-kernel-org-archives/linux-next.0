From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the omap_dss2 tree
Date: Fri, 9 Mar 2012 11:50:11 +0000
Message-ID: <201203091150.11294.arnd@arndb.de>
References: <20120308170048.f1a992bca2ca2d93fa9747bf@canb.auug.org.au> <201203081616.12510.arnd@arndb.de> <1331285751.1927.20.camel@deskari>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:51192 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751590Ab2CILua (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Mar 2012 06:50:30 -0500
In-Reply-To: <1331285751.1927.20.camel@deskari>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>

On Friday 09 March 2012, Tomi Valkeinen wrote:
> On Thu, 2012-03-08 at 16:16 +0000, Arnd Bergmann wrote:
> > On Thursday 08 March 2012, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the arm-soc tree got a conflict in
> > > arch/arm/mach-omap1/board-palmtt.c between commit ddba6c7f7ec6 ("OMAP1:
> > > pass LCD config with omapfb_set_lcd_config()") from the omap_dss2 tree
> > > and commit 2e3ee9f45b3c ("ARM: OMAP1: Move most of plat/io.h into local
> > > iomap.h") from the arm-soc tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary.
> > 
> > Hi Stephen,
> > 
> > Thanks for fixing up all the conflicts between arm-soc and omap_dss2.
> > I think we should make sure they are resolved in one of the trees before
> > the merge window.
> 
> Do we need to? The conflicts seemed to be trivial ones, like arm-soc
> adds/removes something that just happens to be next to something else
> that I add/remove.
> 
> My understanding is that it's better to leave those conflicts than to do
> "trickery" to avoid them.

Each of the conflicts is simple enough, but I feel it's worth resolving
them in this case because there are a number of them. Looking at them
again now, it's probably ok either way -- resolving them now or letting
Linus take care of them.

> > Tomi, what are your plans for the omap_dss2 branch to get merged?
> 
> Normally my tree goes via fbdev-tree (Florian's tree) to mainline.

ok.

> > Do you think you should send it to Linus first and we merge it into
> > arm-soc to resolve the conflicts?
> > Or do you want to merge it through the arm-soc tree?
> > Or should we go first and you fix up the conflicts by pulling in the
> > necessary topic branches from arm-soc into your tree?
> 
> If we want to resolve the conflicts, perhaps it's simplest if the dss
> tree is merged to arm-soc.

Ok. Maybe we'll just merge them in case Florian is upstream faster and
not merge them otherwise.

	Arnd

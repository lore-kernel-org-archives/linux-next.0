From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the staging tree
Date: Wed, 16 May 2012 13:41:47 +0000
Message-ID: <201205161341.47440.arnd@arndb.de>
References: <20120516185812.ce1ab57c3ec72445135a35fc@canb.auug.org.au> <201205161303.35080.arnd@arndb.de> <20120516131021.GA32351@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:55385 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967496Ab2EPNoW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 May 2012 09:44:22 -0400
In-Reply-To: <20120516131021.GA32351@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

On Wednesday 16 May 2012, Greg KH wrote:
> On Wed, May 16, 2012 at 01:03:34PM +0000, Arnd Bergmann wrote:
> > The staging tree version adds contents to at91sam9g20.dtsi, and the context
> > gets moved to at91sam9260.dtsi in arm-soc. If we want to resolve it now,
> > I think the best way is to add the change to at91sam9260.dtsi in arm-soc
> > and let you drop that part in staging. There are no hard dependencies
> > since this is new code and it the driver is still correct without the
> > change, it simply won't find the device.
> 
> Ok, so if we leave it as-is for now, we can resolve it after 3.5-rc1 is
> out and we see what branch ended up "winning"?  :)

Yes, works for me.

	Arnd

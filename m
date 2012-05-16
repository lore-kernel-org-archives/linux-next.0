From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the staging
 tree
Date: Wed, 16 May 2012 05:48:51 -0700
Message-ID: <20120516124851.GA32064@kroah.com>
References: <20120516185812.ce1ab57c3ec72445135a35fc@canb.auug.org.au>
 <201205161054.15610.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55909 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933389Ab2EPMsy (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 16 May 2012 08:48:54 -0400
Content-Disposition: inline
In-Reply-To: <201205161054.15610.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

On Wed, May 16, 2012 at 10:54:15AM +0000, Arnd Bergmann wrote:
> On Wednesday 16 May 2012, Stephen Rothwell wrote:
> > Today's linux-next merge of the arm-soc tree got a conflict in
> > arch/arm/boot/dts/at91sam9g20.dtsi between commit 7cb2e629a240 ("ARM:
> > AT91: Add ADC driver to the at91sam9g20 dtsi") from the staging tree and
> > commit 5b6089cb6f28 ("ARM: at91: add at91sam9260 DT support") from the
> > arm-soc tree.
> > 
> > So, I didn't know what to do with this, so I used the arm-soc version of
> > this file (effectively throwing away the staging tree change).  Hints,
> > anyone?
> 
> I suspect the addition of the adc node should just go into the
> at91sam9260.dtsi file.

So does that mean that the staging tree version is correct?  Or that
someone needs to send me a fixup patch here?

confused,

greg k-h

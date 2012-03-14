From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] x86: export 'pcibios_enabled'
Date: Wed, 14 Mar 2012 09:29:55 +0000
Message-ID: <20120314092955.2250a782@pyramind.ukuu.org.uk>
References: <20120313204114.e160849af7dbe5a4b4e5c0ad@canb.auug.org.au>
	<4F5FAE63.3090908@xenotime.net>
	<4F5FE9AD.7000204@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:40827 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759677Ab2CNJ2j (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Mar 2012 05:28:39 -0400
In-Reply-To: <4F5FE9AD.7000204@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Michal Januszewski <spock@gentoo.org>, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, linux-fbdev@vger.kernel.org, x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>

> >  
> >  int pcibios_enabled;
> > +EXPORT_SYMBOL(pcibios_enabled);
> >  
> >  /* According to the BIOS specification at:
> >   * http://members.datafast.net.au/dft0802/specs/bios21.pdf, we could
> 
> I would think this should be EXPORT_SYMBOL_GPL()... this seems like a
> symbol with a very high likelihood to be abused in strange ways.

We don't need to expose it anyway

uvesafb could look for any PCI vga class device - which I suspect is
what it *should* be doing ?

Alan

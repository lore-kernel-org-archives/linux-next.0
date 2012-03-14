From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] x86: export 'pcibios_enabled'
Date: Wed, 14 Mar 2012 11:21:37 +0000
Message-ID: <20120314112137.68fa4f70@pyramind.ukuu.org.uk>
References: <20120313204114.e160849af7dbe5a4b4e5c0ad@canb.auug.org.au>
	<4F5FAE63.3090908@xenotime.net>
	<4F5FE9AD.7000204@zytor.com>
	<20120314092955.2250a782@pyramind.ukuu.org.uk>
	<4F607A18.8080004@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:43707 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752414Ab2CNLUI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Mar 2012 07:20:08 -0400
In-Reply-To: <4F607A18.8080004@gmx.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Michal Januszewski <spock@gentoo.org>, linux-fbdev@vger.kernel.org, x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>, Wang YanQing <udknight@gmail.com>

> > uvesafb could look for any PCI vga class device - which I suspect is
> > what it *should* be doing ?
> 
> Would this really change depending on whether the page is NX-protected
> or not?
> Your suggestion sounds like it is about detecting whether there is any
> graphic chip present or not while the patch is about fixing an oops
> caused by NX-protection of the BIOS.

Right yes.. I misunderstood what you are trying to do. I'd assumed you
wanted to find the ROM and thus set it to the right mapping mode.

You can use set_memory_x() to mark memory executable (and _nx to set it back).

If you really need to know if NX is being used then the check

	if (__supported_pte_mask & PTE_NX)

will do the trick and the variable is exported.

I'd suggest however you wrap that in a cpu_has_nx() type macro somewhere
in the arch headers.

If you go poking around pcibios values you are going to get burned if
someone is ever bored enough to make NX and PCIBIOS work together
differently.

Alan

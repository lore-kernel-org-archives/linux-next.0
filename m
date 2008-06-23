From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next build poblems
Date: Mon, 23 Jun 2008 19:08:01 +0200
Message-ID: <20080623170801.GA16637@uranus.ravnborg.org>
References: <20080624022232.5c81519c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:49073 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758770AbYFWRHS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 13:07:18 -0400
Content-Disposition: inline
In-Reply-To: <20080624022232.5c81519c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Haavard Skinnemoen <hskinnemoen@atmel.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org

On Tue, Jun 24, 2008 at 02:22:32AM +1000, Stephen Rothwell wrote:
> Hi Sam,
> 
> I haven't had a good look, but something has gone badly wrong with the
> arm, avr32 and sh builds of linux-next today.  Have a look at
> http://kisskb.ellerman.id.au/linux-next.
Looked at sh and this is obviously a kbuild-next.git problem.

I will try to look at it tonight - as in a few hours from now.
If you are in a hurry drop kbuild-next.git.

I have changed a few things around the symlink handling
and this was only tested with sparc and x86 (32 bit) as this
is the cross toolchains I have available on this box.

It is just perfect that -next find this before the merge window!

	Sam

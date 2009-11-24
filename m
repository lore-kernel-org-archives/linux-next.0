From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: tree addition request
Date: Tue, 24 Nov 2009 09:28:03 +0000
Message-ID: <20091124092803.GN23772@trinity.fluff.org>
References: <20091123223044.GM23772@trinity.fluff.org> <20091124105114.2149e4a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:43048 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932456AbZKXJ2F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Nov 2009 04:28:05 -0500
Content-Disposition: inline
In-Reply-To: <20091124105114.2149e4a0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-next@vger.kernel.org, Jean Delvare <khali@linux-fr.org>, Russell King <rmk@arm.linux.org.uk>

On Tue, Nov 24, 2009 at 10:51:14AM +1100, Stephen Rothwell wrote:
> Hi Ben,
> 
> On Mon, 23 Nov 2009 22:30:44 +0000 Ben Dooks <ben-linux@fluff.org> wrote:
> >
> > Is this the right place to request adding one/two trees to linux-next?
> 
> Yep.
> 
> > git://git.fluff.org/bjdooks/linux.git next-i2c
> 
> I already have an i2c quilt series from Jean Delvare
> <khali@linux-fr.org>, how does this relate to that?

I've been doing the more 'embedded' side of things, which means generally
the non-X86 side of things such as ARM, MIPS, etc. for the last couple of
releases.
 
> > git://git.fluff.org/bjdooks/linux.git next-samsung
> 
> This is a set of arm platforms, right?

This is the ARM support for a number of Samsung SoC/processors that
i've been maintaining for a long time now. A number of people have
requested these trees be included in -next now that the non-core ARM
code is being submitted directly to linus.
 
> I have added both these trees from today, assuming there are no
> objections.  I have called them bjdooks-i2c and sumsung respectively.
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgment of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
> 	Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.

Yes.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

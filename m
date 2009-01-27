From: Pavel Machek <pavel@suse.cz>
Subject: Re: X200 suspend issue / linux-next: Tree for January 21
Date: Tue, 27 Jan 2009 15:05:58 +0100
Message-ID: <20090127140558.GA24950@elf.ucw.cz>
References: <20090121150249.a87aca09.sfr@canb.auug.org.au> <20090121144420.GA20617@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:32816 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328AbZA0OGH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Jan 2009 09:06:07 -0500
Content-Disposition: inline
In-Reply-To: <20090121144420.GA20617@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed 2009-01-21 15:44:20, Nico -telmich- Schottelius wrote:
> Hello!
> 
> News: The system freezes for almost a second and wakes up again!
> 
> At least no crash this time!

Good.

Maybe the suspends-then-autoresumes exists in 2.6.29-rc2, too...? Can
you try disabling CONFIG_USB?
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

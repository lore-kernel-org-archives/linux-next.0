From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: cpufreq tree build failure
Date: Thu, 5 Feb 2009 16:34:51 -0500
Message-ID: <20090205213451.GA14664@redhat.com>
References: <20090205185420.38214a06.sfr@canb.auug.org.au> <200902051047.56609.trenn@suse.de> <20090205174536.GA6358@redhat.com> <200902052157.45344.trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:52179 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754402AbZBEVfA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 16:35:00 -0500
Content-Disposition: inline
In-Reply-To: <200902052157.45344.trenn@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Thu, Feb 05, 2009 at 09:57:44PM +0100, Thomas Renninger wrote:

 > > I added the 'static's directly to the patches, and regenerated the tree
 > > on kernel.org
 > > For other stuff, unless it's a build-fix, send an incremental diff ?
 > Yes, will do so.
 > But if possible, I'd like to wait for Ingo's
 > printk_once function popping up in linux-next.
 > How frequently are linux-next patches pulled back into the cpufreq tree?

There's no regular schedule. It typically happens if a) they get merged into
Linus tree, and b) I rebase the cpufreq tree (which I try to avoid where possible,
I try to only do it to get around a build failure, or if there's massive
conflicts with something else that got merged).

 > Anyway, I am going to look at your tree in a week or two and send
 > something then. It's only about a cleaned up message in broken BIOS case,
 > that should not hurt in linux-next for a while.

Sounds good to me.

Thanks,

	Dave

-- 
http://www.codemonkey.org.uk

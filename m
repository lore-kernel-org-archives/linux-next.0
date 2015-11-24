From: Andi Kleen <ak@linux.intel.com>
Subject: Re: linux-next: clean up the kbuild tree?
Date: Mon, 23 Nov 2015 18:12:31 -0800
Message-ID: <20151124021231.GE8438@tassilo.jf.intel.com>
References: <20151115112705.0bf4f0ed@canb.auug.org.au>
 <20151115175848.GD10150@tassilo.jf.intel.com>
 <5649D3B9.7020701@suse.cz>
 <20151121010033.GB8438@tassilo.jf.intel.com>
 <s5h4mgfzkno.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:48240 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751568AbbKXCMd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Nov 2015 21:12:33 -0500
Content-Disposition: inline
In-Reply-To: <s5h4mgfzkno.wl-tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Michal Marek <mmarek@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

> > 5.x is better than 4.x but it's still a slower. It's also not incremential.
> 
> At the last time I tested with the latest 5.x and stock binutils on
> openSUSE Tumbleweed, I failed to build, unfortunately.  Partly the
> detection of gcc version doesn't work for 5.x, and partly something is

Really? It work for me with gcc 5

> missing in binutils side, although it's already built with plugin.

Yes it needs HJ Lu's Linux binutils, not the standard FSF binutils.
The patch to fix LTO with ld -r was submitted to standard binutils, but they
didn't want to fix the issue.


-Andi
-- 
ak@linux.intel.com -- Speaking for myself only

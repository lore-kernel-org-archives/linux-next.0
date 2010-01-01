From: Tony Luck <tony.luck@intel.com>
Subject: Re: linux-next: Tree for December 31 (kgdb)
Date: Fri, 1 Jan 2010 13:18:21 -0800
Message-ID: <12c511ca1001011318y5340b43l3da26629c22498c4@mail.gmail.com>
References: <20091231112314.a51e160b.sfr@canb.auug.org.au>
	 <20091231110747.5efc1efa.randy.dunlap@oracle.com>
	 <12c511ca0912311120i3f60fccas3487c1f47b5cf3c3@mail.gmail.com>
	 <20100101120428.68a99a16.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:41978 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751162Ab0AAVSW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Jan 2010 16:18:22 -0500
In-Reply-To: <20100101120428.68a99a16.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Wessel <jason.wessel@windriver.com>, Randy Dunlap <randy.dunlap@oracle.com>, jbarnes@virtuousgeek.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net

On Thu, Dec 31, 2009 at 5:04 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> I have used the version of the kgdb tree from next-20091230 for today
> (effectively dropping it), sorry.

I checked in my year-old partially working kgdb patch for ia64 to my
test tree.  So ia64 should be covered now.  Don't know whether other
non-kgdb architectures use these drm bits.

-Tony

From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: linux-next: bluetooth tree rewritten after being merged
Date: Mon, 24 Sep 2012 20:49:04 -0300
Message-ID: <20120924234904.GC7922@joana>
References: <20120925085113.cd17b8e633f38b3f7deefd5c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:62898 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778Ab2IXXtP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Sep 2012 19:49:15 -0400
Content-Disposition: inline
In-Reply-To: <20120925085113.cd17b8e633f38b3f7deefd5c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Stephen,

* Stephen Rothwell <sfr@canb.auug.org.au> [2012-09-25 08:51:13 +1000]:

> Hi Gustavo, John,
> 
> The bluetooth tree has been merged into the wireless tree (which is its
> normal path to Linus), but since that merge, the top four commits in the
> bluetooth tree have been rewritten.   So now there will be two version of
> those commits in linux-next (and eventually Linus' tree, if nothing
> changes) and this will cause conflicts if there are further changes in
> either tree affecting the files in those four commits.
> 
> Do *not* rewrite/rebase a tree once it has been merged "upstream".
> Preferably do *not* rewrite/rebase a tree once it has been published
> (unless it is specifically a tree that is never meant to be stable).

Yes, I was planning to redo the pull request but in the meantime John pulled
my tree. I'm fixing my tree right now to get rid of this issue. Thanks for
reporting.

	Gustavo

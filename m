From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the msm tree with the arm tree
Date: Mon, 18 Oct 2010 22:48:35 +0200
Message-ID: <201010182248.36078.arnd@arndb.de>
References: <20101018103540.7bd9c535.sfr@canb.auug.org.au> <201010182219.25890.arnd@arndb.de> <1287434251.5588.23.camel@c-dwalke-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:51210 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755183Ab0JRUsk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2010 16:48:40 -0400
In-Reply-To: <1287434251.5588.23.camel@c-dwalke-linux.qualcomm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Walker <dwalker@fifo99.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Russell King <rmk@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeremy Kerr <jeremy.kerr@canonical.com>, Jeff Ohlstein <johlstei@codeaurora.org>

On Monday 18 October 2010 22:37:31 Daniel Walker wrote:
> > When you know that Russell does not rebase his tree, you can pull his
> > tree into yours whenever a change hits his tree that impacts you in
> > a major way. You shouldn't do this too frequently, but it's a good way
> > to resolve conflicts like this one.
> 
> If I did that all of Russell's changesets would get mixed with mine when
> I send the pull request .. That would just create confusion .. It's OK
> if Russell sends my commits to Linus, but I'm not going to send
> Russell's commits.

Actually both are ok, as long as you as the sub-maintainer send your
pull request after Russell's tree has been merged and you don't
ask anyone else to pull your tree who has not pulled Russell's tree
explicitly or implicitly through Linus.

git-request-pull is smart enough to list only the changesets that
are not in the upstream tree, as will git "log your-branch...upstream"
or "git diff your-branch upstream".

The other option you have is to ask Russell to pull your tree
at an early enough time, which also works if you did the occasional
pull from him before that.

	Arnd

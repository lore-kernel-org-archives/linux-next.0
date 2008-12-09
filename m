From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: Tree for December 9
Date: Tue, 9 Dec 2008 08:53:17 +0000
Message-ID: <20081209085317.GD28946@ZenIV.linux.org.uk>
References: <20081209185237.8bb715d7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:39471 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752060AbYLIIxT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 03:53:19 -0500
Content-Disposition: inline
In-Reply-To: <20081209185237.8bb715d7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Dec 09, 2008 at 06:52:37PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20081208:
> 
> Today's tree fails the powerpc allyesconfig build but succeeds with
> CONFIG_PROFILE_ALL_BRANCHES turned off.
> 
> New trees:
> 	audit-current
> 	audit

FWIW, I've bumped the conflicting patch out of audit/for-linus and sent
pull request for rest of that queue.  The rest will get thrown to
assorted trees, assuming that security folks are willing to host a rebased
version of [PATCH] Audit: Log TIOCSTI.

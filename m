From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: unsigned commit ...
Date: Fri, 3 Dec 2010 12:21:00 +1100 (EST)
Message-ID: <alpine.LRH.2.00.1012031146480.26585@tundra.namei.org>
References: <20101203092928.367d45c0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:35842 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758120Ab0LCBVI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Dec 2010 20:21:08 -0500
In-Reply-To: <20101203092928.367d45c0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>

On Fri, 3 Dec 2010, Stephen Rothwell wrote:

> Hi James,
> 
> Commit 676dac4b1bee0469d6932f698aeb77e8489f5861 ("This patch adds a new
> security attribute to Smack called") that was added to your tree today
> has no Signed-off-by and could do with a better summary line in the
> commit message.  And probably a better explanation of what it does.
> 
> Makes me wonder about the level of review it received :-(

I noticed it and pointed it out to Casey, who is converting over to 
pushing git to me instead of posting patch sets.

If I'm pulling from someone's repo, it means I trust them enough not to 
need to personally review each line of change.

Can this be fixed with git-commit --amend ?



- James
-- 
James Morris
<jmorris@namei.org>

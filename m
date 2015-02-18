From: Jiri Kosina <jikos@jikos.cz>
Subject: Re: linux-next: please don't start adding v3.21 stuff yet
Date: Wed, 18 Feb 2015 21:53:26 +0100 (CET)
Message-ID: <alpine.LRH.2.00.1502182145300.2547@twin.jikos.cz>
References: <20150219074431.77e56ef8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150219074431.77e56ef8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 19 Feb 2015, Stephen Rothwell wrote:

> Hi Jiri,
> 
> From my daily release notes:
> 
> "Please do not add any material destined for v3.21 to your linux-next
> included trees until after v3.20-rc1 has been released."
> 
> Commit 38e0e413ca1d ("Merge branch 'for-3.21/logitech' into for-next"),
> commit e0ab74fe569d ("Merge branch 'for-3.21/rmi' into for-next"),
> commit ee2de8fc6c18 ("Merge branch 'for-3.21/genius' into for-next")
> (though this last contains what looks like a fix).
> 
> :-(

Gah, sorry for that, I always forget to switch off my automated script 
machinery during merge window.

> Also, at some point you might want to reset your tree to Linus' to get
> rid of all those (now useless) old merge commits.

Hmm, I am really not a big fan of rebasing public tree. People are 
actually pulling the for-next branch and working on top of it.

Those merge commits are always only in for-next, the branch that gets 
created for Linus before merge (by merging all the topic branches at once) 
is not polluted by them.

-- 
Jiri Kosina

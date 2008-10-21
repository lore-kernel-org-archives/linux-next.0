From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linuxt-next: nfsd strange commit
Date: Tue, 21 Oct 2008 09:20:59 -0400
Message-ID: <20081021132059.GA8029@fieldses.org>
References: <20081021141357.ab15406f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([66.93.2.214]:39887 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752252AbYJUNVB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 09:21:01 -0400
Content-Disposition: inline
In-Reply-To: <20081021141357.ab15406f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, Oct 21, 2008 at 02:13:57PM +1100, Stephen Rothwell wrote:
> Hi Bruce,
> 
> I was just wondering what commit 9966acbedc54b9c2d38d97bdd56b612d8da45b8d
> ("proc: move rest of /proc/locks to fs/locks.c") is doing in the
> nfsd-next tree?  As far as I can see, it has nothing to do with nfsd and
> no interaction with the nfsd code.
> 
> Adding random patches to trees in linux-next just makes my job
> harder ...  especially when it touched something like include/linux/fs.h
> and triggers a major rebuild of the tree (*and* it is the only thing in
> the nfsd-next tree).

I've also been acting as a (somewhat inconsistent) locks.c maintainer.

Would it make it any easier if I kept a locks-next branch that you could
pull separately?  Or should I try to get that stuff into some other
tree?

--b.

From: James Morris <jmorris@namei.org>
Subject: Re: userns tree ready
Date: Wed, 26 Nov 2008 17:21:21 +1100 (EST)
Message-ID: <alpine.LRH.1.10.0811261720350.26924@tundra.namei.org>
References: <20081125001651.GA10661@us.ibm.com> <alpine.LRH.1.10.0811251204450.18891@tundra.namei.org> <20081125142406.GA9761@us.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:60977 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750718AbYKZGVl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 01:21:41 -0500
In-Reply-To: <20081125142406.GA9761@us.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Serge E. Hallyn" <serue@us.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org

On Tue, 25 Nov 2008, Serge E. Hallyn wrote:

> Quoting James Morris (jmorris@namei.org):
> > On Mon, 24 Nov 2008, Serge E. Hallyn wrote:
> > 
> > > Hi Stephen,
> > > 
> > > I've created a new userns tree - although the patches are completely
> > > unchanged from before they were pulled along with David's patches.
> > > They apply fine either right after James' security-next tree or at
> > > the end of linux-next.  The tree is at
> > > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/sergeh/userns-2.6#next
> > > 
> > > like before, and is based on James's security-next tree.
> > 
> > I can merge this into my tree, although if it breaks, I'll need help from 
> > you to fix it.
> 
> Thanks, James.  I don't know which (security-next or linux-next) is more
> appropriate, but I think Stephen may have already added it to
> Next/Trees.  I'll of course fix any breakages in any case.

I've now merged your branch above into:
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next



-- 
James Morris
<jmorris@namei.org>

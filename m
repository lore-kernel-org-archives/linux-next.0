From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: manual merge of the security-testing tree with Linus'
 tree
Date: Fri, 22 May 2009 19:04:10 +1000 (EST)
Message-ID: <alpine.LRH.2.00.0905221903020.12996@tundra.namei.org>
References: <20090522152901.2d220889.sfr@canb.auug.org.au> <20090522053542.GY8633@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:59436 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751729AbZEVJEX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 May 2009 05:04:23 -0400
In-Reply-To: <20090522053542.GY8633@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>

On Fri, 22 May 2009, Al Viro wrote:

> On Fri, May 22, 2009 at 03:29:01PM +1000, Stephen Rothwell wrote:
> > Hi James,
> > 
> > Today's linux-next merge of the security-testing tree got a conflict in
> > fs/exec.c between commits a44ddbb6d8a8ffe4e34e417048dfdd8f3dd1de4f ("Make
> > open_exec() and sys_uselib() use may_open(), instead of duplicating its
> > parts") and 6e8341a11eb21826b7192d0bb88cb5b44900a9af ("Switch open_exec()
> > and sys_uselib() to do_open_filp()") from Linus' tree and commit
> > b9fc745db833bbf74b4988493b8cd902a84c9415 ("integrity: path_check update")
> > from the security-testing tree.
> > 
> > I used the version of these conflicts from Linus' tree as I assume that
> > the changes to may_open() from the latter patch are sufficient.  Please
> > check and let me know (or merge Linus' tree and do the resolution for
> > yourself :-)).
> 
> Just drop their changes to sys_uselib() and open_exec() and keep the
> rest of their patch.

I've merged Linus' tree into mine and done the above, see fs/exec.c in 
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next

(I don't know how to get the conflict resolution diff out of git).


- James
-- 
James Morris
<jmorris@namei.org>

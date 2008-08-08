From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 8 Aug 2008 19:23:11 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0808081920110.25130@tundra.namei.org>
References: <20080808160844.796dfcc1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:34154 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753867AbYHHJ5r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 05:57:47 -0400
In-Reply-To: <20080808160844.796dfcc1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org, David Chinner <dgc@sgi.com>, xfs-masters@oss.sgi.com

On Fri, 8 Aug 2008, Stephen Rothwell wrote:

> Hi David,
> 
> Today's linux-next merge of the creds tree got a conflict in
> fs/xfs/xfs_acl.c between commit 6811235504abbeed42673cf70014759f39e12a9b
> ("[XFS] XFS: Kill xfs_vtoi()") from the xfs tree and commit
> 785af0f385cd424d4b40908bf0e467df3dc05434 ("CRED: Change current->fs[ug]id
> to current_fs[ug]id()") from the creds tree.
> 
> I did the obvious fixup.

I'm not 100% clear on the new process.

What happens with your fixup patch?  Is this something you maintain in 
your tree from now until these trees are merged with Linus?  (At which 
point we'll run into the same conflicts again ?)


- James
-- 
James Morris
<jmorris@namei.org>

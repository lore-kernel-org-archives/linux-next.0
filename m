From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: manual merge of the vfs tree
Date: Tue, 12 Aug 2008 15:27:52 -0400
Message-ID: <20080812192752.GG30729@fieldses.org>
References: <20080812152037.b7de321f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([66.93.2.214]:40172 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751832AbYHLT2B (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 15:28:01 -0400
Content-Disposition: inline
In-Reply-To: <20080812152037.b7de321f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, Julia Lawall <julia@diku.dk>

On Tue, Aug 12, 2008 at 03:20:37PM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the vfs tree got a conflict in
> fs/nfsd/export.c between commit 53e6d8d182e97c5211da4ee1f163c840c7ecf8ca
> ("fs/nfsd/export.c: Adjust error handling code involving
> auth_domain_put") from the nfsd tree and commit
> eec56f5904cd79d7cf99efd74ad02f39c829fff1 ("switch nfsd to kern_path()")
> from the vfs tree.
> 
> The conflict is contextual. I fixed it up and can carry the fixup.

OK, thanks.  Looks like I can't help for now as long as kern_path()
isn't upstream.

(Minor request, if it's easy to automate: would it be possible to
include a url for linux-next (or even for the specific tree that the
commit came from) with these messages?  It'd just save a little googling
when I want to see what's going on.)

--b.

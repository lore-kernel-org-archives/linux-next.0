From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Fri, 15 Mar 2013 08:01:42 -0700
Message-ID: <20130315150142.GA31650@kroah.com>
References: <20130315151334.2b52f63ab7f6b1efb893bf3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46924 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754256Ab3COPBp (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Mar 2013 11:01:45 -0400
Content-Disposition: inline
In-Reply-To: <20130315151334.2b52f63ab7f6b1efb893bf3e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>

On Fri, Mar 15, 2013 at 03:13:34PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/ccg/f_fs.c between commit 7f78e0351394 ("fs: Limit
> sys_mount to only request filesystem modules") from Linus' tree and
> commit 515e6dd20b3f ("Staging: ccg: delete it from the tree") from the
> staging tree.
> 
> The latter deleted the file, so I did that and can carry the fix as
> necessary (no action is required).

Thanks, that's the correct fix :)

greg k-h

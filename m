From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs tree
Date: Mon, 3 Nov 2014 15:57:24 -0800
Message-ID: <20141103235724.GA31372@kroah.com>
References: <20141103132914.2a86667d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:48145 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751162AbaKCX50 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2014 18:57:26 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 51DE3209E1
	for <linux-next@vger.kernel.org>; Mon,  3 Nov 2014 18:57:26 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20141103132914.2a86667d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tina Ruchandani <ruchandani.tina@gmail.com>

On Mon, Nov 03, 2014 at 01:29:14PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/lustre/lustre/llite/file.c between commit bc281d072ba9
> ("lustre: opened file can't have negative dentry") from the vfs tree
> and commit 57303e76c225 ("staging: lustre: Fix checkpatch.pl
> spacing-related errors") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks for all of these fixes, they look correct to me.

greg k-h

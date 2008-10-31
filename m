From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 31 Oct 2008 09:16:08 +0000
Message-ID: <3442.1225444568@redhat.com>
References: <20081031170609.a3fcda4e.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:36225 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753349AbYJaJQ2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 05:16:28 -0400
In-Reply-To: <20081031170609.a3fcda4e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> - 	return inode_has_perm(current, inode,
> + 	return inode_has_perm(cred, inode,
>  -			      open_file_mask_to_av(inode->i_mode, mask), NULL);
>  +			      file_mask_to_av(inode->i_mode, mask), NULL);

...

> - 	return inode_has_perm(current, inode, open_file_to_av(file), NULL);
>  -	return inode_has_perm(cred, inode, file_to_av(file), NULL);
> ++	return inode_has_perm(cred, inode, open_file_to_av(file), NULL);

ACK.

From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Mon, 20 Oct 2008 12:55:44 +0100
Message-ID: <9827.1224503744@redhat.com>
References: <20081020191804.fe73c82a.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:41031 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750952AbYJTMBS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 08:01:18 -0400
In-Reply-To: <20081020191804.fe73c82a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> - 	inode->i_uid = opts->setuid ? opts->uid : current->fsuid;
> - 	inode->i_gid = opts->setgid ? opts->gid : current->fsgid;
> ++	inode->i_uid = opts->setuid ? opts->uid : current_fsuid();
> ++	inode->i_gid = opts->setgid ? opts->gid : current_fsgid();

ACK.

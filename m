From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the security-testing tree
Date: Tue, 25 Nov 2008 11:04:40 +0000
Message-ID: <8055.1227611080@redhat.com>
References: <20081125191137.d5474c9e.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:59534 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751280AbYKYLFN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 06:05:13 -0500
In-Reply-To: <20081125191137.d5474c9e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, "J. Bruce Fields" <bfields@citi.umich.edu>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the security-testing tree got a conflict in
> fs/nfsd/nfs4recover.c between commit
> e4625eb826de4f6774ee602c442ba23b686bdcc7 ("nfsd: use of unitialized list
> head on error exit in nfs4recover.c") from the nfsd tree and commit
> d84f4f992cbd76e8f39c488cf0c5d123843923b1 ("CRED: Inaugurate COW
> credentials") from the security-testing tree.
> 
> Just a context change. I fixed it up (see below) and can carry the fix as
> necessary.

That looks okay.

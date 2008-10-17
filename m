From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: creds tree build failure
Date: Fri, 17 Oct 2008 11:37:02 +0100
Message-ID: <26969.1224239822@redhat.com>
References: <20081017172546.ee699528.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:37624 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752572AbYJQKhn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 06:37:43 -0400
In-Reply-To: <20081017172546.ee699528.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Ian Kent <raven@themaw.net>, Andrew Morton <akpm@linux-foundation.org>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> +	const struct cred *cred = current_cred();
> ...
> -		filp = dentry_open(nd.path.dentry, nd.path.mnt, O_RDONLY);
> +		filp = dentry_open(nd.path.dentry, nd.path.mnt, O_RDONLY,
> +			cred);

ACK...  Or you could pull the fix from JamesM's tree.

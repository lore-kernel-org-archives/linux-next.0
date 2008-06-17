From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: manual merge of nfsd tree
Date: Tue, 17 Jun 2008 16:44:21 -0400
Message-ID: <20080617204421.GA4076@fieldses.org>
References: <20080617153914.5068b609.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([66.93.2.214]:43438 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754343AbYFQUoZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 16:44:25 -0400
Content-Disposition: inline
In-Reply-To: <20080617153914.5068b609.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Trond Myklebust <trond.myklebust@fys.uio.no>, Kevin Coffman <kwc@citi.umich.edu>

On Tue, Jun 17, 2008 at 03:39:14PM +1000, Stephen Rothwell wrote:
> Hi Bruce,
> 
> Today's linux-next merge of the nfsd tree got a conflict in
> net/sunrpc/auth_gss/auth_gss.c between commit
> 733e73be1865a3f5bc97b5533145064136636b27 ("rpc: remove some unused
> macros") from the nfs tree and commit
> 767b4b6b4f2a6a282deb18c2c80f070e32b70f52 ("rpcauth: update and document
> available space in xdr_buf when doing privacy") from the nfsd tree.
> 
> I did the obvious fixup, but it may be worth a look.

Hm.  Stupid on my part: I took some gss (mostly krb5-specific patches
from Kevin) into my tree, then sent another one to Trond.

Trond, should I forward Kevin's patches to you, or should we do it the
other way around?

--b.

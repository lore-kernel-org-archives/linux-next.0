From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: manual merge of the nfs tree
Date: Wed, 09 Jul 2008 12:44:33 -0400
Message-ID: <1215621873.7214.15.camel@localhost>
References: <20080709125611.f25a9467.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:53799 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750820AbYGIQoj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Jul 2008 12:44:39 -0400
In-Reply-To: <20080709125611.f25a9467.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, 2008-07-09 at 12:56 +1000, Stephen Rothwell wrote:
> Hi Trond,
> 
> Today's linux-next merge of the nfs tree got a conflict in
> net/sunrpc/rpcb_clnt.c between commit
> 0d3a34b48c87a374b37d7a21a60d257d076484f3 ("SUNRPC: Fix a double-free in
> rpcbind") from Linus' tree (which is in nfs tree as well) and some commit
> (s) from the nfs tree.
> 
> I just used the version from the nfs tree.

Hi Stephen,

Sorry about that: I cherry-picked those patches from my 'devel' branch.
I should probably have used some other method.

Anyhow, the nfs tree has now been rebased onto today's mainline kernel,
and so the conflict should now be eliminated.

Cheers
  Trond

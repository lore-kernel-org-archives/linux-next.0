From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Thu, 30 Oct 2008 10:14:57 +0000
Message-ID: <12548.1225361697@redhat.com>
References: <20081030154741.2651e779.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:48420 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753411AbYJ3KPR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Oct 2008 06:15:17 -0400
In-Reply-To: <20081030154741.2651e779.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, David Chinner <david@fromorbit.com>, Lachlan McIlroy <lachlan@sgi.com>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the creds tree got conflicts in
> fs/xfs/linux-2.6/xfs_cred.h, fs/xfs/linux-2.6/xfs_globals.h and
> fs/xfs/xfs_vnodeops.h between commit
> 959f0f5b48d25a478694e04d024cd1ca681ea4bf ("[XFS] kill sys_cred") from the
> xfs tree and commit 3634a8a33b2cd7296e265d01d606b58c22b6a557 ("CRED:
> Separate task security context from task_struct") from the creds tree.
> 
> The former mostly removed what the latter changed.  I fixed it up (see
> below - I just removed the "extern cred_t *sys_cred;" from xfs_globals.h
> and the cred_t arguments to xfs_setattr and xfs_change_file_space in
> xfs_vnodeops.h) and can carry the fix.

ACK.

David

From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: manual merge of the security-testing tree
Date: Tue, 18 Nov 2008 18:55:41 +1100 (EST)
Message-ID: <alpine.LRH.1.10.0811181853550.13945@tundra.namei.org>
References: <20081117154410.dc25a2d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:59411 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754200AbYKRH4h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Nov 2008 02:56:37 -0500
In-Reply-To: <20081117154410.dc25a2d9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Jeff Layton <jlayton@redhat.com>, Steve French <sfrench@us.ibm.com>, David Howells <dhowells@redhat.com>

On Mon, 17 Nov 2008, Stephen Rothwell wrote:

> Hi James,
> 
> Today's linux-next merge of the security-testing tree got a conflict in
> fs/cifs/misc.c between commit 14fbf50d695207754daeb96270b3027a3821121f
> ("cifs: reinstate sharing of SMB sessions sans races") from the cifs tree
> and commit a001e5b558f25eb1e588522d73ac949b643b7a37 ("CRED: Wrap task
> credential accesses in the CIFS filesystem") from the security-testing
> tree.
> 
> I fixed it up (see below) and can carry it for a short while.

I merged with linus to resolve this, in 
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next

commit f3a5c547012a09f38f7c27b17a8e3150b69cd259

Please test.



- James
-- 
James Morris
<jmorris@namei.org>

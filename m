From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: nfsd/cpus4096 merge conflict
Date: Wed, 11 Jun 2008 18:22:56 -0400
Message-ID: <20080611222256.GB25194@fieldses.org>
References: <20080611144037.3382eaf7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([66.93.2.214]:57215 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751309AbYFKWXE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 18:23:04 -0400
Content-Disposition: inline
In-Reply-To: <20080611144037.3382eaf7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Jeff Layton <jlayton@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Wed, Jun 11, 2008 at 02:40:37PM +1000, Stephen Rothwell wrote:
> Hi Bruce,
> 
> Today's linux-next merge of the nfsd tree got a conflict in
> net/sunrpc/svc.c between commit 3f9b48a7584851997702cdc3f58e7811b5546397
> ("net: Pass reference to cpumask variable in net/sunrpc/svc.c") from the
> cpus4096 tree and commit 89a8922f36389cd4a284e5d7727cd792ef4544e0
> ("knfsd: convert knfsd to kthread API") from the nfsd tree.
> 
> It appears that the cpus4096 patch may no longer be needed as it was just
> changing "set_cpus_allowed(current, oldmask)" to "set_cpus_allowed_ptr
> (current, &oldmask)" in __svc_create_thread() which has been removed and
> there doesn't appear to be any new calls to set_cpus_allowed added.

Yep, dropping 3f9b48a7584851997702cdc3f58e7811b5546397 looks like the
right thing to do.  Thanks!

--b.

> 
> I could be wrong, so it is probably worth checking.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/



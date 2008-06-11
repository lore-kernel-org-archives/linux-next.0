From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: nfsd/cpus4096 merge conflict
Date: Wed, 11 Jun 2008 06:43:43 -0700
Message-ID: <484FD68F.3090703@sgi.com>
References: <20080611144037.3382eaf7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.171.30]:46031 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750737AbYFKNnp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 09:43:45 -0400
In-Reply-To: <20080611144037.3382eaf7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, linux-next@vger.kernel.org, Jeff Layton <jlayton@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Stephen Rothwell wrote:
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
> 
> I could be wrong, so it is probably worth checking.

Yes, if I'm reading the patch correctly then it's already taking into
account passing the pointer to the cpumask or nodemask arg.

Thanks,
Mike  

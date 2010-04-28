From: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Wed, 28 Apr 2010 12:21:01 -0300
Message-ID: <20100428152101.GB12091@amt.cnet>
References: <20100427154917.405e21df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36355 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754821Ab0D1QWq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Apr 2010 12:22:46 -0400
Content-Disposition: inline
In-Reply-To: <20100427154917.405e21df.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Graf <agraf@suse.de>

On Tue, Apr 27, 2010 at 03:49:17PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> arch/powerpc/kvm/book3s.c: In function 'kvmppc_core_vcpu_create':
> arch/powerpc/kvm/book3s.c:1241: error: implicit declaration of function 'kzalloc'
> arch/powerpc/kvm/book3s.c:1241: warning: cast to pointer from integer of different size
> arch/powerpc/kvm/book3s.c:1281: error: implicit declaration of function 'kfree'
> 
> Caused by commit 046cdc052ffcbf1ee1c627ef811031d18654bafe ("KVM: PPC:
> Improve indirect svcpu accessors") from the kvm tree.
> 
> You have to include slab.h directly to use kzalloc/kfree ...
> 
> I have applied the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 27 Apr 2010 15:32:53 +1000
> Subject: [PATCH] kvm: powerpc: use of kzalloc/kfree requires including slab.h
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied, thanks.

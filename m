From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Wed, 29 Oct 2008 11:55:52 +0200
Message-ID: <49083328.1010400@redhat.com>
References: <20081029135807.110c8735.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:50083 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753360AbYJ2J4D (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Oct 2008 05:56:03 -0400
In-Reply-To: <20081029135807.110c8735.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Sheng Yang <sheng@linux.intel.com>, Amit Shah <amit.shah@redhat.com>, Xiantao Zhang <xiantao.zhang@intel.com>

Stephen Rothwell wrote:
> Hi Avi,
>
> Today's linux-next merge of the kvm tree got a conflict in
> include/linux/kvm_host.h virt/kvm/kvm_main.c between commit
> 5550af4df179e52753d3a43a788a113ad8cd95cd ("KVM: Fix guest shared
> interrupt with in-kernel irqchip") from Linus' tree and commit
> 89c6b6a1b5059efa255ec254c8ee6667bdf6b2a0 ("KVM: IRQ ACK notifier should
> be used with in-kernel irqchip") from the kvm tree.
>
> Just a context change.  I fixed it up (taking the kvm tree's removal of
> the first argument of kvm_unregister_irq_ack_notifier).
>   

I've done the same merge and pushed kvm.git, so this should disappear on 
the next -next.

-- 
error compiling committee.c: too many arguments to function

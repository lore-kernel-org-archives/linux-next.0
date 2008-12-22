From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: scsi-post-merge tree build failure
Date: Tue, 23 Dec 2008 07:56:32 +1100
Message-ID: <1229979392.4360.15.camel@pasglop>
References: <20081223012545.5b1e7f5e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:38851 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754519AbYLVU46 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 15:56:58 -0500
In-Reply-To: <20081223012545.5b1e7f5e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Hollis Blanchard <hollisb@us.ibm.com>

On Tue, 2008-12-23 at 01:25 +1100, Stephen Rothwell wrote:
> Hi Paul, Ben,
> 
> Today's linux-next build (powerpc ppc44x_config) failed like this:
> 
> arch/powerpc/kvm/powerpc.c: In function 'kvm_arch_vcpu_put':
> arch/powerpc/kvm/powerpc.c:333: error: implicit declaration of function '_tlbil_all'
> 
> Probably caused by commit 2a4aca1144394653269720ffbb5a325a77abd5fa
> ("powerpc/mm: Split low level tlb invalidate for nohash processors").
> Reverting just that commit was too difficult, so I have reverted the
> powerpc tree for today.

You can't revert that without reverting my whole series.

Adding a #include ../mm/mmu_decl.h to the kvm code should fix it for
now.

I need to talk to hollis about the right way to do that stuff in
the long run but it might be it... those _tlbil things are low level
stuff that aren't supposed to be used by the outside world which is
why I moved the declarations there, but KVM is also low level :-)

Cheers,
Ben.

From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: Tree for Sep 10
Date: Thu, 10 Sep 2015 10:05:01 +0200
Message-ID: <55F139AD.5060503@de.ibm.com>
References: <20150910140204.48bf6565@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:38023 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753457AbbIJIFH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Sep 2015 04:05:07 -0400
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Thu, 10 Sep 2015 09:05:05 +0100
In-Reply-To: <20150910140204.48bf6565@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KVM list <kvm@vger.kernel.org>

Am 10.09.2015 um 06:02 schrieb Stephen Rothwell:
> Hi all,
> 
> Please do not add material for v4.4 until after v4.3-rc1 is out.
> 
[...]
> The kvm tree still had its build failure for which I reverted a commit.
[..]
> Merging kvm/linux-next (2cbd78244fb2 KVM: trace kvm_halt_poll_ns grow/shrink)
> CONFLICT (content): Merge conflict in arch/powerpc/kvm/book3s_hv.c
> $ git am -3 ../patches/0001-Revert-KVM-trace-kvm_halt_poll_ns-grow-shrink.patch
> Applying: Revert "KVM: trace kvm_halt_poll_ns grow/shrink"

Can you add
kvm@vger.kernel.org
for build failures of the kernel tree?

Thanks a lot

Christian

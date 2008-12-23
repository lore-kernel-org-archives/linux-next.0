From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Tue, 23 Dec 2008 12:38:50 +1100
Message-ID: <1229996331.4360.32.camel@pasglop>
References: <20081222145255.17f885f2.sfr@canb.auug.org.au>
	 <1229922804.13001.84.camel@pasglop>
	 <1229981967.7181.5.camel@localhost.localdomain>
	 <1229982095.4360.19.camel@pasglop>
	 <1229983422.7181.7.camel@localhost.localdomain>
	 <18768.5298.173232.227168@cargo.ozlabs.ibm.com>
	 <1229985853.7181.10.camel@localhost.localdomain>
	 <18768.11194.175787.360371@cargo.ozlabs.ibm.com>
	 <1229994151.7181.24.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:50385 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753553AbYLWBjQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 20:39:16 -0500
In-Reply-To: <1229994151.7181.24.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: Paul Mackerras <paulus@samba.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>

On Mon, 2008-12-22 at 19:02 -0600, Hollis Blanchard wrote:
> If you commit a new change to your tree that reverses only the
> arch/powerpc/kvm/powerpc.c part of Ben's patch, would that solve the
> merge problem? ppc44x_defconfig would still fail in the meantime though.
> If you fix the ppc44x_defconfig build, the merge problem is compounded.
> Either way I guess it is something that needs to be sorted out in
> powerpc.git, so you can pick which style of breakage you'd prefer?

Or add #include "../mm/mmu_decl.h" to powerpc to fix the local build
breakage now and fix the merge conflict later at merge time.

Cheers,
Ben.

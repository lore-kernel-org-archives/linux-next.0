From: Hollis Blanchard <hollisb@us.ibm.com>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Mon, 22 Dec 2008 15:39:27 -0600
Message-ID: <1229981967.7181.5.camel@localhost.localdomain>
References: <20081222145255.17f885f2.sfr@canb.auug.org.au>
	 <1229922804.13001.84.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:53058 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754910AbYLVVj3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Dec 2008 16:39:29 -0500
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com [9.17.195.227])
	by e35.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mBMLbcpI030143
	for <linux-next@vger.kernel.org>; Mon, 22 Dec 2008 14:37:38 -0700
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mBMLdS13189240
	for <linux-next@vger.kernel.org>; Mon, 22 Dec 2008 14:39:28 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mBMLdRS5009629
	for <linux-next@vger.kernel.org>; Mon, 22 Dec 2008 14:39:28 -0700
In-Reply-To: <1229922804.13001.84.camel@pasglop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>

On Mon, 2008-12-22 at 16:13 +1100, Benjamin Herrenschmidt wrote:
> On Mon, 2008-12-22 at 14:52 +1100, Stephen Rothwell wrote:
> > 
> > The former patch changes the _tlbia() to _tlbil_all() in
> > kvm_arch_vcpu_put().  The latter restructures this code.
> > 
> > I don't know enough to fix this up, so for today I have merely used the
> > kvm tree version.  Please come up with something better (if needed) and I
> > can use that as a merge resolution.
> 
> Hollis, can you have a look ? I suspect whatever is in the kvm tree is
> ok, provided it doesn't use the old names such as _tlbia() or _tlbie()
> which don't exist anymore for nohash...

I've stopped calling _tlbia() in KVM, so I think the easiest solution
would be to drop the KVM part of your patch, Ben.

-- 
Hollis Blanchard
IBM Linux Technology Center

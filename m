From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Mon, 22 Dec 2008 16:13:24 +1100
Message-ID: <1229922804.13001.84.camel@pasglop>
References: <20081222145255.17f885f2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:60196 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750718AbYLVFNn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 00:13:43 -0500
In-Reply-To: <20081222145255.17f885f2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Hollis Blanchard <hollisb@us.ibm.com>

On Mon, 2008-12-22 at 14:52 +1100, Stephen Rothwell wrote:
> 
> The former patch changes the _tlbia() to _tlbil_all() in
> kvm_arch_vcpu_put().  The latter restructures this code.
> 
> I don't know enough to fix this up, so for today I have merely used the
> kvm tree version.  Please come up with something better (if needed) and I
> can use that as a merge resolution.

Hollis, can you have a look ? I suspect whatever is in the kvm tree is
ok, provided it doesn't use the old names such as _tlbia() or _tlbie()
which don't exist anymore for nohash...

Cheers,
Ben.

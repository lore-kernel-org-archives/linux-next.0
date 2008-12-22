From: Paul Mackerras <paulus@samba.org>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Tue, 23 Dec 2008 09:29:06 +1100
Message-ID: <18768.5298.173232.227168@cargo.ozlabs.ibm.com>
References: <20081222145255.17f885f2.sfr@canb.auug.org.au>
	<1229922804.13001.84.camel@pasglop>
	<1229981967.7181.5.camel@localhost.localdomain>
	<1229982095.4360.19.camel@pasglop>
	<1229983422.7181.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:55279 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754654AbYLVW3f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 17:29:35 -0500
In-Reply-To: <1229983422.7181.7.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>

Hollis Blanchard writes:

> > Patch is in Paulus -next already so we'll have to do a manual resolve.
> 
> Who has to do it? My code should "win".

Do you have your own tree or is all your stuff in the main kvm tree?

If there is a powerpc KVM tree, I could pull that and resolve the
conflict, but I don't want to pull all the queued up KVM stuff.

Worst case is Linus gets to resolve the conflict in the merge window.
If that's just a matter of him taking your version of the file, it
should be within his powers to manage. :)

Paul.

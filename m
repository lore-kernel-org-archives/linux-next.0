From: Hollis Blanchard <hollisb@us.ibm.com>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Mon, 22 Dec 2008 16:44:13 -0600
Message-ID: <1229985853.7181.10.camel@localhost.localdomain>
References: <20081222145255.17f885f2.sfr@canb.auug.org.au>
	 <1229922804.13001.84.camel@pasglop>
	 <1229981967.7181.5.camel@localhost.localdomain>
	 <1229982095.4360.19.camel@pasglop>
	 <1229983422.7181.7.camel@localhost.localdomain>
	 <18768.5298.173232.227168@cargo.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e3.ny.us.ibm.com ([32.97.182.143]:32890 "EHLO e3.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755866AbYLVWoR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 17:44:17 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e3.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id mBMMhIvq025137
	for <linux-next@vger.kernel.org>; Mon, 22 Dec 2008 17:43:18 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mBMMiG2U173672
	for <linux-next@vger.kernel.org>; Mon, 22 Dec 2008 17:44:16 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mBMMhbQw032559
	for <linux-next@vger.kernel.org>; Mon, 22 Dec 2008 17:43:38 -0500
In-Reply-To: <18768.5298.173232.227168@cargo.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>

On Tue, 2008-12-23 at 09:29 +1100, Paul Mackerras wrote:
> Hollis Blanchard writes:
> 
> > > Patch is in Paulus -next already so we'll have to do a manual resolve.
> > 
> > Who has to do it? My code should "win".
> 
> Do you have your own tree or is all your stuff in the main kvm tree?
> 
> If there is a powerpc KVM tree, I could pull that and resolve the
> conflict, but I don't want to pull all the queued up KVM stuff.

It's just the main KVM tree.

> Worst case is Linus gets to resolve the conflict in the merge window.
> If that's just a matter of him taking your version of the file, it
> should be within his powers to manage. :)

Yeah, that's what I meant by "win"... whatever changes Ben made are to
now-dead code, so the code in kvm.git should be used. Does Linus need
special instruction to do this, or how does that work?

-- 
Hollis Blanchard
IBM Linux Technology Center

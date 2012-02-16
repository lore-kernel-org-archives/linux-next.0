From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: Please add irqdomain branch to linux-next
Date: Thu, 16 Feb 2012 14:11:38 +1100
Message-ID: <1329361898.3772.43.camel@pasglop>
References: <CACxGe6sTO_Jy-vecKS9SoVs55ZA8BMc+O0NODLdq6KvkcbPByg@mail.gmail.com>
	 <1328492111.30631.24.camel@pasglop>
	 <20120206061517.GD21449@ponder.secretlab.ca>
	 <CACxGe6tAVW2zCrWFPDgvu8sjd4KXJnfqhT16sYa1UvyRVEVyhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:43993 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756909Ab2BPDML (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Feb 2012 22:12:11 -0500
In-Reply-To: <CACxGe6tAVW2zCrWFPDgvu8sjd4KXJnfqhT16sYa1UvyRVEVyhQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>

On Wed, 2012-02-15 at 18:32 -0700, Grant Likely wrote:

> Only nomap users will care about this, and of those 5, only iseries
> and ps3 actually change it.  How about I add a max_virq parameter to
> only be used by the nomap revmap?  That seems to be cleaner than a
> global setting.  I've crafted a patch and will post it with v5 of the
> series.

Right, I don't see an obvious need elsewhere so it could be a flag
specific to nomap, tho it still needs to be taken into account in the
main allocation code.

> For now I'll use numa_node_id() at allocation time.  I'll craft a
> follow-on patch to change the API since it touches a lot of call
> sites.

But which node ? :-)

I'd rather you add a new API, no need to change the call sites:

Add foo_node(xxx,node); and have the existing foo() be implemented
as a static inline calling foo_node(xxx,0); or something like that, then
I can change the powerpc code to use the later & pass the PCI device
node (which should be in the pci_controller structure). We can add more
later.

> I've dropped irq_domain_xlate_pci()
> 
> I think I've addressed all the problems you've brought up.  I'm
> testing now and I'll be posting v5 very shortly.

Ok, let me know.

Cheers,
Ben.

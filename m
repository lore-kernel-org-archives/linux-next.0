From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Tue, 30 Jun 2009 13:31:37 -0700
Message-ID: <20090630133137.1bde0dc6@jbarnes-g45>
References: <20090630120727.24450bab.sfr@canb.auug.org.au>
	<20090629191324.5c86bbc0@jbarnes-g45>
	<20090630022453.GE24061@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-309.bluehost.com ([67.222.54.2]:60571 "HELO
	outbound-mail-309.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1754015AbZF3Ubi (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Jun 2009 16:31:38 -0400
In-Reply-To: <20090630022453.GE24061@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <willy@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 29 Jun 2009 19:24:53 -0700
Matthew Wilcox <willy@linux.intel.com> wrote:

> On Mon, Jun 29, 2009 at 07:13:24PM -0700, Jesse Barnes wrote:
> > On Tue, 30 Jun 2009 12:07:27 +1000
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > Hi Jesse,
> > > 
> > > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > > 
> > > ERROR: "pci_claim_resource" [drivers/pcmcia/yenta_socket.ko]
> > > undefined!
> > > 
> > > Caused by commit 6bb04b65dbff5a5bb01617351dbb0af577084752
> > > ("yenta: Use pci_claim_resource").  yenta can be built as a
> > > module, but pci_claim_resource is not exported ...
> > > 
> > > I have used the pci tree from next-20090629 for today.
> > 
> > Damn, thought I built that.  linux-next earns its keep yet again.
> 
> Sorry about that.  I thought I'd checked that.  Must have been
> confused with another function.  There do seem to be legitimate
> *drivers* that could use it (i2o for one), so I propose making it a
> full-bodied 'EXPORT_SYMBOL' and not bother with the _GPL tag.
> Thoughts?

Fine by me; that matches most of the PCI core (though the slots bits
are _GPL).

-- 
Jesse Barnes, Intel Open Source Technology Center

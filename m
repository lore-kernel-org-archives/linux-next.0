From: Matthew Wilcox <willy@linux.intel.com>
Subject: Re: linux-next: pci tree build failure
Date: Mon, 29 Jun 2009 19:24:53 -0700
Message-ID: <20090630022453.GE24061@linux.intel.com>
References: <20090630120727.24450bab.sfr@canb.auug.org.au> <20090629191324.5c86bbc0@jbarnes-g45>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.21]:29100 "EHLO
	orsmga101.jf.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757740AbZF3CYv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2009 22:24:51 -0400
Content-Disposition: inline
In-Reply-To: <20090629191324.5c86bbc0@jbarnes-g45>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jun 29, 2009 at 07:13:24PM -0700, Jesse Barnes wrote:
> On Tue, 30 Jun 2009 12:07:27 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Jesse,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > ERROR: "pci_claim_resource" [drivers/pcmcia/yenta_socket.ko]
> > undefined!
> > 
> > Caused by commit 6bb04b65dbff5a5bb01617351dbb0af577084752 ("yenta: Use
> > pci_claim_resource").  yenta can be built as a module, but
> > pci_claim_resource is not exported ...
> > 
> > I have used the pci tree from next-20090629 for today.
> 
> Damn, thought I built that.  linux-next earns its keep yet again.

Sorry about that.  I thought I'd checked that.  Must have been confused
with another function.  There do seem to be legitimate *drivers*
that could use it (i2o for one), so I propose making it a full-bodied
'EXPORT_SYMBOL' and not bother with the _GPL tag.  Thoughts?

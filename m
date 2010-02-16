From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: linux-next: build failure after merge final merge
Date: Tue, 16 Feb 2010 10:41:55 -0700
Message-ID: <201002161041.56138.bjorn.helgaas@hp.com>
References: <20100216183650.e82c0f8e.sfr@canb.auug.org.au> <201002161003.29713.bjorn.helgaas@hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g1t0027.austin.hp.com ([15.216.28.34]:3799 "EHLO
	g1t0027.austin.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932199Ab0BPRl7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Feb 2010 12:41:59 -0500
In-Reply-To: <201002161003.29713.bjorn.helgaas@hp.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>

On Tuesday 16 February 2010 10:03:29 am Bjorn Helgaas wrote:
> On Tuesday 16 February 2010 12:36:50 am Stephen Rothwell wrote:
> > After merging, today's linux-next build (sparc64 defconfig) failed like
> > this:
> > 
> > arch/sparc/kernel/pci.c: In function 'pci_cfg_fake_ranges':
> > arch/sparc/kernel/pci.c:404: error: 'struct pci_bus' has no member named 'resource'
> 
> Huh.  I built sparc64 defconfig (and alpha, arm, i686, ia64, mips,
> powerpc, sh, and sparc) in Jesse's linux-next branch, but obviously
> that's not doing the right thing for some reason.

BTW, do you have cross-compilers for all those targets?  It'd be great
if they were all available somewhere.  My set is incomplete and getting
old.

Bjorn

From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
Date: Mon, 29 Jun 2009 19:01:35 -0700
Message-ID: <20090629190135.7ff6a089@jbarnes-g45>
References: <20090630115638.7bfb8e21.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-139.bluehost.com ([67.222.39.29]:36014 "HELO
	outbound-mail-139.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752534AbZF3CBf (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jun 2009 22:01:35 -0400
In-Reply-To: <20090630115638.7bfb8e21.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>, Alex Chiang <achiang@hp.com>

On Tue, 30 Jun 2009 11:56:38 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> Today's linux-next merge of the pci tree got conflicts in
> arch/ia64/include/asm/pci.h, arch/mn10300/include/asm/pci.h and
> include/asm-generic/pci.h between commit
> a6c140969b4685f9b9f6773c0760f55ca66d1825 ("Delete
> pcibios_select_root") from Linus' tree and commit
> a53cd7419b22c14b5a1e6859a940fb6bfa77963f ("PCI: remove
> pcibios_scan_all_fns()") from the pci tree.
> 
> Just context changes (adjacent removals).  I fixed it up (see below)
> and can carry the fix for a while.

Ah ok, thanks.  That'll get fixed up after I send the current for-linus
bits over and refresh my PCI tree.

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center

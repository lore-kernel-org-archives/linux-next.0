From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci tree with the pci-current
 tree
Date: Thu, 25 Mar 2010 19:10:49 -0700
Message-ID: <20100325191049.18020272@jbarnes-piketon>
References: <20100326115712.2d800053.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-158.bluehost.com ([67.222.39.38]:37074 "HELO
	outbound-mail-158.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752697Ab0CZCLX (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Mar 2010 22:11:23 -0400
In-Reply-To: <20100326115712.2d800053.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bjorn.helgaas@hp.com>

On Fri, 26 Mar 2010 11:57:12 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> Today's linux-next merge of the pci tree got a conflict in
> arch/x86/pci/acpi.c between commit
> eb9fc8ef7cb1362374e55d9503e3e7458f319991 ("x86/PCI: for host bridge
> address space collisions, show conflicting resource") from the
> pci-current tree and commit 7589c4d809ccfc88100ba224e3358706fd21f37e
> ("x86/PCI: trim _CRS windows when they conflict with previous
> reservations") from the pci tree.
> 
> I fixed it up (by using the pci tree version) and can carry the fix for a
> while.

Time to rebase my -next branch onto my for-linus branch again I guess.

-- 
Jesse Barnes, Intel Open Source Technology Center

From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Wed, 15 Oct 2008 10:10:53 -0600
Message-ID: <200810151010.53822.bjorn.helgaas@hp.com>
References: <20081015152353.8871849b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g1t0026.austin.hp.com ([15.216.28.33]:32124 "EHLO
	g1t0026.austin.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751736AbYJOQLM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Oct 2008 12:11:12 -0400
In-Reply-To: <20081015152353.8871849b.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org

On Tuesday 14 October 2008 10:23:53 pm Stephen Rothwell wrote:
> Hi Len,
> 
> Today's linux-next merge of the acpi tree got a conflict in
> drivers/pnp/Makefile between commit
> ed458df4d2470adc02762a87a9ad665d0b1a2bd4 ("PnP: move pnpacpi/pnpbios_init
> to after PCI init") from Linus' tree and commit
> ac88a8f3f7df04774b386ddaf586040adb819b58 ("PNP: remove old
> CONFIG_PNP_DEBUG option") from the acpi tree.
> 
> Really just a context problem.  I fixed it up (see below).

Your fixup looks good, thanks.

Bjorn

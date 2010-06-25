From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
Date: Fri, 25 Jun 2010 04:31:56 +0100
Message-ID: <20100625033156.GA15720@srcf.ucam.org>
References: <20100625132545.50e226e3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:49629 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754547Ab0FYDcD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jun 2010 23:32:03 -0400
Content-Disposition: inline
In-Reply-To: <20100625132545.50e226e3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>, Greg Kroah-Hartman <gregkh@suse.de>

On Fri, Jun 25, 2010 at 01:25:45PM +1000, Stephen Rothwell wrote:

> RAR_REGISTER is also still defined in
> drivers/staging/rar_register/Kconfig ...  Also, that commit did not move
> intel_rar_register.c from staging ...

Bother. I'll fix that up.

Thanks,
-- 
Matthew Garrett | mjg59@srcf.ucam.org

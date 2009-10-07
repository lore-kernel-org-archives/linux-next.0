From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: pci tree build failure
Date: Wed, 07 Oct 2009 10:45:35 +0900
Message-ID: <4ACBF2BF.5060707@kernel.org>
References: <20091007123821.043465c6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:54234 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753938AbZJGBqR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Oct 2009 21:46:17 -0400
In-Reply-To: <20091007123821.043465c6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi Jesse,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "pci_set_cacheline_size" [drivers/pcmcia/pcmcia_core.ko] undefined!
> 
> Caused by commit 018bc96e8e27bfcafec9357ff370bf51241a7ea7 ("pccard:
> configure CLS on attach") which neglected to EXPORT_SYMBOL
> pci_set_cacheline_size.
> 
> I have used the version of the pci tree from next-20091006 for today.
> 

Oops, Jesse, can you please add EXPORT_SYMBOL_GPL() there?

Thanks.

-- 
tejun

From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: import failure of the rr quilt series
Date: Fri, 18 Jun 2010 10:56:09 +0930
Message-ID: <201006181056.10130.rusty@rustcorp.com.au>
References: <20100617110226.a507c7d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:35605 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751603Ab0FRB0W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jun 2010 21:26:22 -0400
In-Reply-To: <20100617110226.a507c7d0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 17 Jun 2010 10:32:26 am Stephen Rothwell wrote:
> Hi Rusty,
> 
> The import of the rr quilt series failed like this:
> 
> misc:pci_msi_off.patch
> error: patch failed: drivers/pci/pci.c:2293
> error: drivers/pci/pci.c: patch does not apply
> 
> I have commented out that patch for today.

Sorry, damage to that part of the series.  I've fixed this properly
now and just pushed.

Thanks,
Rusty.

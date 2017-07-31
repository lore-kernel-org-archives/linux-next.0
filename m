From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure in the staging tree (Was: kisskb:
 FAILED linux-next/s390-allmodconfig/s390x Mon Jul 31, 17:24)
Date: Mon, 31 Jul 2017 08:58:50 -0700
Message-ID: <20170731155850.GD1262@kroah.com>
References: <20170731072425.1.95853@222023911cb9>
 <20170731193546.6d0538cf@canb.auug.org.au>
 <597EFE81.9010407@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51920 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751951AbdGaP6y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Jul 2017 11:58:54 -0400
Content-Disposition: inline
In-Reply-To: <597EFE81.9010407@nxp.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Jul 31, 2017 at 09:55:14AM +0000, Laurentiu Tudor wrote:
> Hi Stephen,
> 
> That's because the fsl-mc driver selects GENERIC_MSI_IRQ_DOMAIN and not 
> all arches implement the support for the option. I can submit a patch 
> that adds explicit dependencies on arches that it was build-tested (x86, 
> arm, powerpc, all both 32 and 64 bits) similar to how it's done here 
> [1]. Let me know if you're ok with this fix and i'll submit the fix to 
> staging.

Ugh, you should not be selecting that option, but rather depending on
the option, right?

thanks,

greg k-h

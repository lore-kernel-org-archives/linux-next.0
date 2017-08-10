From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure in the staging tree (Was: kisskb:
 FAILED linux-next/s390-allmodconfig/s390x Mon Jul 31, 17:24)
Date: Fri, 11 Aug 2017 09:41:09 +1000
Message-ID: <20170811094109.2d314b7f@canb.auug.org.au>
References: <20170731072425.1.95853@222023911cb9>
        <20170731193546.6d0538cf@canb.auug.org.au>
        <597EFE81.9010407@nxp.com>
        <20170731155850.GD1262@kroah.com>
        <59803B7E.7050001@nxp.com>
        <20170807102208.597379d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42181 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750841AbdHJXlL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Aug 2017 19:41:11 -0400
In-Reply-To: <20170807102208.597379d4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi all,

On Mon, 7 Aug 2017 10:22:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Tue, 1 Aug 2017 08:29:31 +0000 Laurentiu Tudor <laurentiu.tudor@nxp.com> wrote:
> >
> > On 07/31/2017 06:58 PM, Greg KH wrote:  
> > > On Mon, Jul 31, 2017 at 09:55:14AM +0000, Laurentiu Tudor wrote:    
> > >>
> > >> That's because the fsl-mc driver selects GENERIC_MSI_IRQ_DOMAIN and not
> > >> all arches implement the support for the option. I can submit a patch
> > >> that adds explicit dependencies on arches that it was build-tested (x86,
> > >> arm, powerpc, all both 32 and 64 bits) similar to how it's done here
> > >> [1]. Let me know if you're ok with this fix and i'll submit the fix to
> > >> staging.    
> > >
> > > Ugh, you should not be selecting that option, but rather depending on
> > > the option, right?    
> > 
> > All users in the kernel use "select", so i don't think so. An 
> > interesting use that adds explicit dependencies on architectures can be
> > seen here [1], in the generic code. I've proposed a patch [2] that does 
> > a similar thing for mc-bus. I think it's a good approach as it keeps 
> > things under control by explicitly specifying the architectures on which
> > the driver was compile-tested.
> > 
> > ---
> > Best Regards, Laurentiu
> > 
> > [1] 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/Kconfig#n28
> > [2] https://patchwork.kernel.org/patch/9871861/  
> 
> Any resolution of this?

Ping?
-- 
Cheers,
Stephen Rothwell

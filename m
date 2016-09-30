From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the arm64 tree
Date: Fri, 30 Sep 2016 07:44:30 +0200
Message-ID: <20160930054430.GB5458@kroah.com>
References: <20160930133822.0bf16c41@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57787 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S936004AbcI3FxP (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Sep 2016 01:53:15 -0400
Content-Disposition: inline
In-Reply-To: <20160930133822.0bf16c41@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Will Deacon <will.deacon@arm.com>, Aleksey Makarov <aleksey.makarov@linaro.org>

On Fri, Sep 30, 2016 at 01:38:22PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got conflicts in:
> 
>   arch/arm64/Kconfig
> 
> between commit:
> 
>   1d8f51d41fc7 ("arm/arm64: arch_timer: Use archdata to indicate vdso suitability")
> 
> from the arm64 tree and commit:
> 
>   888125a71298 ("ARM64: ACPI: enable ACPI_SPCR_TABLE")
> 
> from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me.

From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: manual merge of the tpmdd tree with Linus' tree
Date: Fri, 8 Dec 2017 12:46:33 +0200
Message-ID: <20171208104633.rnwemhajfp3uvqmc@linux.intel.com>
References: <20171208132536.0c55270d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:3187 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751321AbdLHKqh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 Dec 2017 05:46:37 -0500
Content-Disposition: inline
In-Reply-To: <20171208132536.0c55270d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Dec 08, 2017 at 01:25:35PM +1100, Stephen Rothwell wrote:
> Hi Jarkko,
> 
> Today's linux-next merge of the tpmdd tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   60fdb44a23cb ("MAINTAINERS: update TPM driver infrastructure changes")
> 
> from Linus' tree and commit:
> 
>   510230d28445 ("tpm: Update MAINTAINERS for Jason Gunthorpe")
> 
> from the tpmdd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell

Sorry, I'll remove this commit up until security tree is updated to
4.5-rcX.

/Jarkko

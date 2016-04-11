From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Mon, 11 Apr 2016 09:57:25 -0700
Message-ID: <20160411165725.GA3343@kroah.com>
References: <20160405134927.75b47655@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:37827 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752686AbcDKQ51 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Apr 2016 12:57:27 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0516920C19
	for <linux-next@vger.kernel.org>; Mon, 11 Apr 2016 12:57:27 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20160405134927.75b47655@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

On Tue, Apr 05, 2016 at 01:49:27PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in:
> 
>   drivers/staging/lustre/lnet/selftest/brw_test.c
>   drivers/staging/lustre/lustre/include/lu_object.h
>   drivers/staging/lustre/lustre/lclient/lcommon_cl.c
>   drivers/staging/lustre/lustre/llite/llite_internal.h
>   drivers/staging/lustre/lustre/llite/llite_lib.c
>   drivers/staging/lustre/lustre/llite/llite_mmap.c
>   drivers/staging/lustre/lustre/llite/rw.c
>   drivers/staging/lustre/lustre/llite/rw26.c
>   drivers/staging/lustre/lustre/llite/vvp_io.c
>   drivers/staging/lustre/lustre/llite/vvp_page.c
>   drivers/staging/lustre/lustre/obdclass/class_obd.c
>   drivers/staging/lustre/lustre/obdecho/echo_client.c
>   drivers/staging/lustre/lustre/osc/lproc_osc.c
>   drivers/staging/lustre/lustre/osc/osc_cache.c
>   drivers/staging/lustre/lustre/osc/osc_page.c
>   drivers/staging/lustre/lustre/osc/osc_request.c
> 
> between commits:
> 
>   09cbfeaf1a5a ("mm, fs: get rid of PAGE_CACHE_* and page_cache_{get,release} macros")
>   ea1754a08476 ("mm, fs: remove remaining PAGE_CACHE_* and page_cache_{get,release} usage")
> 
> from Linus' tree and lots of commits from the staging tree.
> 
> I fixed it up (see below the signature) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 
> I also added this merge fix patch:

Thanks for this, it should all now be resolved in my tree.

greg k-h

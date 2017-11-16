From: Minchan Kim <minchan@kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 nvdimm tree
Date: Thu, 16 Nov 2017 13:55:26 +0900
Message-ID: <20171116045526.GA13115@bbox>
References: <20171116141627.65df4240@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from LGEAMRELO13.lge.com ([156.147.23.53]:54047 "EHLO
        lgeamrelo13.lge.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932420AbdKPEz2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Nov 2017 23:55:28 -0500
Content-Disposition: inline
In-Reply-To: <20171116141627.65df4240@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stephen,

On Thu, Nov 16, 2017 at 02:16:27PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   drivers/block/brd.c
> 
> between commit:
> 
>   7a862fbbdec6 ("brd: remove dax support")
> 
> from the nvdimm tree and commit:
> 
>   f8ace3501d00 ("bdi: introduce BDI_CAP_SYNCHRONOUS_IO")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This

It's good for me.
Thanks.

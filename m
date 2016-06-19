From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Sun, 19 Jun 2016 21:17:34 +0100
Message-ID: <68e8846e-a7e8-12f2-8ed5-a045c56317b2@kernel.org>
References: <20160614150422.66d652de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from saturn.retrosnub.co.uk ([178.18.118.26]:39872 "EHLO
	saturn.retrosnub.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751292AbcFSURh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 19 Jun 2016 16:17:37 -0400
In-Reply-To: <20160614150422.66d652de@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Crestez Dan Leonard <leonard.crestez@intel.com>

On 14/06/16 06:04, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/iio/industrialio-trigger.c
> 
> between commit:
> 
>   995438233579 ("iio: Fix error handling in iio_trigger_attach_poll_func")
> 
> from the staging.current tree and commit:
> 
>   ef2d71d6b7fb ("iio: triggers: Make trigger ops structure explicitly non optional.")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
Thanks Stephen,

Looks great.

Jonathan

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Tue, 14 Jun 2016 15:04:22 +1000
Message-ID: <20160614150422.66d652de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47403 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751213AbcFNFEZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Jun 2016 01:04:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Crestez Dan Leonard <leonard.crestez@intel.com>, Jonathan Cameron <jic23@kernel.org>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/iio/industrialio-trigger.c

between commit:

  995438233579 ("iio: Fix error handling in iio_trigger_attach_poll_func")

from the staging.current tree and commit:

  ef2d71d6b7fb ("iio: triggers: Make trigger ops structure explicitly non optional.")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/iio/industrialio-trigger.c
index 0c52dfe64977,672911293987..000000000000
--- a/drivers/iio/industrialio-trigger.c
+++ b/drivers/iio/industrialio-trigger.c
@@@ -220,14 -217,15 +223,14 @@@ static int iio_trigger_attach_poll_func
  	ret = request_threaded_irq(pf->irq, pf->h, pf->thread,
  				   pf->type, pf->name,
  				   pf);
 -	if (ret < 0) {
 -		module_put(pf->indio_dev->info->driver_module);
 -		return ret;
 -	}
 +	if (ret < 0)
 +		goto out_put_irq;
  
 +	/* Enable trigger in driver */
- 	if (trig->ops && trig->ops->set_trigger_state && notinuse) {
+ 	if (trig->ops->set_trigger_state && notinuse) {
  		ret = trig->ops->set_trigger_state(trig, true);
  		if (ret < 0)
 -			module_put(pf->indio_dev->info->driver_module);
 +			goto out_free_irq;
  	}
  
  	return ret;

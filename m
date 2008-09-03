From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: block tree build failure
Date: Wed, 03 Sep 2008 18:27:12 +0200
Message-ID: <48BEBAE0.4050305@kernel.org>
References: <20080903161526.636b6d0d.sfr@canb.auug.org.au>	<20080903063419.GK20055@kernel.dk>	<20080903000418.aa2434fe.akpm@linux-foundation.org>	<20080903070723.GL20055@kernel.dk> <20080903090558.de8510e8.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:57536 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751406AbYICQ31 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Sep 2008 12:29:27 -0400
In-Reply-To: <20080903090558.de8510e8.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Andrew Morton wrote:
> @@ -674,6 +674,8 @@ static void *disk_seqf_next(struct seq_f
>  	struct device *dev;
>  
>  	(*pos)++;
> +	if (seqf->private == NULL)
> +		return NULL;
>  	dev = class_dev_iter_next(seqf->private);
>  	if (dev)
>  		return dev_to_disk(dev);

Ehh... next can't be called with NULL private.  Where can I take a look
at the merged tree?  There have been two separate changes to that area
of code.  Ad-hoc behavior fix for 2.6.27 and general clean up scheduled
for 2.6.28 and the two use seqf->private for different purposes.  Maybe
the two got mixed up?

Thanks.

-- 
tejun

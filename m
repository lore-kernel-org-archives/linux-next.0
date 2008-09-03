From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: block tree build failure
Date: Wed, 3 Sep 2008 09:32:45 -0700
Message-ID: <20080903093245.da237b40.akpm@linux-foundation.org>
References: <20080903161526.636b6d0d.sfr@canb.auug.org.au>
	<20080903063419.GK20055@kernel.dk>
	<20080903000418.aa2434fe.akpm@linux-foundation.org>
	<20080903070723.GL20055@kernel.dk>
	<20080903090558.de8510e8.akpm@linux-foundation.org>
	<48BEBAE0.4050305@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:46307 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752024AbYICQdH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Sep 2008 12:33:07 -0400
In-Reply-To: <48BEBAE0.4050305@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wed, 03 Sep 2008 18:27:12 +0200 Tejun Heo <tj@kernel.org> wrote:

> Andrew Morton wrote:
> > @@ -674,6 +674,8 @@ static void *disk_seqf_next(struct seq_f
> >  	struct device *dev;
> >  
> >  	(*pos)++;
> > +	if (seqf->private == NULL)
> > +		return NULL;
> >  	dev = class_dev_iter_next(seqf->private);
> >  	if (dev)
> >  		return dev_to_disk(dev);
> 
> Ehh... next can't be called with NULL private.

My computer disagreed ;)

>  Where can I take a look
> at the merged tree?  There have been two separate changes to that area
> of code.  Ad-hoc behavior fix for 2.6.27 and general clean up scheduled
> for 2.6.28 and the two use seqf->private for different purposes.  Maybe
> the two got mixed up?

It's linux-next-20080903

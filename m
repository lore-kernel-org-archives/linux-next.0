From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [BUG -next] "random: make /dev/urandom scalable for silly
 userspace programs" causes crash
Date: Thu, 28 Jul 2016 07:55:48 +0200
Message-ID: <20160728055548.GA3942@osiris>
References: <20160727071400.GA3912@osiris>
 <20160728034601.GC20032@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27895 "EHLO
	mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1163020AbcG1Fzz (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Jul 2016 01:55:55 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6S5naHm099285
	for <linux-next@vger.kernel.org>; Thu, 28 Jul 2016 01:55:55 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 24e1ha5q4j-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-next@vger.kernel.org>; Thu, 28 Jul 2016 01:55:54 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Thu, 28 Jul 2016 06:55:52 +0100
Content-Disposition: inline
In-Reply-To: <20160728034601.GC20032@thunk.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Wed, Jul 27, 2016 at 11:46:01PM -0400, Theodore Ts'o wrote:
> On Wed, Jul 27, 2016 at 09:14:00AM +0200, Heiko Carstens wrote:
> > it looks like your patch "random: make /dev/urandom scalable for silly
> > userspace programs" within linux-next seems to be a bit broken:
> > 
> > It causes this allocation failure and subsequent crash on s390 with fake
> > NUMA enabled
> 
> Thanks for reporting this.  This patch fixes things for you, yes?
> 
>        	   	     	    	       	     	    - Ted

Yes, it does. It's actually the same what I did to fix this ;)

> commit 59b8d4f1f5d26e4ca92172ff6dcd1492cdb39613
> Author: Theodore Ts'o <tytso@mit.edu>
> Date:   Wed Jul 27 23:30:25 2016 -0400
> 
>     random: use for_each_online_node() to iterate over NUMA nodes
>     
>     This fixes a crash on s390 with fake NUMA enabled.
>     
>     Reported-by: Heiko Carstens <heiko.carstens@de.ibm.com>
>     Fixes: 1e7f583af67b ("random: make /dev/urandom scalable for silly userspace programs")
>     Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> 
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index 8d0af74..7f06224 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -1668,13 +1668,12 @@ static int rand_initialize(void)
>  #ifdef CONFIG_NUMA
>  	pool = kmalloc(num_nodes * sizeof(void *),
>  		       GFP_KERNEL|__GFP_NOFAIL|__GFP_ZERO);
> -	for (i=0; i < num_nodes; i++) {
> +	for_each_online_node(i) {
>  		crng = kmalloc_node(sizeof(struct crng_state),
>  				    GFP_KERNEL | __GFP_NOFAIL, i);
>  		spin_lock_init(&crng->lock);
>  		crng_initialize(crng);
>  		pool[i] = crng;
> -
>  	}
>  	mb();
>  	crng_node_pool = pool;
> 

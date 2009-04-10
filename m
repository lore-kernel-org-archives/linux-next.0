From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: [CFQ/OOPS]  rb_erase with April 9 next tree
Date: Fri, 10 Apr 2009 12:10:02 +0530
Message-ID: <49DEE9C2.1040500@in.ibm.com>
References: <20090409163305.8c7a0371.sfr@canb.auug.org.au> <49DE1969.1000709@in.ibm.com> <20090409172918.GE5178@kernel.dk> <20090409174420.GG5178@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:58340 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753139AbZDJGkI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2009 02:40:08 -0400
In-Reply-To: <20090409174420.GG5178@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linuxppc-dev@ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Jens Axboe wrote:
>
> Can you see if this fixes it for you?
>
> diff --git a/block/cfq-iosched.c b/block/cfq-iosched.c
> index e01b103..64de5c0 100644
> --- a/block/cfq-iosched.c
> +++ b/block/cfq-iosched.c
> @@ -1654,6 +1654,7 @@ retry:
>  		}
>
>  		RB_CLEAR_NODE(&cfqq->rb_node);
> +		RB_CLEAR_NODE(&cfqq->p_node);
>  		INIT_LIST_HEAD(&cfqq->fifo);
>
>  		atomic_set(&cfqq->ref, 0);
>   
Yes. The above patch fixed this oops. Thanks

Regards
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------

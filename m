From: Steve Wise <swise@opengridcomputing.com>
Subject: Re: [ofa-general] [PATCH 2.6.30] RDMA/cxgb3: Remove modulo math.
Date: Tue, 10 Feb 2009 19:03:52 -0600
Message-ID: <499223F8.1010204__23334.9969414578$1234721274$gmane$org@opengridcomputing.com>
References: <20090210184448.22891.31130.stgit@dell3.ogc.int> <adamyctajv8.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.opengridcomputing.com ([209.198.142.2]:57782 "EHLO
	smtp.opengridcomputing.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752103AbZBKBD5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Feb 2009 20:03:57 -0500
In-Reply-To: <adamyctajv8.fsf@cisco.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>
Cc: randy.dunlap@oracle.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, general@lists.openfabrics.org

Roland Dreier wrote:
> I'll roll this into the offending patch (that is in -next).
>
> But:
>
>  > -		wqe->recv.sgl[i].to = cpu_to_be64(((u32) wr->sg_list[i].addr) %
>  > -				(1UL << (12 + page_size[i])));
>  > +		wqe->recv.sgl[i].to = cpu_to_be64(((u64) wr->sg_list[i].addr) &
>  > +				((1UL << (12 + page_size[i]))-1));
>
> Is this required?  Strength reduction optimization should do this
> automatically (and the code has been there for quite a while, so
> obviously it isn't causing problems)
>
>  - R.
>   
Ok.

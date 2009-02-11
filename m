From: Steve Wise <swise@opengridcomputing.com>
Subject: Re: [ofa-general] [PATCH 2.6.30] RDMA/cxgb3: Remove modulo math.
Date: Wed, 11 Feb 2009 12:44:45 -0600
Message-ID: <49931C9D.2090604@opengridcomputing.com>
References: <20090210184448.22891.31130.stgit@dell3.ogc.int>	<adamyctajv8.fsf@cisco.com>
	<4992F26A.4030800@opengridcomputing.com>	<adatz70972e.fsf@cisco.com>
	<499319CF.6050204@opengridcomputing.com>
	<adak57w95ym.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <adak57w95ym.fsf@cisco.com>
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Roland Dreier <rdreier@cisco.com>
Cc: randy.dunlap@oracle.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

Roland Dreier wrote:
>  > > Is it possible for the page to be bigger than 4GB?  If so then yes you
>  > > might be chopping off high-order bits or something.
>
>  > Yes it is possible.
>  > 
>  > A MR can be created with an iov_base of say 0xffffffff00000000.
>  > 
>  > Then any sge.addr entries would be the iob_base + any offset.
>
> But the code we're talking about is:
>
> 		/* to in the WQE == the offset into the page */
> 		wqe->recv.sgl[i].to = cpu_to_be64(((u32) wr->sg_list[i].addr) %
> 				(1UL << (12 + page_size[i])));
>
> so it seems the top address bits don't matter unless page_size[i] is at
> least 20 -- in which case using 1UL to shift overflows on 32 bits anyway...
>
>   

Yes yes...you're right.   This code is really just saving the offset in 
a page.

I'll send a new patch.

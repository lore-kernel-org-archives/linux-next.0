From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ofa-general] [PATCH 2.6.30] RDMA/cxgb3: Remove modulo math.
Date: Wed, 11 Feb 2009 10:36:01 -0800
Message-ID: <adak57w95ym.fsf@cisco.com>
References: <20090210184448.22891.31130.stgit@dell3.ogc.int>
	<adamyctajv8.fsf@cisco.com> <4992F26A.4030800@opengridcomputing.com>
	<adatz70972e.fsf@cisco.com> <499319CF.6050204@opengridcomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <499319CF.6050204@opengridcomputing.com> (Steve Wise's message of
	"Wed, 11 Feb 2009 12:32:47 -0600")
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Steve Wise <swise@opengridcomputing.com>
Cc: randy.dunlap@oracle.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

 > > Is it possible for the page to be bigger than 4GB?  If so then yes you
 > > might be chopping off high-order bits or something.

 > Yes it is possible.
 > 
 > A MR can be created with an iov_base of say 0xffffffff00000000.
 > 
 > Then any sge.addr entries would be the iob_base + any offset.

But the code we're talking about is:

		/* to in the WQE == the offset into the page */
		wqe->recv.sgl[i].to = cpu_to_be64(((u32) wr->sg_list[i].addr) %
				(1UL << (12 + page_size[i])));

so it seems the top address bits don't matter unless page_size[i] is at
least 20 -- in which case using 1UL to shift overflows on 32 bits anyway...

 > So you are handling the offset patch that will make it u64 and remove
 > the mod usage, correct?

Yeah, I rolled the fix into the "offset needs to be u64" patch, it
should be in linux-next by now (or at least in my for-next branch).

 - R.

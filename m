From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ofa-general] [PATCH 2.6.30] RDMA/cxgb3: Remove modulo math.
Date: Tue, 10 Feb 2009 16:38:03 -0800
Message-ID: <adamyctajv8.fsf@cisco.com>
References: <20090210184448.22891.31130.stgit@dell3.ogc.int>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <20090210184448.22891.31130.stgit@dell3.ogc.int> (Steve Wise's
	message of "Tue, 10 Feb 2009 12:44:48 -0600")
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

I'll roll this into the offending patch (that is in -next).

But:

 > -		wqe->recv.sgl[i].to = cpu_to_be64(((u32) wr->sg_list[i].addr) %
 > -				(1UL << (12 + page_size[i])));
 > +		wqe->recv.sgl[i].to = cpu_to_be64(((u64) wr->sg_list[i].addr) &
 > +				((1UL << (12 + page_size[i]))-1));

Is this required?  Strength reduction optimization should do this
automatically (and the code has been there for quite a while, so
obviously it isn't causing problems)

 - R.

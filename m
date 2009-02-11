From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ofa-general] [PATCH 2.6.30] RDMA/cxgb3: Remove modulo math.
Date: Wed, 11 Feb 2009 10:12:09 -0800
Message-ID: <adatz70972e.fsf@cisco.com>
References: <20090210184448.22891.31130.stgit@dell3.ogc.int>
	<adamyctajv8.fsf@cisco.com> <4992F26A.4030800@opengridcomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <4992F26A.4030800@opengridcomputing.com> (Steve Wise's message of
	"Wed, 11 Feb 2009 09:44:42 -0600")
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

 > Note that wr->sg_list[i].addr was being cast to a u32.  That was wrong.

Is it possible for the page to be bigger than 4GB?  If so then yes you
might be chopping off high-order bits or something.

Anyway please send me this change as a separate patch with a changelog
explaining that you're avoiding the div etc.... I don't want to roll it
in with the other unrelated fix (which changes code that was never
upstream anyway).

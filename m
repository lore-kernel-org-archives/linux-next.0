From: Roland Dreier <rdreier@cisco.com>
Subject: [ofa-general] Re: linux-next: origin tree build failure
Date: Mon, 29 Dec 2008 23:38:18 -0800
Message-ID: <adavdt2ru39.fsf@cisco.com>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <20081229114321.4b6baea5.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Mon, 29 Dec 2008 11:43:21 +1100")
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

 > ERROR: ".ipv6_chk_addr" [drivers/infiniband/core/ib_addr.ko] undefined!
 > ERROR: ".ip6_route_output" [drivers/infiniband/core/ib_addr.ko] undefined!

OK, I pushed out a change that should fix this, so you can drop the
revert.  Let me know if you see further issues.

 - R.

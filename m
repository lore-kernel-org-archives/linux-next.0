From: Aleksey Senin <alekseys@voltaire.com>
Subject: [ofa-general] Re: linux-next: origin tree build failure
Date: Mon, 29 Dec 2008 18:52:02 +0200
Message-ID: <1230569522.4261.44.camel@alst60>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
	<ada4p0nve4r.fsf@cisco.com> <1230544737.4261.33.camel@alst60>
	<adavdt3t0wf.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <adavdt3t0wf.fsf@cisco.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, "general@lists.openfabrics.org" <general@lists.openfabrics.org>
List-Id: linux-next.vger.kernel.org

I thought about this.It can be solved by loading ipv6 module before
RDMA_CM by specifying modules dependencies in modprobe.conf file. At
least this solution helps in the the case when administrator want IB,
but not IPv6.
On Mon, 2008-12-29 at 08:13 -0800, Roland Dreier wrote:
> > After another investigation of this problem, I think that proposed
>  > solution is #ifdef as good for a first stage. IPv6 support is mandatory
>  > when we are talking about running linux in some organization. But, of
>  > course, the way how it implemented in IB stack should be changed. So on
>  > the second stage, I'd like drop out these "defines" and at the time of
>  > module initialization obtain addresses of IPv6 functions and in the case
>  > if they are present at the runtime, call them. It should be nice
>  > solution for RMDA_CM and IPoIB modules.
> 
> I don't think this second stage sounds like a good idea.  Suppose
> someone loads the RDMA CM first, so it doesn't find the ipv6 functions,
> and then later loads and configures ipv6.  You'll end up in a situation
> where trying to make an IPv6 connection fails spuriously.  (And just the
> ugliness of looking up function pointers isn't very nice either)
> 
>  - R.

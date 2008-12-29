From: Roland Dreier <rdreier@cisco.com>
Subject: [ofa-general] Re: linux-next: origin tree build failure
Date: Mon, 29 Dec 2008 13:35:02 -0800
Message-ID: <adahc4mu0l5.fsf@cisco.com>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
	<ada4p0nve4r.fsf@cisco.com> <1230544737.4261.33.camel@alst60>
	<adaljtyu45d.fsf@cisco.com>
	<alpine.LFD.2.00.0812291304471.3082@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <alpine.LFD.2.00.0812291304471.3082@localhost.localdomain> (Linus
	Torvalds's message of "Mon, 29 Dec 2008 13:07:16 -0800 (PST)")
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "general@lists.openfabrics.org" <general@lists.openfabrics.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

 > I'd suggest
 > 
 >   config IF_IPV6
 > 	bool
 > 	depends on INET
 > 	depends on !(INFINIBAND = y && IPV6 = m)
 > 	default y

Makes sense, will do.  How about calling it INFINIBAND_USE_IPV6 or
something like that, though?  (Since it's under the INFINIBAND config
stuff and exists to forbid INFINIBAND=y && IPV6=m trying to use IPv6).
But see below:

 > but also use it in the source code as a more readable version:
 > 
 > > diff --git a/drivers/infiniband/core/addr.c b/drivers/infiniband/core/addr.c
 > > index d98b05b..ec7abb5 100644
 > > --- a/drivers/infiniband/core/addr.c> +++ b/drivers/infiniband/core/addr.c
 > > @@ -128,6 +128,7 @@ int rdma_translate_ip(struct sockaddr *addr, struct rdma_dev_addr *dev_addr)
 > >  		ret = rdma_copy_addr(dev_addr, dev, NULL);
 > >  		dev_put(dev);
 > >  		break;
 > > +#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
 > 
 > ie use
 > 
 > 	#ifdef CONFIG_IF_IPV6

this doesn't make sense, does it?  Your CONFIG_IF_IPV6 will be set in
the case IPV6=n too I think.  (Which is the whole point... we want to
build this code, just without IPv6 support, if IPv6 is turned off
completely)

 - R.

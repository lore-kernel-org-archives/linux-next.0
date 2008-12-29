From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ofa-general] Re: linux-next: origin tree build failure
Date: Mon, 29 Dec 2008 13:48:18 -0800
Message-ID: <adad4fatzz1.fsf@cisco.com>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
	<ada4p0nve4r.fsf@cisco.com> <1230544737.4261.33.camel@alst60>
	<adaljtyu45d.fsf@cisco.com>
	<alpine.LFD.2.00.0812291304471.3082@localhost.localdomain>
	<adahc4mu0l5.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <adahc4mu0l5.fsf@cisco.com> (Roland Dreier's message of "Mon, 29
	Dec 2008 13:35:02 -0800")
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "general@lists.openfabrics.org" <general@lists.openfabrics.org>
List-Id: linux-next.vger.kernel.org

 >  > I'd suggest
 >  > 
 >  >   config IF_IPV6
 >  > 	bool
 >  > 	depends on INET
 >  > 	depends on !(INFINIBAND = y && IPV6 = m)
 >  > 	default y
 > 
 > Makes sense, will do.  How about calling it INFINIBAND_USE_IPV6 or
 > something like that, though?  (Since it's under the INFINIBAND config
 > stuff and exists to forbid INFINIBAND=y && IPV6=m trying to use IPv6).

Actually, thinking about this for 30 more seconds, I'm not sure how
another config symbol helps at all.  I do like splitting dependencies
onto multiple lines as a replacement for &&, so I have:

config INFINIBAND_ADDR_TRANS
	bool
	depends on INET
	depends on !(INFINIBAND = y && IPV6 = m)
	default y

right now.

Not sure if it's worth introducing another Kconfig symbol that depends
on IPV6 != n to avoid the

#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)

tests.  I note that there are tons of that construction all over the
tree, and the places without it look somewhat dubious (eg
net/ipv4/ip_gre.c looks as if it will do the wrong thing if IPV6=m).
Maybe adding CONFIG_IPV6_ENABLED or something and cleaning up the whole
tree would be a good janitorial project?

 - R.

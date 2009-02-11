From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ofa-general] [PATCH 2.6.30] RDMA/cxgb3: Remove modulo math.
Date: Tue, 10 Feb 2009 23:20:39 -0800
Message-ID: <ada4oz1a188.fsf@cisco.com>
References: <499223F8.1010204@opengridcomputing.com>
	<20090210.170740.208470781.davem@davemloft.net>
	<adaeiy5ahza.fsf@cisco.com>
	<20090210.172347.189515015.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <20090210.172347.189515015.davem@davemloft.net> (David Miller's
	message of "Tue, 10 Feb 2009 17:23:47 -0800 (PST)")
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: David Miller <davem@davemloft.net>
Cc: randy.dunlap@oracle.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

 > Must be compiler and platform specific because with gcc-4.1.3 on
 > sparc with -O2, for the test program:
 > 
 > unsigned long page_size[4];
 > 
 > int main(int argc)
 > {
 >         unsigned long long x = argc;
 > 
 >         return x % (1UL << (12 + page_size[argc]));
 > }
 > 
 > I get a call to __umoddi3:

You're not testing the same thing.  The original code was:

		wqe->recv.sgl[i].to = cpu_to_be64(((u32) wr->sg_list[i].addr) %
				(1UL << (12 + page_size[i])));

and it's not that easy to see with all the parentheses, but the
expression being done is (u32) % (unsigned long).  So rather than
unsigned long long in your program, you should have just done unsigned
(u32 is unsigned int on all Linux architectures).  In that case gcc does
not generate a call to any library function in all the versions I have
handy, although gcc 4.1 does do a div instead of an and.  (And I don't
think any 32-bit architectures require a library function for (unsigned)
% (unsigned), so the code should be OK)

Your example shows that gcc is missing a strength reduction opportunity
in not handling (u64) % (unsigned long) on 32 bit architectures, but I
guess it is a more difficult optimization to do, since gcc has to know
that it can simply zero the top 32 bits.

 - R.

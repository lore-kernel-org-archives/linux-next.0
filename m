From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ofa-general] [PATCH 2.6.30] RDMA/cxgb3: Remove modulo math.
Date: Tue, 10 Feb 2009 17:18:49 -0800
Message-ID: <adaeiy5ahza.fsf@cisco.com>
References: <20090210184448.22891.31130.stgit@dell3.ogc.int>
	<adamyctajv8.fsf@cisco.com> <499223F8.1010204@opengridcomputing.com>
	<20090210.170740.208470781.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <20090210.170740.208470781.davem@davemloft.net> (David Miller's
	message of "Tue, 10 Feb 2009 17:07:40 -0800 (PST)")
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
Cc: randy.dunlap@oracle.com, linux-next@vger.kernel.org, general@lists.openfabrics.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

> > Is this required?  Strength reduction optimization should do this
> > automatically (and the code has been there for quite a while, so
> > obviously it isn't causing problems)

> GCC won't optimize that modulus the way you expect, try for yourself
> and look at the assembler if you don't believe me. :-)

Are you thinking of the case when there are signed integers involved and
so "% modulus" might produce a different result than "& (modulus - 1)"
(because the compiler can't know that things are never negative)?
Because in this case the compiler seems to do what I thought it would;
the relevant part of the i386 assembly for

		wqe->recv.sgl[i].to = cpu_to_be64(((u32) wr->sg_list[i].addr) %
				(1UL << (12 + page_size[i])));

is

        movl    %eax, 28(%edi,%ebx)     # <variable>.length,
        <variable>.len
        movzbl  28(%esp,%esi), %ecx     # page_size, tmp89
        movl    $1, %eax        #, tmp92
        addl    $12, %ecx       #, tmp90
        sall    %cl, %eax       # tmp90, tmp92
        movl    (%esp), %ecx    # wr,
        decl    %eax    # tmp93
        movl    12(%ecx), %edx  # <variable>.sg_list, <variable>.sg_list
        andl    (%edx,%ebx), %eax       # <variable>.addr, tmp93

ie the compiler computes the modulus, then does decl to compute
modulus-1 and then &s with it.

Or am I misunderstanding your point?

 - R.

From: David Miller <davem@davemloft.net>
Subject: Re: [ofa-general] [PATCH 2.6.30] RDMA/cxgb3: Remove modulo math.
Date: Tue, 10 Feb 2009 17:23:47 -0800 (PST)
Message-ID: <20090210.172347.189515015.davem@davemloft.net>
References: <499223F8.1010204@opengridcomputing.com>
	<20090210.170740.208470781.davem@davemloft.net>
	<adaeiy5ahza.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <adaeiy5ahza.fsf@cisco.com>
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: rdreier@cisco.com
Cc: randy.dunlap@oracle.com, linux-next@vger.kernel.org, general@lists.openfabrics.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Roland Dreier <rdreier@cisco.com>
Date: Tue, 10 Feb 2009 17:18:49 -0800

> > > Is this required?  Strength reduction optimization should do this
> > > automatically (and the code has been there for quite a while, so
> > > obviously it isn't causing problems)
> 
> > GCC won't optimize that modulus the way you expect, try for yourself
> > and look at the assembler if you don't believe me. :-)
> 
> Are you thinking of the case when there are signed integers involved and
> so "% modulus" might produce a different result than "& (modulus - 1)"
> (because the compiler can't know that things are never negative)?
> Because in this case the compiler seems to do what I thought it would;
> the relevant part of the i386 assembly for
> 
> 		wqe->recv.sgl[i].to = cpu_to_be64(((u32) wr->sg_list[i].addr) %
> 				(1UL << (12 + page_size[i])));
> 
> is
> 
>         movl    %eax, 28(%edi,%ebx)     # <variable>.length,
>         <variable>.len
>         movzbl  28(%esp,%esi), %ecx     # page_size, tmp89
>         movl    $1, %eax        #, tmp92
>         addl    $12, %ecx       #, tmp90
>         sall    %cl, %eax       # tmp90, tmp92
>         movl    (%esp), %ecx    # wr,
>         decl    %eax    # tmp93
>         movl    12(%ecx), %edx  # <variable>.sg_list, <variable>.sg_list
>         andl    (%edx,%ebx), %eax       # <variable>.addr, tmp93
> 
> ie the compiler computes the modulus, then does decl to compute
> modulus-1 and then &s with it.
> 
> Or am I misunderstanding your point?

Must be compiler and platform specific because with gcc-4.1.3 on
sparc with -O2, for the test program:

unsigned long page_size[4];

int main(int argc)
{
        unsigned long long x = argc;

        return x % (1UL << (12 + page_size[argc]));
}

I get a call to __umoddi3:

main:
        save    %sp, -112, %sp
        sethi   %hi(page_size), %g1
        sll     %i0, 2, %g3
        or      %g1, %lo(page_size), %g1
        mov     1, %o2
        ld      [%g1+%g3], %g2
        add     %g2, 12, %g2
        sll     %o2, %g2, %o2
        mov     %i0, %o1
        mov     %o2, %o3
        sra     %i0, 31, %o0
        call    __umoddi3, 0
         mov    0, %o2
        jmp     %i7+8
         restore %g0, %o1, %o0

I get the same with gcc-4.3.0 and -O2 on 32-bit x86:

main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	movl	$1, %eax
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$20, %esp
	movl	(%ecx), %edx
	movl	page_size(,%edx,4), %ecx
	movl	$0, 12(%esp)
	movl	%edx, (%esp)
	addl	$12, %ecx
	sall	%cl, %eax
	movl	%eax, 8(%esp)
	movl	%edx, %eax
	sarl	$31, %eax
	movl	%eax, 4(%esp)
	call	__umoddi3
	addl	$20, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret

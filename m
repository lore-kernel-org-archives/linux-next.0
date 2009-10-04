From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: Tree for October 2: percpu compile warnings (i386)
Date: Sun, 04 Oct 2009 09:25:40 +0900
Message-ID: <4AC7EB84.1060506@kernel.org>
References: <20091002134718.f577be51.sfr@canb.auug.org.au> <20091002094030.ffbde6ca.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:41369 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753875AbZJDAZk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 3 Oct 2009 20:25:40 -0400
In-Reply-To: <20091002094030.ffbde6ca.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hello,

Randy Dunlap wrote:
> mm/percpu.c:1873: warning: comparison of distinct pointer types lacks a cast
> mm/percpu.c:1879: warning: format '%lx' expects type 'long unsigned int', but argument 2 has type 'size_t'
> 
> The second one is easily fixed (s/%lx/%zu/), but is that the correct fix?

I think so.  Will fix it up.

> The first one is a max(size_t, unsigned long).
> The C99 spec says that the max value of a size_t is:
> 	limit of size_t
> 	SIZE_MAX 65535

The same section also says

  limits of ptrdiff_t
  PTRDIFF_MIN         -65535
  PTRDIFF_MAX         +65535

and ptrdiff_t is defined as

	 ptrdiff_t
  which is the signed integer type of the result of subtracting two
  pointers;

Also, later in that section.

  The types used for size_t and ptrdiff_t should not have an integer
  conversion rank greater than that of signed long int unless the
  implementation supports objects large enough to make this necessary.

So, it looks like the limits there are examples from 16bit systems
although it's not stated anywhere.  Strange choice...

Anyways, at least in kernel, it's assumed to be large enough to carry
any supported memory size and in that sense it should be as large as
ptrdiff_t or intptr_t.  Otherwise, we're already deeply screwed (no
allocation larger than 64k or no vmalloc area larger than 64k!).

Thanks.

-- 
tejun

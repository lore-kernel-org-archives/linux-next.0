From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: linux-next: Tree for October 17
Date: Fri, 17 Oct 2008 11:30:04 +0200
Message-ID: <19f34abd0810170230s755aa0e4vea38c26e093e173c@mail.gmail.com>
References: <20081017194045.202e6271.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.178]:17089 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752471AbYJQJaF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Oct 2008 05:30:05 -0400
Received: by wa-out-1112.google.com with SMTP id v27so280252wah.21
        for <linux-next@vger.kernel.org>; Fri, 17 Oct 2008 02:30:04 -0700 (PDT)
In-Reply-To: <20081017194045.202e6271.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>

On Fri, Oct 17, 2008 at 10:40 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's tree will not build for powerpc allyesconfig (libc aborts the
> link due to a free() problem), sparc(32) defconfig and probably some
> other configurations.

Hi, I ran into this with slightly modified fedora config:

  CC      net/9p/protocol.o
net/9p/protocol.c: In function 'p9pdu_finalize':
net/9p/protocol.c:545: error: 'p9_debug_level' undeclared (first use
in this function)
net/9p/protocol.c:545: error: (Each undeclared identifier is reported only once
net/9p/protocol.c:545: error: for each function it appears in.)
net/9p/protocol.c:545: error: 'P9_DEBUG_PKT' undeclared (first use in
this function)
make[2]: *** [net/9p/protocol.o] Error 1
make[1]: *** [net/9p] Error 2
make: *** [net] Error 2

...and couldn't find it in the automatic build test results either. 9P
maintainers Cced.


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036

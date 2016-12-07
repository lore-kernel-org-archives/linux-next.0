From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Dec 7 (kallsyms failure)
Date: Thu, 8 Dec 2016 10:56:07 +1100
Message-ID: <20161208105607.68810cae@canb.auug.org.au>
References: <20161207172432.184970d7@canb.auug.org.au>
        <13d83759-40d3-593b-b53f-f3e75fb05b7a@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49739 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932434AbcLGX4J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Dec 2016 18:56:09 -0500
In-Reply-To: <13d83759-40d3-593b-b53f-f3e75fb05b7a@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sachin Sant <sachinp@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>

Hi Randy,

On Wed, 7 Dec 2016 15:42:32 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
>
> I started seeing this yesterday (2016-1206).
> This is on x86_64.
> 
> Anybody know about it?
> 
> kallsyms failure: relative symbol value 0xffffffff81000000 out of range in relative mode

I got a similar failure starting a few days ago on my powerpc
allyesconfig build.  I was assuming that it was PowerPC specific, but
noone has found a cause yet.

-- 
Cheers,
Stephen Rothwell

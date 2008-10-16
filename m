From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: [PATCH] linux-next: Tree for October 16 - build failure at MAL
 support on powerpc
Date: Thu, 16 Oct 2008 15:27:55 -0400
Message-ID: <20081016152755.2b95f80c@zod.rchland.ibm.com>
References: <20081016211811.a523c8f2.sfr@canb.auug.org.au>
	<20081016192320.GA7534@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e1.ny.us.ibm.com ([32.97.182.141]:47474 "EHLO e1.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753758AbYJPT2A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 15:28:00 -0400
In-Reply-To: <20081016192320.GA7534@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, benh@kernel.crashing.org, apw@shadowen.org

On Fri, 17 Oct 2008 00:53:20 +0530
Kamalesh Babulal <kamalesh@linux.vnet.ibm.com> wrote:

> Hi Stephen,
> 
>         next-20081016 kernel build fails on powerpc, with build error
> 
> drivers/net/ibm_newemac/mal.c: In function 'mal_txeob':
> drivers/net/ibm_newemac/mal.c:284: error: implicit declaration of function 'mtdcri'
> drivers/net/ibm_newemac/mal.c:284: error: 'SDR0' undeclared (first use in this function)
> drivers/net/ibm_newemac/mal.c:284: error: (Each undeclared identifier is reported only once
> drivers/net/ibm_newemac/mal.c:284: error: for each function it appears in.)
> drivers/net/ibm_newemac/mal.c:285: error: implicit declaration of function 'mfdcri'
> drivers/net/ibm_newemac/mal.c: In function 'mal_rxeob':
> drivers/net/ibm_newemac/mal.c:302: error: 'SDR0' undeclared (first use in this function)
> make[3]: *** [drivers/net/ibm_newemac/mal.o] Error 1
> 
> Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>

I sent a more complete fix earlier today.

http://patchwork.ozlabs.org/patch/4708/

josh

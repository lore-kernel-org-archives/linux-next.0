From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the powerpc-mpe tree
Date: Sat, 11 Apr 2015 20:39:11 +1000
Message-ID: <1428748751.1552.0.camel@ellerman.id.au>
References: <20150410200240.13471ce4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36689 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752702AbbDKKjN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 11 Apr 2015 06:39:13 -0400
In-Reply-To: <20150410200240.13471ce4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2015-04-10 at 20:02 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc-mpe tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> mm/gup.c: In function 'gup_pte_range':
> mm/gup.c:904:3: error: conversion to non-scalar type requested
>    pte_t pte = ACCESS_ONCE(*ptep);
>    ^
> mm/gup.c: In function '__get_user_pages_fast':
> mm/gup.c:1194:3: error: conversion to non-scalar type requested
>    pgd_t pgd = ACCESS_ONCE(*pgdp);
>    ^
> 
> Caused by commit 4bcad5b3b3ea ("powerpc: Make STRICT_MM_TYPECHECKS a
> config option").
> 
> I have reverted that commit for today.

I've dropped it from my tree for now.

You can kill me on Monday.

cheers

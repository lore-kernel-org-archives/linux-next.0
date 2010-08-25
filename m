From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: Tree for August 25 (mm/slub)
Date: Wed, 25 Aug 2010 16:18:58 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1008251618400.31521@chino.kir.corp.google.com>
References: <20100825132057.c8416bef.sfr@canb.auug.org.au> <20100825094559.bc652afe.randy.dunlap@oracle.com> <alpine.DEB.2.00.1008251405590.22117@router.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:1384 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392Ab0HYXTE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Aug 2010 19:19:04 -0400
In-Reply-To: <alpine.DEB.2.00.1008251405590.22117@router.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@cs.helsinki.fi>

On Wed, 25 Aug 2010, Christoph Lameter wrote:

> Subject: slub: Add dummy functions for the !SLUB_DEBUG case
> 
> Provide the fall back functions to empty hooks if SLUB_DEBUG is not set.
> 
> Signed-off-by: Christoph Lameter <cl@linux.com>

Acked-by: David Rientjes <rientjes@google.com>

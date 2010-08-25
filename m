From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: Tree for August 25 (mm/slub)
Date: Wed, 25 Aug 2010 14:11:25 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1008251409260.22117@router.home>
References: <20100825132057.c8416bef.sfr@canb.auug.org.au> <20100825094559.bc652afe.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp101.prem.mail.ac4.yahoo.com ([76.13.13.40]:33688 "HELO
	smtp101.prem.mail.ac4.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751771Ab0HYTL2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Aug 2010 15:11:28 -0400
In-Reply-To: <20100825094559.bc652afe.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@cs.helsinki.fi>

On Wed, 25 Aug 2010, Randy Dunlap wrote:

> and in different builds:
>
> mm/slub.c:1898: note: expected 'struct kmem_cache *' but argument is of type 'struct kmem_cache **'
> mm/slub.c:1756: note: expected 'struct kmem_cache *' but argument is of type 'struct kmem_cache **'

Hmmm... Any details on the configuration that got you this result?

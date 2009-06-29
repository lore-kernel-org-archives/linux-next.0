From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Mon, 29 Jun 2009 15:09:58 +0200
Message-ID: <20090629130958.GE9321@osiris.boeblingen.de.ibm.com>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com> <20090629103123.GC9321@osiris.boeblingen.de.ibm.com> <20090629103943.GA31299@wotan.suse.de> <20090629115038.GD9321@osiris.boeblingen.de.ibm.com> <20090629115835.GA2308@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate7.de.ibm.com ([195.212.29.156]:33468 "EHLO
	mtagate7.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751680AbZF2NKG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2009 09:10:06 -0400
Content-Disposition: inline
In-Reply-To: <20090629115835.GA2308@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Sachin Sant <sachinp@in.ibm.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

> > > > > Unable to handle kernel pointer dereference at virtual kernel address (null)
> > > 
> > > This could I suppose be due to failed allocation where the caller
> > > isn't expecting failure (or using SLAB_PANIC).
> > > 
> > > Did you manage to test with the prink debugging patch for SLQB that
> > > I sent for the power6 boot failure? I don't think I saw a reply from
> > > you but maybe I missed it?
> > 
> > Could you send me the debug patch as well? I can give it a quick run as well.
> 
> This is what I had. It is only helpful for the power6
> failure where there was a problem in an allocation from
> kmem_cache_create.

It doesn't print anything out to the console. kmalloc_node returns 0x10 for
the large allocation in init_section_page_cgroup().
The page allocator won't be able to satisfy this request since the requested
order is larger than MAX_ORDER on our platform.
Now we only need to figure out why the SLQB allocator returns 0x10 instead
of NULL ;)

From: David Rientjes <rientjes@google.com>
Subject: Re: randconfig build error with next-20140512, in mm/slub.c
Date: Mon, 12 May 2014 13:36:53 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1405121336180.961@chino.kir.corp.google.com>
References: <CA+r1Zhg4JzViQt=J0XBu4dRwFUZGwi52QLefkzwcwn4NUfk8Sw@mail.gmail.com> <alpine.DEB.2.10.1405121346370.30318@gentwo.org> <537118C6.7050203@iki.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:37516 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751288AbaELUgz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 May 2014 16:36:55 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so9262056pab.8
        for <linux-next@vger.kernel.org>; Mon, 12 May 2014 13:36:55 -0700 (PDT)
In-Reply-To: <537118C6.7050203@iki.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@iki.fi>
Cc: Christoph Lameter <cl@linux.com>, Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, penberg@kernel.org, mpm@selenic.com, linux-mm@kvack.org

On Mon, 12 May 2014, Pekka Enberg wrote:

> On 05/12/2014 09:47 PM, Christoph Lameter wrote:
> > A patch was posted today for this issue.
> 
> AFAICT, it's coming from -mm. Andrew, can you pick up the fix?
> 
> > Date: Mon, 12 May 2014 09:36:30 -0300
> > From: Fabio Estevam <fabio.estevam@freescale.com>
> > To: akpm@linux-foundation.org
> > Cc: linux-mm@kvack.org, festevam@gmail.com, Fabio Estevam
> > <fabio.estevam@freescale.com>,    Christoph Lameter <cl@linux.com>, David
> > Rientjes <rientjes@google.com>, Pekka Enberg <penberg@kernel.org>
> > Subject: [PATCH] mm: slub: Place count_partial() outside CONFIG_SLUB_DEBUG
> > if block
> > 

That's the wrong fix since it doesn't work properly when sysfs is 
disabled.  We want http://marc.info/?l=linux-mm-commits&m=139992385527040 
which was merged into -mm already.

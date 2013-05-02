From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH -next] ashmem: Fix ashmem_shrink deadlock.
Date: Thu, 2 May 2013 11:22:18 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1305021121160.2493@chino.kir.corp.google.com>
References: <1367416573-5430-1-git-send-email-rlove@google.com> <alpine.DEB.2.02.1305010853450.4547@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1305010853450.4547@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Love <rlove@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shankar Brahadeeswaran <shankoo77@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, LKML <linux-kernel@vger.kernel.org>, Bjorn Bringert <bringert@google.com>, devel <devel@driverdev.osuosl.org>, Hugh Dickins <hughd@google.com>, Anjana V Kumar <anjanavk12@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 1 May 2013, David Rientjes wrote:

> > Don't acquire ashmem_mutex in ashmem_shrink if we've somehow recursed into the
> > shrinker code from within ashmem. Just bail out, avoiding a deadlock. This is
> > fine, as ashmem cache pruning is advisory anyhow.
> > 
> > Signed-off-by: Robert Love <rlove@google.com>
> 
> Any reason not to send this to stable@vger.kernel.org if it fixes an 
> observable deadlock?  (It's annotated to be applied to linux-next, but I 
> don't see any differences between it and Linus's tree.)
> 

This was sent separately to stable@vger.kernel.org before being merged 
into Linus's tree .  Greg, could this be queued up for 3.10 with a cc to 
stable@vger.kernel.org?

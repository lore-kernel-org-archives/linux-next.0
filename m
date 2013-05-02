From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH -next] ashmem: Fix ashmem_shrink deadlock.
Date: Thu, 2 May 2013 13:39:35 -0700
Message-ID: <20130502203935.GA25567@kroah.com>
References: <1367416573-5430-1-git-send-email-rlove@google.com>
 <alpine.DEB.2.02.1305010853450.4547@chino.kir.corp.google.com>
 <alpine.DEB.2.02.1305021121160.2493@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1305021121160.2493@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Rientjes <rientjes@google.com>
Cc: Robert Love <rlove@google.com>, devel <devel@driverdev.osuosl.org>, Shankar Brahadeeswaran <shankoo77@gmail.com>, Bjorn Bringert <bringert@google.com>, Hugh Dickins <hughd@google.com>, LKML <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Anjana V Kumar <anjanavk12@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-next.vger.kernel.org

On Thu, May 02, 2013 at 11:22:18AM -0700, David Rientjes wrote:
> On Wed, 1 May 2013, David Rientjes wrote:
> 
> > > Don't acquire ashmem_mutex in ashmem_shrink if we've somehow recursed into the
> > > shrinker code from within ashmem. Just bail out, avoiding a deadlock. This is
> > > fine, as ashmem cache pruning is advisory anyhow.
> > > 
> > > Signed-off-by: Robert Love <rlove@google.com>
> > 
> > Any reason not to send this to stable@vger.kernel.org if it fixes an 
> > observable deadlock?  (It's annotated to be applied to linux-next, but I 
> > don't see any differences between it and Linus's tree.)
> > 
> 
> This was sent separately to stable@vger.kernel.org before being merged 
> into Linus's tree .  Greg, could this be queued up for 3.10 with a cc to 
> stable@vger.kernel.org?

Yes, I'll handle all of this properly, thanks.

greg k-h

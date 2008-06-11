From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for June 11
Date: Wed, 11 Jun 2008 11:55:27 -0700
Message-ID: <20080611185527.GB5516@kroah.com>
References: <20080611193840.08a35b14.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1762557AbYFKTBG@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080611193840.08a35b14.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 11, 2008 at 07:38:40PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since next-20080610:
> 
> Dropped trees (temporary): ldp (it is unfetchable - probably something to
> do with the new Staging tree), block (it just has too many conflicts and
> breaks the powerpc build).

Yes, I've dropped "ldp" from my 'gregkh' set of patches/trees, they
should be pulled in from the -staging tree, which would be great if you
could add to the end of the -next tree.

I've also removed some of the larger patches in the driver-core tree
that were causing you merge/build errors, they should be all resolved
now.

thanks,

greg k-h

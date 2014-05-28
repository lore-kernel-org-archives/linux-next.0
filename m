From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Wed, 28 May 2014 13:42:32 -0700
Message-ID: <20140528204232.GA8224@kroah.com>
References: <20140528194629.0757af1b@canb.auug.org.au>
 <1401271041.28714.22.camel@x220>
 <1401272095.28714.30.camel@x220>
 <1401308488.6186.10.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1401308488.6186.10.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, May 28, 2014 at 10:21:28PM +0200, Paul Bolle wrote:
> Greg,
> 
> On Wed, 2014-05-28 at 12:14 +0200, Paul Bolle wrote:
> > I must have compile tested this with CONFIG_LIB80211_CRYPT_TKIP=m while
> > the code checks for CONFIG_LIB80211_CRYPT_TKIP only (ie, builtin only).
> > I'll have to have a better look at this.
> > 
> > Greg, can the cleaning up of this mess involve an entirely new patch? An
> > incremental patch would leave this build error in a certain range of
> > commits.

As I already have the patch in my tree, I can't do that, we can live
with the build issue.

> The pieces of the latest linux-next build were handed to me by Stephen
> as my patch managed to break it.
> 
> I'm assuming you'd like to include rtl8192u in linux-next's builds
> again. Currently I got nothing to offer to you but a request to either
> drop "staging: rtl8192u: rename CONFIG_IEEE80211_CRYPT_TKIP" from
> staging-next or, if that's not how staging-next works, a request to
> revert it. What do you prefer?

Either is fine with me, I can revert it, or apply a fix, which ever you
want, just let me know.

thanks,

greg k-h

From: Theodore Tso <tytso@mit.edu>
Subject: Re: linux-next: next-20090609 hangs in early user mode
Date: Wed, 10 Jun 2009 09:19:09 -0400
Message-ID: <20090610131909.GB6647@mit.edu>
References: <20090610180058.99bd3dda.sfr@canb.auug.org.au> <20090610130054.GR8633@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090610130054.GR8633@ZenIV.linux.org.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Jun 10, 2009 at 02:00:54PM +0100, Al Viro wrote:
> 
> Yes, it's obviously bogus.  Dropped from the tree; I don't think it's
> really salvagable - even merging into one unsigned long will not be
> enough, since we will end up with different locking for different bits.

Oops, sorry, I didn't realize we were using bitops for i_state.  As
far as I can tell we're not using the bitops functions for i_flags,
though.  Is that right?  So we can convert i_flags to be a unsigned
short, but we can't do anything with i_state.

       	      	       		     - Ted

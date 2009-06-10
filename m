From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: next-20090609 hangs in early user mode
Date: Wed, 10 Jun 2009 04:31:39 -0400
Message-ID: <20090610083139.GA25538@infradead.org>
References: <20090610180058.99bd3dda.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090610180058.99bd3dda.sfr@canb.auug.org.au>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Jun 10, 2009 at 06:00:58PM +1000, Stephen Rothwell wrote:
> The machines are PowerPC64 (so big endian).  It looks to me like we use
> bitops on i_state - don't our bitops only apply to unsigned longs?

Yes, bitops need unsigned long.  And on most plaforms should give you
warnings when using them on the wrong type.


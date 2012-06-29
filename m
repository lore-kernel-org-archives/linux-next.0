From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the trivial
 tree
Date: Fri, 29 Jun 2012 11:55:59 -0400
Message-ID: <20120629155559.GA21039@kroah.com>
References: <20120629155724.99c0b8d8ad0738fdc7ebca33@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120629155724.99c0b8d8ad0738fdc7ebca33@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Jiri Kosina <jkosina@suse.cz>, H Hartley Sweeten <hartleys@visionengravers.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 29, 2012 at 03:57:24PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/comedi/drivers/s626.h between commit 6ac7d11527a3
> ("treewide: Put a space between #include and FILE") from the trivial tree
> and commit 90fd56af25b7 ("staging: comedi: s626: remove private INLINE
> macro") from the staging tree.
> 
> Just context changes.  I fixed it up and can carry the fix as necessary.

Sounds fine with me, thanks.

greg k-h

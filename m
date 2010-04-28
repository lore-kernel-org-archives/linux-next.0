From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging-next tree with the
 staging.current tree
Date: Wed, 28 Apr 2010 08:25:58 -0700
Message-ID: <20100428152558.GC4483@kroah.com>
References: <20100428160803.29fc7fe8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100428160803.29fc7fe8.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Baldus <jason.baldus@gmail.com>, H Hartley Sweeten <hartleys@visionengravers.com>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 28, 2010 at 04:08:03PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging-next tree got a conflict in
> drivers/staging/dt3155/dt3155_drv.c between commit
> 19ba984dd7d8dcf67cebc2ba55abbe454e318fb3 ("Staging: dt3155: fix 50Hz
> configuration") from the staging.current tree and commit
> da7bcc953ecf52d33b76b983ad5491d4d29f5f6a ("Staging: dt3155: fix
> parentheses and bracket spacing style issues") from the staging-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

The fix looks fine, thanks.

greg k-h

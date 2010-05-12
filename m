From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging-next tree with the
 pcmcia tree
Date: Wed, 12 May 2010 12:50:05 -0700
Message-ID: <20100512195005.GD31534@kroah.com>
References: <20100512160352.daa747f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100512160352.daa747f8.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>
List-Id: linux-next.vger.kernel.org

On Wed, May 12, 2010 at 04:03:52PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging-next tree got a conflict in
> drivers/staging/wlags49_h2/wl_cs.c between commit
> c8df2d45846e374de8ff601b9ea0537becfe75ca ("pcmcia: re-work
> pcmcia_request_irq()") from the pcmcia tree and commit  ("") from the
> staging-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Heh, I just hacked that driver up to build properly, odds are it doesn't
run :)

But your fix looks fine, thanks for it.

greg k-h

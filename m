From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging-next tree with the
 pcmcia tree
Date: Mon, 17 May 2010 11:01:30 -0700
Message-ID: <20100517180130.GC16419@kroah.com>
References: <20100517154919.535f12a1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100517154919.535f12a1.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Henk de Groot <henk.de.groot@hetnet.nl>, Dominik Brodowski <linux@dominikbrodowski.net>
List-Id: linux-next.vger.kernel.org

On Mon, May 17, 2010 at 03:49:19PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging-next tree got a conflict in
> drivers/staging/wlags49_h2/wl_cs.c between commit
> eb14120f743d29744d9475bffec56ff4ad43a749 ("pcmcia: re-work
> pcmcia_request_irq()") from the pcmcia tree and commit
> 93822ad193f1b1d92422dc3d539456acbe1a85ef ("Staging: wlags49_hs2: Fix
> wlags49_hs2 driver after build fixes broke it") from the staging-next
> tree.
> 
> I fixed it up (see below - basically the staging-next version) and can
> carry the fix as necessary.

Looks good to me, thanks.

greg k-h

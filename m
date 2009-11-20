From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the pcmcia
 tree
Date: Fri, 20 Nov 2009 10:29:03 -0800
Message-ID: <20091120182903.GB4804@kroah.com>
References: <20091109181544.454695c0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754983AbZKTScN@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091109181544.454695c0.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Vadim Mutilin <mutilin@ispras.ru>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 09, 2009 at 06:15:44PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/comedi/drivers/cb_das16_cs.c between commit
> 4e338b7f55b4c30e60fa3fa9ff3d21e930f40116 ("pcmcia/staging: update comedi
> drivers") from the pcmcia tree and commit
> e18c724339a542aac71d1d47b0695bf7b4a5c3a3 ("STAGING: comedi: cb_das16_cs:
> fixing coding style errors") from the staging tree.
> 
> I fixed it up (using the pcmcia tree version when there is a clash) and
> can carry the fix as necessary.
> 
> [Greg, that staging tree commit has no SOB from its author ...]

Good catch, I missed that :(

I've now dropped this patch from my tree, so it should be fine now.

thanks,

greg k-h

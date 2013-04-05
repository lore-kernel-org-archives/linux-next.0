From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs tree
Date: Thu, 4 Apr 2013 18:45:18 -0700
Message-ID: <20130405014518.GC26617@kroah.com>
References: <20130404153433.be980c842e6b7a41afa0168f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130404153433.be980c842e6b7a41afa0168f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Zimmer <nzimmer@sgi.com>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Thu, Apr 04, 2013 at 03:34:33PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in
> drivers/staging/dgrp/dgrp_dpa_ops.c, drivers/staging/dgrp/dgrp_mon_ops.c,
> drivers/staging/dgrp/dgrp_net_ops.c and
> drivers/staging/dgrp/dgrp_ports_ops.c between commit 33633903f16f ("dgrp
> procfs fixes, part 5: per-node files") from the vfs tree and commit
> 433121c6ef51 ("staging: dgrp: cleanup sparse warnings") from the staging
> tree.
> 
> The former removed the code modified by the latter, so I just did that
> and can carry the fix as necessary (no action is required).

That is correct, thanks.

greg k-h

From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the  tree
Date: Sat, 12 Jul 2014 09:53:49 -0700
Message-ID: <20140712165349.GC12148@kroah.com>
References: <20140711152130.45a6978f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140711152130.45a6978f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Hurley <peter@hurleysoftware.com>, Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 11, 2014 at 03:21:30PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/dgrp/dgrp_tty.c between commit e359a4e38d22 ("tty:
> Remove tty_hung_up_p() tests from tty drivers' open()") from the tty
> tree and commit 19b1e7695be8 ("staging: dgrp: remove driver") from the
> staging tree.
> 
> I fixed it up (by just removing the file) and can carry the fix as
> necessary (no action is required).

That sounds fine, thanks.

greg k-h

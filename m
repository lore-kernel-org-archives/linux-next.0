From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the tty tree
Date: Mon, 17 Sep 2012 04:20:21 -0700
Message-ID: <20120917112021.GB28478@kroah.com>
References: <20120917173706.44575edebd95adaebe557b67@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120917173706.44575edebd95adaebe557b67@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>, Samuel Iglesias Gonsalvez <siglesias@igalia.com>
List-Id: linux-next.vger.kernel.org

On Mon, Sep 17, 2012 at 05:37:06PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/ipack/devices/ipoctal.c between commit 734cc1783816
> ("TTY: use tty_port_register_device") from the tty tree and commit
> d04600679ba0 ("Staging: ipack/devices/ipoctal: simplify ipoctal_write_tty
> ()") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks for this.

greg k-h

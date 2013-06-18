From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the usb tree
Date: Tue, 18 Jun 2013 09:03:33 -0700
Message-ID: <20130618160333.GC28961@kroah.com>
References: <20130618145559.cc7923dac280e736c908a422@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130618145559.cc7923dac280e736c908a422@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bernd Bassimir <bassimir.kernel@gmx.de>, Nico Doerr <nico.doerr@hawo.net>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 18, 2013 at 02:55:59PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/serqt_usb2/serqt_usb2.c between commit 1143832eca8f
> ("USB: serial: ports: add minor and port number") from the usb tree and
> commit d68edc2881b1 ("staging: serqt_usb2: Fixed coding style
> CamelCases") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Fix looks fine, thanks.

greg k-h

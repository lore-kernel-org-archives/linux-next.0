From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the v4l-dvb tree
Date: Wed, 12 May 2010 12:49:34 -0700
Message-ID: <20100512194934.GC31534@kroah.com>
References: <20100512155750.c6633e4c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100512155750.c6633e4c.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Jean-Fran=E7ois?= Moine <moinejf@free.fr>, Mauro Carvalho Chehab <mchehab@redhat.com>, Daniel Mack <daniel@caiaq.de>
List-Id: linux-next.vger.kernel.org

On Wed, May 12, 2010 at 03:57:50PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/media/video/gspca/gspca.c between commit
> 659a02869f4a8be95df9efa76af02e53e400555f ("V4L/DVB: gspca - main: Convert
> wMaxPacketSize from little endian 16 to cpu") from the v4l-dvb tree and
> commit 42b4658241d4c16c838daf9d63c0029cd7269fe0 ("USB: rename
> usb_buffer_alloc() and usb_buffer_free() users") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

The fix looks great to me, thanks.

greg k-h

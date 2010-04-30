From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the input tree
Date: Fri, 30 Apr 2010 07:44:33 -0700
Message-ID: <20100430144433.GG1824@kroah.com>
References: <20100430155108.6847891f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100430155108.6847891f.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Axel Lin <axel.lin@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 30, 2010 at 03:51:08PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/input/tablet/acecad.c between commits
> 2ef2ed597669f5e120d0c51c295f00e34b2f0801 ("Input: acecad - fix incorrect
> size parameter in usb_buffer_free") and
> 5492f6f801c81c9663417cd8e48e759775977c83 ("Input: acecad - simplify
> usb_acecad_disconnect()") from the input tree and commit
> 3cc96f50329227fbf34de2459491901b6ee1c98c ("USB: rename usb_buffer_alloc()
> and usb_buffer_free() users") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks for the fixup.

greg k-h

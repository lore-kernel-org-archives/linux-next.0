From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Date: Thu, 25 Aug 2011 08:39:47 -0700
Message-ID: <20110825153947.GB31018@kroah.com>
References: <20110825145206.4888b9f62a9bcbeeaf8678b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110825145206.4888b9f62a9bcbeeaf8678b8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Sarah Sharp <sarah.a.sharp@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 25, 2011 at 02:52:06PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/host/xhci-ring.c between commit 48df4a6fd8c4 ("xhci: Handle
> zero-length isochronous packets") from the usb.current tree and commit
> 29cc88979a88 ("USB: use usb_endpoint_maxp() instead of le16_to_cpu()")
> from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks, when I get the usb.current tree merged with Linus, I'll handle
this merge in the usb.next tree.

greg k-h

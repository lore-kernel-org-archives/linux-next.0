From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb.current tree with Linus' tree
Date: Sun, 19 May 2013 21:15:36 -0700
Message-ID: <20130520041536.GA15865@kroah.com>
References: <20130520102159.18f2f976cb4000e48b45731e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130520102159.18f2f976cb4000e48b45731e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Libo Chen <clbchenlibo.chen@huawei.com>
List-Id: linux-next.vger.kernel.org

On Mon, May 20, 2013 at 10:21:59AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb.current tree got a conflict in
> drivers/usb/host/ohci-nxp.c between commit bb522812a1a6
> ("drivers/usb/host: don't check resource with devm_ioremap_resource")
> from Linus' tree and commit b3517d5de80e ("usb: ohci: fix goto wrong tag
> in err case") from the usb.current tree.
> 
> The former remove a bit of code modified by the latter, so I did that and
> can carry the fix as necessary (no action is required).

Sounds fine to me, thanks.

greg k-h

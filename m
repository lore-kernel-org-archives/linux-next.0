From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the moduleh tree with the usb tree
Date: Tue, 6 Mar 2012 09:56:51 -0500
Message-ID: <4F5625B3.9020400@windriver.com>
References: <20120306165053.c42cdb7ff8e6772a0a8ebbd5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120306165053.c42cdb7ff8e6772a0a8ebbd5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Greg KH <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

On 12-03-06 12:50 AM, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the moduleh tree got a conflict in
> drivers/usb/dwc3/dwc3-omap.c between commit 45b3cd4ad79b ("usb: dwc3:
> omap: convert pdata to of property") from the usb tree and commit
> 13ae246db4a0 ("includecheck: delete any duplicate instances of module.h")
> from the moduleh tree.
> 
> Just context changes.  I fixed it up and can carry the fix as necessary.

Thanks Stephen,

I had a look and the instance being deleted is really the right
one to delete, so this conflict will have to stay carried it seems.

Paul.

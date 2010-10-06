From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the trivial tree
Date: Wed, 6 Oct 2010 07:05:56 -0700
Message-ID: <20101006140556.GA19537@kroah.com>
References: <20101006141414.abf7431f.sfr@canb.auug.org.au>
 <20101006061927.GA2659@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101006061927.GA2659@legolas.emea.dhcp.ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Jiri Kosina <jkosina@suse.cz>, Sergei Shtylyov <sshtylyov@ru.mvista.com>
List-Id: linux-next.vger.kernel.org

On Wed, Oct 06, 2010 at 09:19:27AM +0300, Felipe Balbi wrote:
> On Tue, Oct 05, 2010 at 10:14:14PM -0500, Stephen Rothwell wrote:
> >Hi Greg,
> >
> >Today's linux-next merge of the usb tree got a conflict in
> >drivers/usb/musb/musb_gadget.c between commit
> >7f26b3a7533bbc1ddd88b297c935ee4da8f74cea ("drivers/usb: Remove
> >unnecessary return's from void functions") from the trivial tree and
> 
> funny that I wasn't CCed to that one :-(

It was 'trivial' patches, which don't always get sent to the individual
developer unfortunately.

sorry,

greg k-h

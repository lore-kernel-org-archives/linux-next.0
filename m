From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: PCI failure with virtual machine (new as of the past few days
 -next)
Date: Mon, 7 Dec 2009 18:07:10 +0000
Message-ID: <20091207180710.526f975c@lxorguk.ukuu.org.uk>
References: <20091203171421.59f85d8b@lxorguk.ukuu.org.uk>
	<20091204163519.39212bf6@jbarnes-piketon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20091204163519.39212bf6@jbarnes-piketon>
Sender: linux-pci-owner@vger.kernel.org
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-pci@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 4 Dec 2009 16:35:19 -0800
Jesse Barnes <jbarnes@virtuousgeek.org> wrote:

> On Thu, 3 Dec 2009 17:14:21 +0000
> Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> 
> > 
> > 8139cp: 10/100 PCI Ethernet driver v1.3 (Mar 22, 2004)
> > 8139cp 0000:00:03.0: PCI INT A -> Link[LNKC] -> GSI 11 (level, high)
> > -> IRQ 11 8139cp 0000:00:03.0: PCI INT A disabled
> > 8139cp: probe of 0000:00:03.0 failed with error -22
> > 
> > The PCI configuration looks like this (with an older working kernel)
> 
> I haven't applied anything to the PCI tree in the past few days (last
> batch of commits was before my Thanksgiving break).  Maybe something
> else in -next broke?  Have you tried my pci linux-next tree by itself?
> It should be bisectable...

Still poking at this - PCI linux-next tree alone isn't responsible
however. It seems to be a combination of -next, Fedora Core 12 and
certain configuration choices for the virtual hardware.

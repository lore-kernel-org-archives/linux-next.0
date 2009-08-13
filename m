From: "Vignatti Tiago (Nokia-D/Helsinki)" <tiago.vignatti@nokia.com>
Subject: Re: linux-next: pci tree build warning
Date: Thu, 13 Aug 2009 11:38:24 +0300
Message-ID: <20090813083824.GB24485@cachaca>
References: <20090813124732.f29fd5c3.sfr@canb.auug.org.au> <1250134360.3587.77.camel@pasglop>
Reply-To: tiago.vignatti@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753515AbZHMIjZ@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1250134360.3587.77.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jesse Barnes <jbarnes@virtuousgeek.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@redhat.com>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 13, 2009 at 05:32:40AM +0200, Benjamin Herrenschmidt wrote:
> On Thu, 2009-08-13 at 12:47 +1000, Stephen Rothwell wrote:
> > Hi Jesse,
> > 
> > Today's linux-next build (x86_64 allmodconfig) produced these warnings:
> > 
> > drivers/gpu/vga/vgaarb.c: In function 'vga_arb_write':
> > drivers/gpu/vga/vgaarb.c:834: warning: cast from pointer to integer of different size
> > drivers/gpu/vga/vgaarb.c:870: warning: cast from pointer to integer of different size
> > drivers/gpu/vga/vgaarb.c:920: warning: cast from pointer to integer of different size
> > drivers/gpu/vga/vgaarb.c:963: warning: cast from pointer to integer of different size
> > drivers/gpu/vga/vgaarb.c:1017: warning: cast from pointer to integer of different size
> > 
> > Introduced by commit a49c9c1b728fa8f50816d96a0f135e15a359e448 ("PCI/GPU:
> > implement VGA arbitration on Linux").
> 
> Right, somebody weirdly decided to cast pointers to int just to printk
> them with %X :-) I hope it wasn't me ... 

Ahhh oops.. looks like someone really newbie trying to play developing kernel
code :p
 
            Tiago

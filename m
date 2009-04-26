From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: upstream tree build warnings
Date: Sun, 26 Apr 2009 21:53:10 +0930
Message-ID: <200904262153.10948.rusty@rustcorp.com.au>
References: <20090423163847.200f227e.sfr@canb.auug.org.au> <20090423.002403.74400050.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756112AbZDZMX2@vger.kernel.org>
In-Reply-To: <20090423.002403.74400050.davem@davemloft.net>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, alex.williamson@hp.com, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 23 Apr 2009 04:54:03 pm David Miller wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 23 Apr 2009 16:38:47 +1000
> 
> > Today's linux-next build (powerpc allyesconfig gcc4.4.0) produced these
> > warnings:
> > 
> > drivers/net/virtio_net.c: In function 'virnet_vlan_rx_add_vid':
> > include/linux/scatterlist.h:57: warning: 'sg' is used uninitialized in this function
> > drivers/net/virtio_net.c:746: note: 'sg' was declared here
> > drivers/net/virtio_net.c: In function 'virnet_vlan_rx_kill_vid':
> > include/linux/scatterlist.h:57: warning: 'sg' is used uninitialized in this function
> > drivers/net/virtio_net.c:758: note: 'sg' was declared here
> > 
> > in each case, sg is uninitialised when its address is passed to
> > sg_set_buf() which passes it to gs_set_page() which passes it to
> > sg_assign_page() which dereferences it (to use ->page_link).
> 
> I wonder if this is a side effect of changes that went in via Rusty's
> tree?  I don't remember touching this driver in a while.

AFAICT gcc is right: it should be sg_init_one().

It doesn't currently *matter*, since no virtio add_buf implementation
does that chained-sg crap (I had a patch once, but it made me barf) and
so the uninitialized lower three bits are ignored.

Alex, if you agree, patch welcome...
Rusty.

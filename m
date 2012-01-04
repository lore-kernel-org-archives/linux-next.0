From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the arm
 tree
Date: Wed, 4 Jan 2012 15:09:13 -0800
Message-ID: <20120104230913.GJ24583@kroah.com>
References: <20111228161231.ff6448eb7f03120bd25b19dd@canb.auug.org.au>
 <20111228162431.206d16c1671679526958bf7e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111228162431.206d16c1671679526958bf7e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <rmk@arm.linux.org.uk>, Kay Sievers <kay.sievers@vrfy.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 28, 2011 at 04:24:31PM +1100, Stephen Rothwell wrote:
> Hi again,
> 
> On Wed, 28 Dec 2011 16:12:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the driver-core tree got a conflict in
> > arch/arm/mach-s3c64xx/common.c between commit b024043b6d0d ("ARM: 7245/1:
> > S3C64XX: introduce arch/arm/mach-s3c64xx/common.[ch]") from the arm tree
> > and commit edbaa603eb80 ("driver-core: remove sysdev.h usage") from the
> > driver-core tree (where it is called arch/arm/mach-s3c64xx/irq-eint.c).
> > 
> > Just context changes.  I fixed it up (see below) and can carry the fix as
> > necessary.
> 
> Actually, I the fix was more extensive (see below).

Ick, messy, thanks, that looks good.

greg k-h

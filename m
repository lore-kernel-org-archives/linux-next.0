From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: build failure after merge of the swiotlb-xen tree
Date: Mon, 13 Dec 2010 09:44:55 -0500
Message-ID: <20101213144454.GA12054@dumpdata.com>
References: <20101213143322.90c45f81.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101213143322.90c45f81.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 13, 2010 at 02:33:22PM +1100, Stephen Rothwell wrote:
> Hi Konrad,
> 
> After merging the swiotlb-xen tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Ahh, yes. I knew there was some patch that we forgot. Will fix it up today!
> 
> ERROR: "xenbus_dev_is_online" [drivers/xen/pciback/xen-pciback.ko] undefined!
> ERROR: "__xenbus_register_backend" [drivers/xen/pciback/xen-pciback.ko] undefined!
> 
> Caused by commit 443b2aafbdb509f218fcb8f4665f063e3a5e1a92 ("xen-pciback:
> Initial copy from linux-2.6.18.hg off pciback driver").
> 
> I have used the swiotlb-xen tree from next-20101210 for today.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/

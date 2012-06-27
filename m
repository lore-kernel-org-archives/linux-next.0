From: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: linux-next: Tree for Jun 27 (vfio)
Date: Wed, 27 Jun 2012 13:20:37 -0600
Message-ID: <1340824837.1207.221.camel@bling.home>
References: <20120627132217.f8bbdd1f467711419123d188@canb.auug.org.au>
	 <4FEB3030.9070900@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FEB3030.9070900@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, KVM <kvm@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 2012-06-27 at 09:09 -0700, Randy Dunlap wrote:
> On 06/26/2012 08:22 PM, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > This tree was not built between each merge, but only after merging all
> > the trees.
> > 
> > Changes since 20120626:
> > 
> > New tree: vfio
> 
> 
> on x86_64:
> 
>   CC [M]  drivers/vfio/vfio.o
> drivers/vfio/vfio.c: In function 'vfio_device_release':
> drivers/vfio/vfio.c:412:2: error: 'TASK_NORMAL' undeclared (first use in this function)
> drivers/vfio/vfio.c:412:2: note: each undeclared identifier is reported only once for each function it appears in
> drivers/vfio/vfio.c: In function 'vfio_del_group_dev':
> 
> drivers/vfio/vfio.c:695:2: error: 'TASK_UNINTERRUPTIBLE' undeclared (first use in this function)
> drivers/vfio/vfio.c:695:2: error: implicit declaration of function 'schedule'
> *** [drivers/vfio/vfio.o] Error 1
> 
> 
> Full randconfig file is attached.

Thanks for the report, this should be fixed in tomorrow's tree.  Thanks,

Alex

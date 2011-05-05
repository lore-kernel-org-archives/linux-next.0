From: Hank Janssen <hjanssen@microsoft.com>
Subject: RE: linux-next: Tree for May 4 (hyperv / vmbus)
Date: Thu, 5 May 2011 14:59:56 +0000
Message-ID: <8AFC7968D54FB448A30D8F38F259C562498A5852@TK5EX14MBXC114.redmond.corp.microsoft.com>
References: <20110504144759.802483cc.sfr@canb.auug.org.au>
 <20110504094908.b8295d22.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110504094908.b8295d22.randy.dunlap@oracle.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, "gregkh@suse.de" <gregkh@suse.de>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org [mailto:linux-kernel-
> owner@vger.kernel.org] On Behalf Of Randy Dunlap
> Sent: Wednesday, May 04, 2011 9:49 AM
> To: Stephen Rothwell; driverdevel; gregkh@suse.de
> Cc: linux-next@vger.kernel.org; LKML; Hank Janssen; Haiyang Zhang
> Subject: Re: linux-next: Tree for May 4 (hyperv / vmbus)
> 
> On Wed, 4 May 2011 14:47:59 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> >
> > Changes since 20110503:
> 
> 
> when CONFIG_ACPI is not enabled:
> 
> 
> 
> vmbus_drv.c sure looks like it requires (depends on) both ACPI and PCI.
> That should be expressed somewhere in its Kconfig file.
> 

Randy,

Oops, I will submit a patch today to correct it. Thanks for catching it.

Hank.

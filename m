From: Haiyang Zhang <haiyangz@microsoft.com>
Subject: RE: linux-next: manual merge of the akpm tree with the char-misc
 tree
Date: Wed, 20 Mar 2013 14:29:26 +0000
Message-ID: <960b30d6dde3492b81120985e28ff061@DFM-DB3MBX15-08.exchange.corp.microsoft.com>
References: <20130320152007.56de4a48eaf2760ccc07f02b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130320152007.56de4a48eaf2760ccc07f02b@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, KY Srinivasan <kys@microsoft.com>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Wednesday, March 20, 2013 12:20 AM
> To: Andrew Morton
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Haiyang
> Zhang; KY Srinivasan; Greg KH; Arnd Bergmann
> Subject: linux-next: manual merge of the akpm tree with the char-misc
> tree
> 
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in
> include/linux/hyperv.h between commit 96dd86fa5881 ("Drivers: hv: Add a
> new driver to support host initiated backup") from the char-misc  tree
> and commit "drivers/video: add Hyper-V Synthetic Video Frame Buffer
> Driver" from the akpm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thank you for fixing it!

- Haiyang

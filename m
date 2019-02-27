From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: linux-next: manual merge of the vhost tree with the iommu tree
Date: Wed, 27 Feb 2019 08:58:36 -0500
Message-ID: <20190227085546-mutt-send-email-mst@kernel.org>
References: <20190227152506.4696a59f@canb.auug.org.au>
 <2370af99-9dc1-b694-9f1c-1951d1e70435@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2370af99-9dc1-b694-9f1c-1951d1e70435@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Joerg Roedel <joro@8bytes.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lan Tianyu <Tianyu.Lan@microsoft.com>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 27, 2019 at 11:30:27AM +0000, Jean-Philippe Brucker wrote:
> On 27/02/2019 04:25, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the vhost tree got conflicts in:
> > 
> >   drivers/iommu/Kconfig
> >   drivers/iommu/Makefile
> > 
> > between commit:
> > 
> >   004240dcc222 ("iommu/hyper-v: Add Hyper-V stub IOMMU driver")
> > 
> > from the iommu tree and commit:
> > 
> >   d906f4225497 ("iommu: Add virtio-iommu driver")
> > 
> > from the vhost tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> Thanks Stephen, sorry about the extra work. The virtio-iommu driver was
> helpfully added to the vhost tree to ensure it doesn't break anything,
> but since Joerg has some reservations, only the hyper-v change will be
> merged in v5.1. I'd welcome a change of heart however, in which case the
> driver should probably go via the iommu tree to avoid conflicts.
> 
> Thanks,
> Jean

Even though it's not going into 5.1 I feel it's helpful to keep it in
the vhost tree until the next cycle, it helps make sure unrelated
changes don't break it.

-- 
MST

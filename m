From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: linux-next: manual merge of the vhost tree with the iommu tree
Date: Wed, 27 Feb 2019 11:30:27 +0000
Message-ID: <2370af99-9dc1-b694-9f1c-1951d1e70435@arm.com>
References: <20190227152506.4696a59f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190227152506.4696a59f@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Michael S. Tsirkin" <mst@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lan Tianyu <Tianyu.Lan@microsoft.com>
List-Id: linux-next.vger.kernel.org

On 27/02/2019 04:25, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vhost tree got conflicts in:
> 
>   drivers/iommu/Kconfig
>   drivers/iommu/Makefile
> 
> between commit:
> 
>   004240dcc222 ("iommu/hyper-v: Add Hyper-V stub IOMMU driver")
> 
> from the iommu tree and commit:
> 
>   d906f4225497 ("iommu: Add virtio-iommu driver")
> 
> from the vhost tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
Thanks Stephen, sorry about the extra work. The virtio-iommu driver was
helpfully added to the vhost tree to ensure it doesn't break anything,
but since Joerg has some reservations, only the hyper-v change will be
merged in v5.1. I'd welcome a change of heart however, in which case the
driver should probably go via the iommu tree to avoid conflicts.

Thanks,
Jean

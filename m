From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: manual merge of the vhost tree with the iommu tree
Date: Thu, 28 Feb 2019 11:04:42 +0100
Message-ID: <20190228100442.GB1594@8bytes.org>
References: <20190227152506.4696a59f@canb.auug.org.au>
 <2370af99-9dc1-b694-9f1c-1951d1e70435@arm.com>
 <20190227085546-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190227085546-mutt-send-email-mst@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lan Tianyu <Tianyu.Lan@microsoft.com>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 27, 2019 at 08:58:36AM -0500, Michael S. Tsirkin wrote:
> Even though it's not going into 5.1 I feel it's helpful to keep it in
> the vhost tree until the next cycle, it helps make sure unrelated
> changes don't break it.

It is not going to 5.1, so it shouldn't be in linux-next, no? And when
it is going upstream, it should do so through the iommu tree. If you
keep it separatly in the vhost tree for testing purposes, please make
sure it is not included into your linux-next branch.

Regards,

	Joerg

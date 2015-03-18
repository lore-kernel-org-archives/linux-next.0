From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: build failure after merge of the virtio tree
Date: Wed, 18 Mar 2015 18:04:11 +1030
Message-ID: <87zj7alpxo.fsf@rustcorp.com.au>
References: <20150318124734.629c0954@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52321 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755106AbbCRHgV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Mar 2015 03:36:21 -0400
In-Reply-To: <20150318124734.629c0954@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Rusty,
>
> After merging the virtio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/virtio/virtio_mmio.c:250:12: error: redefinition of 'vm_generation'
>  static u32 vm_generation(struct virtio_device *vdev)
>             ^
> drivers/virtio/virtio_mmio.c:240:12: note: previous definition of 'vm_generation' was here
>  static u32 vm_generation(struct virtio_device *vdev)
>             ^
>
> Caused by the bad merge of commits 87e7bf1450c9 ("virtio_mmio:
> generation support") from Linus' tree and cf02b2c2d1a1 ("virtio_mmio:
> generation support") from the virtio tree.
>
> I fixed it up by removing the second version of that function.
>
> Could the virtio tree should be cleaned up to match what was sent to
> Linus, please?

Sorry, I clearly missed the failed push to virtio-next after I rebased a
fix.

Fixed now; I've modified my for-linus script to push to korg first
(which should be a noop).

Thanks,
Rusty.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vhost tree with the kbuild tree
Date: Tue, 28 Mar 2017 15:00:58 +1100
Message-ID: <20170328150058.394e4c5a@canb.auug.org.au>
References: <20170328145723.6345493c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59431 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750920AbdC1EBR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Mar 2017 00:01:17 -0400
In-Reply-To: <20170328145723.6345493c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Dichtel <nicolas.dichtel@6wind.com>

Hi Michael,

On Tue, 28 Mar 2017 14:57:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the vhost tree got a conflict in:
> 
>   include/uapi/linux/Kbuild
> 
> between commit:
> 
>   65017bab8a9e ("uapi: export all headers under uapi directories")
> 
> from the kbuild tree and commit:
> 
>   80363894995b ("virtio_mmio: expose header to userspace")
> 
> from the vhost tree.

In fact, the vhost tree should be cleaned up as that patch has been
committed to Linus's tree as a different commit.

-- 
Cheers,
Stephen Rothwell

From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: failed import of the rr quilt series
Date: Thu, 10 Nov 2011 21:58:14 +1030
Message-ID: <87fwhwqks1.fsf@rustcorp.com.au>
References: <20111109101909.585d2406dc46af8890f28e66@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:38020 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753028Ab1KJLcI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Nov 2011 06:32:08 -0500
In-Reply-To: <20111109101909.585d2406dc46af8890f28e66@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 9 Nov 2011 10:19:09 +1100, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
Non-text part: multipart/signed
> Hi Rusty,
> 
> Tryiong to import the rr quilt series today produced this error:
> 
> Importing rr based on v3.1-8907-g43672a0
> $ git reset --hard 43672a0784707d795556b1f93925da8b8e797d03
> Checking out files: 100% (37600/37600), done.
> HEAD is now at 43672a0 Merge git://git.kernel.org/pub/scm/linux/kernel/git/steve/linux-dm
> $ git am ../quilt/rr/virtio:pci_fix_use_after_free.patch
> Applying: virtio-pci: fix use after free
> error: patch failed: drivers/virtio/virtio_pci.c:822
> error: drivers/virtio/virtio_pci.c: patch does not apply

Fuzz, I didn't notice (since it's a warning, not an error here).
Verified it, and refreshed.

Thanks,
Rusty.

From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with Linus' tree
Date: Mon, 9 Nov 2015 18:42:31 -0800
Message-ID: <CAPcyv4h7byf2O0YHDhKKtynGQ3cGb3sDoZZPerZe13VSLd35jg@mail.gmail.com>
References: <20151110122438.30cae894@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:34322 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751519AbbKJCmc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2015 21:42:32 -0500
Received: by wmnn186 with SMTP id n186so136221296wmn.1
        for <linux-next@vger.kernel.org>; Mon, 09 Nov 2015 18:42:31 -0800 (PST)
In-Reply-To: <20151110122438.30cae894@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@fb.com>

On Mon, Nov 9, 2015 at 5:24 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> Today's linux-next merge of the nvdimm tree got a conflict in:
>
>   block/ioctl.c
>
> between commits:
>
>   d8e4bb8103df ("block: cleanup blkdev_ioctl")
>   bbd3e064362e ("block: add an API for Persistent Reservations")
>
> from Linus' tree and commit:
>
>   49bfa9c5511e ("block: enable dax for raw block devices")
>   abcc9ebd68ab ("block, dax: opt-in control for raw block dax support")
>
> from the nvdimm tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
> Is that new stuff in the nvdimm tree really meant for v4.4?  If not,
> please remove it until -rc1 has been released.

Done.  I was indeed squeezing things into this window that I
shouldn't.  I have postponed these conflicting patches to post 4.4.

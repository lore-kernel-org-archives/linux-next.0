From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with the xfs tree
Date: Fri, 1 Jun 2018 10:16:08 -0700
Message-ID: <CAPcyv4gHQBwvC9bGjFNvVWsZe2XW=52eT7QCcP1dduxaY7Gfbw@mail.gmail.com>
References: <20180601185846.1c5b7d0a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180601185846.1c5b7d0a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>, David Chinner <david@fromorbit.com>, linux-xfs <linux-xfs@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 1, 2018 at 1:58 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> Today's linux-next merge of the nvdimm tree got a conflict in:
>
>   drivers/dax/super.c
>
> between commits:
>
>   ba23cba9b3bd ("fs: allow per-device dax status checking for filesystems")
>   80660f20252d ("dax: change bdev_dax_supported() to support boolean returns")
>
> from the xfs tree and commit:
>
>   e76384884344 ("mm: introduce MEMORY_DEVICE_FS_DAX and CONFIG_DEV_PAGEMAP_OPS")
>
> from the nvdimm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Resolution looks good to me Stephen. Thanks for fixing this up, I'll
let Linus know in the libnvdimm pull request.

From: Gao Xiang <hsiangkao@aol.com>
Subject: Re: linux-next: manual merge of the staging tree with the block tree
Date: Wed, 1 May 2019 16:09:07 +0800
Message-ID: <a118d56b-fd0f-1d2d-dd82-b6f16881e0cd@aol.com>
References: <20190501170528.2d86d133@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501170528.2d86d133@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Gao Xiang <gaoxiang25@huawei.com>
List-Id: linux-next.vger.kernel.org

Hi,

On 2019/5/1 ??????3:05, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the staging tree got conflicts in:
>
>    drivers/staging/erofs/data.c
>    drivers/staging/erofs/unzip_vle.c
>
> between commit:
>
>    2b070cfe582b ("block: remove the i argument to bio_for_each_segment_all")
>
> from the block tree and commit:
>
>    14a56ec65bab ("staging: erofs: support IO read error injection")
>
> from the staging tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
the patch looks good to me,


Thanks,
Gao Xiang

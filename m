From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 2 Dec 2015 14:07:34 -0700
Message-ID: <565F5D96.5050902@kernel.dk>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org>
 <20151202164527.GA31048@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151202164527.GA31048@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Mark Brown <broonie@kernel.org>
Cc: Keith Busch <keith.busch@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 12/02/2015 09:45 AM, Christoph Hellwig wrote:
> Looks like I didn't test with CONFIG_NVM enabled, and neither did
> the build bot.
>
> Most of this is really weird crazy shit in the lighnvm support, thoug=
h.
>
> Struct nvme_ns is a structure for the NVM I/O command set, and it has
> no business poking into it.  Second this commit:
>
> commit 47b3115ae7b799be8b77b0f024215ad4f68d6460
> Author: Wenwei Tao <ww.tao0320@gmail.com>
> Date:   Fri Nov 20 13:47:55 2015 +0100
>
>      nvme: lightnvm: use admin queues for admin cmds
>
> Does even more crazy stuff.  If a function gets a request_queue param=
eter
> passed it'd better use that and not look for another one.
>
> Quick patch below, but this code will need some more attention:

Christoph, for-4.5/nvme also fails if integrity isn't enabled:

   CC      drivers/nvme/host/core.o
drivers/nvme/host/core.c: In function =91__nvme_submit_user_cmd=92:
drivers/nvme/host/core.c:192:10: error: implicit declaration of functio=
n=20
=91bio_integrity_alloc=92 [-Werror=3Dimplicit-function-declaration]
     bip =3D bio_integrity_alloc(bio, GFP_KERNEL, 1);
           ^
drivers/nvme/host/core.c:192:8: warning: assignment makes pointer from=20
integer without a cast [-Wint-conversion]
     bip =3D bio_integrity_alloc(bio, GFP_KERNEL, 1);
         ^
drivers/nvme/host/core.c:198:7: error: dereferencing pointer to=20
incomplete type =91struct bio_integrity_payload=92
     bip->bip_iter.bi_size =3D meta_len;
        ^
drivers/nvme/host/core.c:201:10: error: implicit declaration of functio=
n=20
=91bio_integrity_add_page=92 [-Werror=3Dimplicit-function-declaration]
     ret =3D bio_integrity_add_page(bio, virt_to_page(meta),
           ^


--=20
Jens Axboe

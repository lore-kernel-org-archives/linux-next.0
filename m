From: Jens Axboe <axboe@fb.com>
Subject: Re: linux-next: manual merge of the lightnvm tree with Linus' tree
Date: Mon, 21 Nov 2016 21:56:00 -0700
Message-ID: <6e9ffb9c-8f99-a401-bed6-55963dc53373@fb.com>
References: <20161122145917.4f1d0e86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:41918 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755026AbcKVE4U (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Nov 2016 23:56:20 -0500
In-Reply-To: <20161122145917.4f1d0e86@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/21/2016 08:59 PM, Stephen Rothwell wrote:
> Hi Matias,
>
> Today's linux-next merge of the lightnvm tree got a conflict in:
>
>   drivers/nvme/host/lightnvm.c
>
> between commit:
>
>   409ae5a76e05 ("lightnvm: invalid offset calculation for lba_shift")
>
> from Linus' tree and commit:
>
>   2db3cb58a3dd ("nvme: lightnvm: attach lightnvm sysfs to nvme block device")
>
> from the lightnvm tree.
>
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise
> any particularly complex conflicts.

Matias, you should base your branches on mine to avoid situations like
this. And additionally, submit them for inclusion if they are targeted
at 4.10 (and I'm thinking they are, if they are in linux-next).

-- 
Jens Axboe

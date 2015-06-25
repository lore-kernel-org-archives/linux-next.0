From: Peng Tao <tao.peng@primarydata.com>
Subject: Re: nfs commit breaks build for nfs4.1=y nfs4.2=n
Date: Thu, 25 Jun 2015 23:42:43 +0800
Message-ID: <CAKVebiWL0WwPZtVjNsWJtkO-_Dh86S+_j83tzM_1iDnPpbJHLw@mail.gmail.com>
References: <20150625145528.GA3069@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:33628 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751963AbbFYPnD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2015 11:43:03 -0400
Received: by igbqq3 with SMTP id qq3so17676175igb.0
        for <linux-next@vger.kernel.org>; Thu, 25 Jun 2015 08:43:03 -0700 (PDT)
In-Reply-To: <20150625145528.GA3069@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Jeff Layton <jeff.layton@primarydata.com>, Trond Myklebust <trond.myklebust@primarydata.com>, linux-next@vger.kernel.org

Thanks Paul! It was reported by kbuild test robot and a fix has been
sent to linux-nfs list.

Cheers,
Tao

On Thu, Jun 25, 2015 at 10:55 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
>
> New breakage seen in linux-next:
>
> fs/nfs/pnfs.c:2293: undefined reference to
> `nfs42_proc_layoutstats_generic'
>
> ...bisected to:
>
> commit 8733408d6ed713d080c325262d7b51a780136d41
> Author: Peng Tao <tao.peng@primarydata.com>
> Date:   Tue Jun 23 19:51:57 2015 +0800
>
>     pnfs: add pnfs_report_layoutstat helper function
>
> Probably caused by the unusual defconfig having:
>
>
> $ grep NFS .config
> CONFIG_KERNFS=y
> CONFIG_NFS_FS=y
> CONFIG_NFS_V2=y
> CONFIG_NFS_V3=y
> # CONFIG_NFS_V3_ACL is not set
> CONFIG_NFS_V4=y
> # CONFIG_NFS_SWAP is not set
> CONFIG_NFS_V4_1=y                       <------------
> # CONFIG_NFS_V4_2 is not set            <------------
> CONFIG_PNFS_FILE_LAYOUT=y
> CONFIG_PNFS_FLEXFILE_LAYOUT=m
> CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
> # CONFIG_NFS_V4_1_MIGRATION is not set
> CONFIG_ROOT_NFS=y
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=y
> # CONFIG_NFSD is not set
> CONFIG_NFS_COMMON=y
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/12449989/
>
>
>

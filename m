From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: ide tree build failure
Date: Mon, 30 Jun 2008 20:38:20 +0200
Message-ID: <200806302038.21254.bzolnier@gmail.com>
References: <20080630152854.7474ec30.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.187]:36947 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753146AbYF3VGZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jun 2008 17:06:25 -0400
Received: by mu-out-0910.google.com with SMTP id w8so659558mue.1
        for <linux-next@vger.kernel.org>; Mon, 30 Jun 2008 14:06:23 -0700 (PDT)
In-Reply-To: <20080630152854.7474ec30.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org


Hi,

On Monday 30 June 2008, Stephen Rothwell wrote:
> Hi Bart,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/ide/ppc/pmac.c: In function 'pmac_ide_setup_device':
> drivers/ide/ppc/pmac.c:1115: error: implicit declaration of function 'ide_alloc_host'
> drivers/ide/ppc/pmac.c:1115: warning: assignment makes pointer from integer without a cast

Thanks, I fixed the guilty patch.

> Caused by commit 9cfe46a0547b6a1481e773785bceb6a319963b49 ("ide: add
> struct ide_host (take 2)") from the ide tree which I have reverted.
> 
> Then the x86_64 allmodconfig build fails with:
> 
> ERROR: "ide_init_port_hw" [drivers/ide/legacy/ide-cs.ko] undefined!

ditto :)

Bart

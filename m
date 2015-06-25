From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: nfs commit breaks build for nfs4.1=y nfs4.2=n
Date: Thu, 25 Jun 2015 10:55:28 -0400
Message-ID: <20150625145528.GA3069@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:35992 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751509AbbFYO5a (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2015 10:57:30 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peng Tao <tao.peng@primarydata.com>
Cc: Jeff Layton <jeff.layton@primarydata.com>, Trond Myklebust <trond.myklebust@primarydata.com>, linux-next@vger.kernel.org


New breakage seen in linux-next:

fs/nfs/pnfs.c:2293: undefined reference to
`nfs42_proc_layoutstats_generic'

...bisected to:

commit 8733408d6ed713d080c325262d7b51a780136d41
Author: Peng Tao <tao.peng@primarydata.com>
Date:   Tue Jun 23 19:51:57 2015 +0800

    pnfs: add pnfs_report_layoutstat helper function

Probably caused by the unusual defconfig having:


$ grep NFS .config
CONFIG_KERNFS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=y
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y			<------------
# CONFIG_NFS_V4_2 is not set		<------------
CONFIG_PNFS_FILE_LAYOUT=y
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
# CONFIG_NFSD is not set
CONFIG_NFS_COMMON=y

http://kisskb.ellerman.id.au/kisskb/buildresult/12449989/
    

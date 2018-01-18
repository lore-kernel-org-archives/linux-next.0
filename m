From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nfsd tree
Date: Fri, 19 Jan 2018 10:23:05 +1100
Message-ID: <20180119102305.645ed6cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52913 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753881AbeARXXI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Jan 2018 18:23:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>

Hi,

After merging the nfsd tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/nfsd/nfs4xdr.c:241:1: warning: 'svcxdr_dupstr' defined but not used [-Wunused-function]
 svcxdr_dupstr(struct nfsd4_compoundargs *argp, void *buf, u32 len)
 ^~~~~~~~~~~~~

Introduced by commit

  e40d99e6183e ("NFSD: Clean up symlink argument XDR decoders")

The only remaining call is protected by CONFIG_NFSD_V4_SECURITY_LABEL.

-- 
Cheers,
Stephen Rothwell

From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: next-20080626: compiling error in XFS
Date: Thu, 26 Jun 2008 22:12:34 +0400
Message-ID: <a4423d670806261112n3a5073dcn476f0a3da963aa36@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from py-out-1112.google.com ([64.233.166.179]:64662 "EHLO
	py-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754466AbYFZSMi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Jun 2008 14:12:38 -0400
Received: by py-out-1112.google.com with SMTP id p76so19202pyb.10
        for <linux-next@vger.kernel.org>; Thu, 26 Jun 2008 11:12:35 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, xfs-masters@oss.sgi.com, xfs@oss.sgi.com, kernel list <linux-kernel@vger.kernel.org>, hch@infradead.org, tes@sgi.com, lachlan@sgi.com

Hi

  CC      fs/xfs/linux-2.6/xfs_xattr.o
fs/xfs/linux-2.6/xfs_xattr.c: In function 'xfs_decode_acl':
fs/xfs/linux-2.6/xfs_xattr.c:40: error: '_ACL_TYPE_ACCESS' undeclared
(first use in this function)
fs/xfs/linux-2.6/xfs_xattr.c:40: error: (Each undeclared identifier is
reported only once
fs/xfs/linux-2.6/xfs_xattr.c:40: error: for each function it appears in.)
fs/xfs/linux-2.6/xfs_xattr.c:42: error: '_ACL_TYPE_DEFAULT' undeclared
(first use in this function)


CONFIG_XFS_POSIX_ACL is disabled, so _ACL_TYPE_ACCESS was not defined.

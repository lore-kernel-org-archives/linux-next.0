From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 6 (fs/quota)
Date: Wed, 06 May 2009 09:05:33 -0700
Message-ID: <4A01B54D.90301@oracle.com>
References: <20090506172653.2f1bbedd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:40175 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756811AbZEFQEE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2009 12:04:04 -0400
In-Reply-To: <20090506172653.2f1bbedd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090505:


When
# CONFIG_QUOTA is not set
CONFIG_QUOTACTL=y
CONFIG_XFS_QUOTA=y

fs/quota/quota.c:163: error: redefinition of 'sync_quota_sb'
include/linux/quotaops.h:338: error: previous definition of 'sync_quota_sb' was here


-- 
~Randy

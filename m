From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 6 (fs/)
Date: Wed, 06 May 2009 08:55:02 -0700
Message-ID: <4A01B2D6.8080901@oracle.com>
References: <20090506172653.2f1bbedd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:50631 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759400AbZEFPx0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2009 11:53:26 -0400
In-Reply-To: <20090506172653.2f1bbedd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090505:



When CONFIG_BLOCK=n:

fs/super.c:278: error: implicit declaration of function 'sync_filesystem'

and after changing include/linux/fs.h so that that declaration is outside of
CONFIG_BLOCK=y/n:

fs/sync.c:40: error: implicit declaration of function '__sync_blockdev'


-- 
~Randy

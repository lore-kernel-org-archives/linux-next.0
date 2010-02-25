From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for February 25 (quota)
Date: Thu, 25 Feb 2010 09:21:39 -0800
Message-ID: <4B86B1A3.2090606@xenotime.net>
References: <20100225183523.80361261.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:39799 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S932947Ab0BYRVk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Feb 2010 12:21:40 -0500
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-next@vger.kernel.org>; Thu, 25 Feb 2010 09:21:39 -0800
In-Reply-To: <20100225183523.80361261.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>

On 02/24/10 23:35, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100224:


When CONFIG_BLOCK=n:

fs/quota/dquot.c:2042: error: implicit declaration of function 'fsync_bdev'

-- 
~Randy

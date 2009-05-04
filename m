From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: next: build fails at fs/lockd/svclock.c
Date: Mon, 04 May 2009 09:39:30 -0400
Message-ID: <1241444370.5754.5.camel@heimdal.trondhjem.org>
References: <a4423d670905040623q48eb552ft3bd107d6aa71d63b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out1.uio.no ([129.240.10.57]:37420 "EHLO mail-out1.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750833AbZEDNjf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 May 2009 09:39:35 -0400
In-Reply-To: <a4423d670905040623q48eb552ft3bd107d6aa71d63b@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, Felix Blyakher <felixb@sgi.com>, "J. Bruce Fields" <bfields@citi.umich.edu>, linux-nfs@vger.kernel.org

On Mon, 2009-05-04 at 17:23 +0400, Alexander Beregalov wrote:
> Hi
> 
> Randconfig fails like this
> 
> fs/lockd/svclock.c: In function 'nlmsvc_freegrantargs':
> fs/lockd/svclock.c:330: error: implicit declaration of function
> 'locks_release_private'
> 
> caused by a9e61e25f9d2
> (lockd: call locks_release_private to cleanup per-filesystem state)
> 
> 
> # CONFIG_FILE_LOCKING is not set
> CONFIG_LOCKD=y
> --

See the posting "[PATCH v2] lockd: fix FILE_LOCKING=n build error" by
Randy Dunlap last Tuesday.

Trond

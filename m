From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: no-MMU build failure
Date: Thu, 28 Feb 2013 20:14:16 +0000
Message-ID: <20130228201416.GR4503@ZenIV.linux.org.uk>
References: <1362082104.7319.13.camel@t520.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:37927 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757903Ab3B1UOR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 28 Feb 2013 15:14:17 -0500
Content-Disposition: inline
In-Reply-To: <1362082104.7319.13.camel@t520.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Salter <msalter@redhat.com>
Cc: linux-next <linux-next@vger.kernel.org>

On Thu, Feb 28, 2013 at 03:08:24PM -0500, Mark Salter wrote:
> I'm seeing a build failure in linux-next for c6x (no-MMU):
> 
>   /linux-next/mm/shmem.c: In function 'shmem_file_setup':
>   /linux-next/mm/shmem.c:2936:2: error: 'error' undeclared (first use in this function)

Yechh...  My fault; I think the cleanest fix here is
	res = ERR_PTR(ramfs_nommu_expand_for_mapping(inode, size));
	if (res)
		goto put_dentry;

Will be fixed in the next signal.git pull...

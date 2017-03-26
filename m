From: Bob Peterson <rpeterso@redhat.com>
Subject: Re: linux-next: unsigned commits in the gfs2 tree
Date: Sun, 26 Mar 2017 09:56:08 -0400 (EDT)
Message-ID: <368579413.6927168.1490536568440.JavaMail.zimbra@redhat.com>
References: <20170327002220.0b800d75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49720 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751354AbdCZN4J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Mar 2017 09:56:09 -0400
In-Reply-To: <20170327002220.0b800d75@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Whitehouse <swhiteho@redhat.com>, linux-next@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>

----- Original Message -----
| Hi all,
| 
| I noticed that a few of the commits in the gfs2 tree
| (git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git#for-next)
| have no Signed-off-by from their committer.
| 
| Also commit e8325475d61e ("Merge commit 'f9fe1c1' into for-next") seems
| to merge part of Dave Miller's net-next tree.  You really should have
| an explanation of why this is being done.
| --
| Cheers,
| Stephen Rothwell
| 
Hi Stephen,

Thanks. I'll check and fix the commits in the gfs2 tree, and I'll see
if Andreas can straighten it out with Dave Miller.

Regards,

Bob Peterson
Red Hat File Systems

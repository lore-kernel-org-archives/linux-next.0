From: Bob Peterson <rpeterso@redhat.com>
Subject: Re: linux-next: unsigned commits in the gfs2 tree
Date: Mon, 3 Apr 2017 09:34:24 -0400 (EDT)
Message-ID: <201585065.10432946.1491226464555.JavaMail.zimbra@redhat.com>
References: <20170327002220.0b800d75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59466 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753229AbdDCNe1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Apr 2017 09:34:27 -0400
In-Reply-To: <20170327002220.0b800d75@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Whitehouse <swhiteho@redhat.com>, linux-next@vger.kernel.org

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

As per your suggestion, I added a comment to the merge commit:
https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?h=for-next&id=df029f7bc32dd76ca85ecddc90e7e6a051192f2d

Let me know if you see a problem.

Regards,

Bob Peterson
Red Hat File Systems

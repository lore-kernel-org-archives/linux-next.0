From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfsd tree
Date: Thu, 9 Nov 2017 15:06:09 -0500
Message-ID: <20171109200609.GM8773@fieldses.org>
References: <20171110065135.1fd1d303@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fieldses.org ([173.255.197.46]:52842 "EHLO fieldses.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751225AbdKIUGJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Nov 2017 15:06:09 -0500
Content-Disposition: inline
In-Reply-To: <20171110065135.1fd1d303@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Naofumi Honda <honda@math.sci.hokudai.ac.jp>, Jeff Layton <jlayton@redhat.com>

On Fri, Nov 10, 2017 at 06:51:35AM +1100, Stephen Rothwell wrote:
> Hi,
> 
> Commit
> 
>   988e4fd55729 ("nfsd: fix panic in posix_unblock_lock called from nfs4_laundromat")
> 
> is missing a Signed-off-by from its author.

It fixes a typo in two lines in pretty much the only way possible, so
there should not be copyright concerns.

Naofumi Honda is as far as I know a one-time contributor, and I'd prefer
not to burden such folks with unnecessary bureaucracy.

--b.

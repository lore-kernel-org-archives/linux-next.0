From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the nfsd tree
Date: Fri, 10 Nov 2017 06:51:35 +1100
Message-ID: <20171110065135.1fd1d303@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Naofumi Honda <honda@math.sci.hokudai.ac.jp>, Jeff Layton <jlayton@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi,

Commit

  988e4fd55729 ("nfsd: fix panic in posix_unblock_lock called from nfs4_laundromat")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell

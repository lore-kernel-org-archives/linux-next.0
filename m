From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the nfsd tree
Date: Tue, 28 Nov 2017 09:52:56 +1100
Message-ID: <20171128095256.4052c982@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Naofumi Honda <honda@math.sci.hokudai.ac.jp>, Jeff Layton <jlayton@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Bruce,

Commit

  64ebe12494fd ("nfsd: fix panic in posix_unblock_lock called from nfs4_laundromat")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the nsfd tree
Date: Mon, 11 Jan 2016 12:16:32 +1100
Message-ID: <20160111121632.26fd5873@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.de>
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/namei.c

between commit:

  1932ac9d7cef ("nfsd: don't hold i_mutex over userspace upcalls")

from the nfsd tree and commit:

  bbddca8e8fac ("nfsd: don't hold i_mutex over userspace upcalls")

from the vfs tree.

Similar patch, but slightly different. :-(

I fixed it up (I used the vfs tree version) and can carry the fix as
necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

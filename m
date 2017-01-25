From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the userns
 tree
Date: Wed, 25 Jan 2017 16:08:35 +1100
Message-ID: <20170125160835.1b94db55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksa Sarai <asarai@suse.de>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/proc/base.c

between commit:

  68eb94f16227 ("proc: Better ownership of files for non-dumpable tasks in user namespaces")

from the userns tree and commit:

  d15d29b5352f ("procfs: change the owner of non-dumpable and writeable files")

from the akpm-current tree.

I *think* that the former supercedes the latter?

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Thu, 31 Dec 2015 13:30:22 +1100
Message-ID: <20151231133022.0b3ecab9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Doug,

Today's linux-next merge of the rdma tree got conflicts in a quite a
few files between (mostly, I think) commit:

  6c7b6d2d442c ("IB: merge struct ib_device_attr into struct ib_device")

from the nfsd tree and various commits from the rdma tree.

It would have taken me considerable time to fix the conflicts up, so I
have dropped teh rdma tree for today (just because it was merged second).
Please have a conversation and figure out how you are going to cooperate
and get these conflicts fixed e.g. set up a stable branch with Christoph's
commit (and any other conflicting commits) in it and merge that into
both trees.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

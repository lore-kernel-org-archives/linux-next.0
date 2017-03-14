From: Ross Zwisler <ross.zwisler-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH] dax: fix regression in dax_writeback_mapping_range()
Date: Tue, 14 Mar 2017 15:53:58 -0600
Message-ID: <20170314215358.31451-1-ross.zwisler@linux.intel.com>
References: <20170314025642.nwpf7zxbc6655gum@XZHOUW.usersys.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20170314025642.nwpf7zxbc6655gum-E9dkjZ7ERC1QcClZ3XN9yxcY2uh10dtjAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, "Darrick J. Wong" <darrick.wong-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Matthew Wilcox <mawilcox-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: linux-next.vger.kernel.org

commit 354ae7432ee8 ("dax: add tracepoints to dax_writeback_mapping_range()")
in the -next tree, which appears in next-20170310, inadvertently changed
dax_writeback_mapping_range() so that it could end up returning a positive
value: the number of bytes flushed, as returned by dax_writeback_one().
This was incorrect. This function either needs to return a negative error
value, or zero on success.

This change was causing xfstest failures, as reported by Xiong:

https://lkml.org/lkml/2017/3/13/1220

With this fix applied to next-20170310, all the test failures reported by
Xiong (generic/075 generic/112 generic/127 generic/231 generic/263) are
resolved.

Reported-by: Xiong Zhou <xzhou-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Ross Zwisler <ross.zwisler-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 fs/dax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dax.c b/fs/dax.c
index 1861ef0..60688c7 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -907,7 +907,7 @@ int dax_writeback_mapping_range(struct address_space *mapping,
 	}
 out:
 	trace_dax_writeback_range_done(inode, start_index, end_index);
-	return ret;
+	return (ret < 0 ? ret : 0);
 }
 EXPORT_SYMBOL_GPL(dax_writeback_mapping_range);
 
-- 
2.9.3

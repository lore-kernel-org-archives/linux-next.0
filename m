From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Mon, 9 Feb 2015 15:25:26 +1100
Message-ID: <20150209152526.1f2b749e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lIBdJTDjWUmiS_SVG5o_Yc_"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58279 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753236AbbBIEZd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Feb 2015 23:25:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Haynes <loghyr@primarydata.com>, Weston Andros Adamson <dros@primarydata.com>, Tao Peng <bergwolf@primarydata.com>, Christoph Hellwig <hch@lst.de>

--Sig_/lIBdJTDjWUmiS_SVG5o_Yc_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

After merging the block tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_layout_mark_request=
_commit':
fs/nfs/flexfilelayout/flexfilelayout.c:1369:47: error: 'struct address_spac=
e' has no member named 'backing_dev_info'
   inc_bdi_stat(page_file_mapping(req->wb_page)->backing_dev_info,
                                               ^

Caused by commit b83ae6d42143 ("fs: remove mapping->backing_dev_info")
interacting with commit d67ae825a59d ("pnfs/flexfiles: Add the FlexFile
Layout Driver") from the nfs tree.

I have added this merge fix patch (assuming it is correct, someone
needs to tell Linus about this when the trees get merged):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Feb 2015 15:20:12 +1100
Subject: [PATCH] pnfs/flexfiles: fix FlexFile Layout Driver for removal
 mapping->backing_dev_info

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/nfs/flexfilelayout/flexfilelayout.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/flexfilelayout/flexfilelayout.c b/fs/nfs/flexfilelayout=
/flexfilelayout.c
index f29fb7d7e8f8..c22ecaa86c1c 100644
--- a/fs/nfs/flexfilelayout/flexfilelayout.c
+++ b/fs/nfs/flexfilelayout/flexfilelayout.c
@@ -1366,7 +1366,7 @@ ff_layout_mark_request_commit(struct nfs_page *req,
 	spin_unlock(cinfo->lock);
 	if (!cinfo->dreq) {
 		inc_zone_page_state(req->wb_page, NR_UNSTABLE_NFS);
-		inc_bdi_stat(page_file_mapping(req->wb_page)->backing_dev_info,
+		inc_bdi_stat(inode_to_bdi(page_file_mapping(req->wb_page)->host),
 			     BDI_RECLAIMABLE);
 		__mark_inode_dirty(req->wb_context->dentry->d_inode,
 				   I_DIRTY_DATASYNC);
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/lIBdJTDjWUmiS_SVG5o_Yc_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU2Da7AAoJEMDTa8Ir7ZwVCOYP/2+vvkx3AQSxOvJKyaBxOn6L
jEKSVhKRa0Xf7lj3E5k4RYicqaffkiGBnqfIblsqC2TCboMpKf+0shh02/CWFz76
+7+wveZJ8DPn4hK5WhHTiJiV0FpYND/aANOE1Ho0WIFd5SAaINLqiHIt6AMeiv/Q
gW3aNx9rdBve0Y01Xyt9OklxarG9rNU/yPoQiCI3r/5XNi63Xk3hXx5OAbJozlD2
WD76hNpB6oU1YeBBTKzdroETNIsvgokCPiW9mN60qHUhDenXMhKo3VzFQVjCNZh0
GSbQ0Q1yDsuPz2lKFFwANq55K5T5KY3Q1C2lIgnqm7XE2A5CxNxrLCy5iiDJ8GTM
IXnRCRYbzMGngqSm3P86RZFYqzy96Q/V3xPnzO4vXDODBQqguuyU4ggqGMzf69dp
xNBmqKYDREOz8fAGOEQi7dzOhaCKS7A7db1panv9B3Yzq5uV2QaJtJVMxu+uDRAL
h/YUt4qu93UIGJLAE4MZbsn5/yUB1iWwU7Q2cPm34gWkZuJswxMu49+XFr4Qrvmj
daOSx25PeQYu8TJ3rvE1a6j/s+zPHtJcxXr9FuPCeCmTptzMw31M2lLJ3bneVLnY
JDUPr9JTPxnUO/WEBQOMvpUJBx3o7uBE6hTzD4wRgHllRKaNVxCiiPnonDZzqELQ
8XbL5rWGq3q0sQFkZmBo
=rU1b
-----END PGP SIGNATURE-----

--Sig_/lIBdJTDjWUmiS_SVG5o_Yc_--

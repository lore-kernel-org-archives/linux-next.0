From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the  tree
Date: Fri, 31 Jul 2009 14:39:12 +1000
Message-ID: <20090731143912.7a6afdbb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751191AbZGaEjR@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Markus Heidelberg <markus.heidelberg@web.de>
List-Id: linux-next.vger.kernel.org

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
MAINTAINERS between commit 24725d1ecf26ba05d74c1cc3ae7467b61a900421
("MAINTAINERS: Update KERNEL JANITORS") from Linus' tree and commit
70301b8cc8a23d57d3e6120c012c86569285efcb ("trivial: update the Kernel
Janitors' web-page URL") from the trivial tree.

Just context differences.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc MAINTAINERS
index fa86fd5,354cc16..0000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -2912,13 -3374,16 +2912,13 @@@ F:	Makefil
  F:	scripts/Makefile.*
  
  KERNEL JANITORS
 -P:	Several
  L:	kernel-janitors@vger.kernel.org
- W:	http://www.kerneljanitors.org/
+ W:	http://janitor.kernelnewbies.org/
 -S:	Maintained
 +S:	Odd fixes
  
  KERNEL NFSD, SUNRPC, AND LOCKD SERVERS
 -P:	J. Bruce Fields
 -M:	bfields@fieldses.org
 -P:	Neil Brown
 -M:	neilb@suse.de
 +M:	"J. Bruce Fields" <bfields@fieldses.org>
 +M:	Neil Brown <neilb@suse.de>
  L:	linux-nfs@vger.kernel.org
  W:	http://nfs.sourceforge.net/
  S:	Supported

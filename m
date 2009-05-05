From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] nfs: fix build error in nfsroot with initconst
Date: Tue, 5 May 2009 13:11:14 +0200
Message-ID: <20090505111114.GA16497@uranus.ravnborg.org>
References: <20090505111712.ae4649b3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:38410 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753616AbZEELJG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2009 07:09:06 -0400
Content-Disposition: inline
In-Reply-To: <20090505111712.ae4649b3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: linux-next@vger.kernel.org, Jan Beulich <jbeulich@novell.com>, Steven Whitehouse <swhiteho@redhat.com>

fix build error with latest kbuild adjustments to initconst.

The commit a447c0932445f92ce6f4c1bd020f62c5097a7842 ("vfs: Use
const for kernel parser table") changed:

    static match_table_t __initdata tokens = {
to
    static match_table_t __initconst tokens = {

But the missing const causes popwerpc to fail with latest
updates to __initconst like this:

fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section type conflict
fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section type conflict

The bug is only present with kbuild-next.
Following patch has been build tested.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Steven Whitehouse <swhiteho@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
---

Please apply this either to your -next tree or preferably upstream.

	Sam


diff --git a/fs/nfs/nfsroot.c b/fs/nfs/nfsroot.c
index d9ef602..e3ed590 100644
--- a/fs/nfs/nfsroot.c
+++ b/fs/nfs/nfsroot.c
@@ -129,7 +129,7 @@ enum {
 	Opt_err
 };
 
-static match_table_t __initconst tokens = {
+static const match_table_t tokens __initconst = {
 	{Opt_port, "port=%u"},
 	{Opt_rsize, "rsize=%u"},
 	{Opt_wsize, "wsize=%u"},

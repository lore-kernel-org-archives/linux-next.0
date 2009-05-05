From: "Jan Beulich" <jbeulich@novell.com>
Subject: Re: [PATCH] nfs: fix build error in nfsroot with initconst
Date: Tue, 05 May 2009 13:48:34 +0100
Message-ID: <4A0051C2.76EA.0078.0@novell.com>
References: <20090505111712.ae4649b3.sfr@canb.auug.org.au>
 <20090505111114.GA16497@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vpn.id2.novell.com ([195.33.99.129]:15767 "EHLO
	vpn.id2.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755083AbZEEMrU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2009 08:47:20 -0400
In-Reply-To: <20090505111114.GA16497@uranus.ravnborg.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Trond Myklebust <Trond.Myklebust@netapp.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Steven Whitehouse <swhiteho@redhat.com>, linux-next@vger.kernel.org

Acked-by: Jan Beulich <jbeulich@novell.com>

>>> Sam Ravnborg <sam@ravnborg.org> 05.05.09 13:11 >>>
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

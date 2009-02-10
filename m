From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the quota
 tree
Date: Tue, 10 Feb 2009 10:42:17 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0902101039520.11630@jikos.suse.cz>
References: <20090210183438.2099164f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:52150 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751128AbZBJJmU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Feb 2009 04:42:20 -0500
In-Reply-To: <20090210183438.2099164f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org

On Tue, 10 Feb 2009, Stephen Rothwell wrote:

> Today's linux-next merge of the trivial tree got a conflict in fs/Kconfig
> between commit c417122fec0f6b10a6c338c84180c6b9e06601c8 ("quota: Move
> quota files into separate directory") from the quota tree and commit
> 8310459012b926e121b3546bfed833910dd6f3ef ("trivial: fix typos/grammar
> errors in Kconfig texts") from the trivial tree.

Thanks for notification Stephen. I have dropped the conflicting hunk from 
my tree now. Jan, could you please take the patch below through your tree? 



From: Matt LaPlante <kernel1@cyberdogtech.com>
Subject: trivial: fix typos/grammar errors in fs/Kconfig

Signed-off-by: Matt LaPlante <kernel1@cyberdogtech.com>
Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>

diff --git a/fs/Kconfig b/fs/Kconfig
index 93945dd..951b310 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -87,7 +87,7 @@ config PRINT_QUOTA_WARNING
 	  Note that this behavior is currently deprecated and may go away in
 	  future. Please use notification via netlink socket instead.
 
-# Generic support for tree structured quota files. Seleted when needed.
+# Generic support for tree structured quota files. Selected when needed.
 config QUOTA_TREE
 	 tristate
 

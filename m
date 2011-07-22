From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: linux-next: manual merge of the security-testing tree with the vfs tree
Date: Fri, 22 Jul 2011 17:41:15 +0900
Message-ID: <201107220841.p6M8fGq0079572@www262.sakura.ne.jp>
References: <20110718153917.4aa9a18b80c0933cee4e638b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www262.sakura.ne.jp ([202.181.97.72]:49377 "EHLO
	www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753226Ab1GVIl0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Jul 2011 04:41:26 -0400
In-Reply-To: <20110718153917.4aa9a18b80c0933cee4e638b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: jmorris@namei.org, viro@zeniv.linux.org.uk
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Today's linux-next merge of the security-testing tree got a conflict in
> security/tomoyo/realpath.c between commit 6ef0dd885ce8 ("get rid of
> pointless checks for dentry->sb == NULL") from the vfs tree and commit
> 5625f2e32663 ("TOMOYO: Change pathname for non-rename()able filesystems")
> from the security-testing tree.
> 
> The latter includes the change from the former, so I just used the latter.

Thank you.
Modification of security/tomoyo/realpath.c in 6ef0dd885ce8 is no longer needed.

In message "linux-next: Tree for July 22",
Stephen Rothwell wrote:
> The security-testing tree still has its build failure.
(...snipped...)
> Merging security-testing/next
> CONFLICT (content): Merge conflict in security/tomoyo/realpath.c

What should I do?

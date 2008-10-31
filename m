From: Eric Paris <eparis@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 31 Oct 2008 17:32:34 -0400
Message-ID: <1225488754.3371.2.camel@localhost.localdomain>
References: <20081031170609.a3fcda4e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:45274 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752491AbYJaVdN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 17:33:13 -0400
In-Reply-To: <20081031170609.a3fcda4e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org

On Fri, 2008-10-31 at 17:06 +1100, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the creds tree got a conflict in
> security/selinux/hooks.c between commit
> 8b6a5a37f87a414ef8636e36ec75accb27bb7508 ("SELinux: check open perms in
> dentry_open not inode_permission") from the security-testing tree and
> commits 7113316bdf8c9f91df7bd68ab739d9bd0f5e8efc ("CRED: Make
> inode_has_perm() and file_has_perm() take a cred pointer") and
> a9018998dcc1e3b4401a7f6d2050ffedbd1b64da ("CRED: Inaugurate COW
> credentials") from the creds tree.
> 
> Overlapping changes.  I fixed it up (see below) and can carry the fix.

ACK  Looks good to me, thanks.

From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 17 Oct 2008 11:34:54 +0100
Message-ID: <26941.1224239694@redhat.com>
References: <20081017171350.bb82c42a.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:37582 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751688AbYJQKfe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 06:35:34 -0400
In-Reply-To: <20081017171350.bb82c42a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, "Kirill A. Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the creds tree got a conflict in
> include/linux/binfmts.h between commits
> 53112488bebe25c0f5f8a002470046c0fe9a6c61 ("alpha: introduce field 'taso'
> into struct linux_binprm") and bf2a9a39639b8b51377905397a5005f444e9a892
> ("Allow recursion in binfmt_script and binfmt_misc") from Linus' tree and
> commit e87a7f7a60e07326cd18987f1d490e42c083792c ("CRED: Make execve()
> take advantage of copy-on-write credentials") from the creds tree.

ACK.

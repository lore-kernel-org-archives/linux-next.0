From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Tue, 21 Oct 2008 15:30:23 +0100
Message-ID: <22027.1224599423@redhat.com>
References: <20081021170704.e286be37.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:33441 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751585AbYJUObr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 10:31:47 -0400
In-Reply-To: <20081021170704.e286be37.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Brice Goglin <Brice.Goglin@inria.fr>, Andrew Morton <akpm@linux-foundation.org>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the creds tree got a conflict in mm/migrate.c
> between commit sys_move_pages ("mm: extract do_pages_move() out of
> sys_move_pages()") from Linus' tree and commits
> b76546e8e9ac10969037c4866fcc44716e66eef8 ("CRED: Wrap task credential
> accesses in the core kernel"), 12da5768699059a4fe96080df5fa4e6d0e73a9ba
> ("CRED: Separate task security context from task_struct") and
> e3c5b08cf35d6e1913789255e0755dfb46cc0807 ("CRED: Use RCU to access
> another task's creds and to release a task's own creds") from the creds
> tree.

ACK.

David

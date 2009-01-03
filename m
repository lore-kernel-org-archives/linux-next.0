From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the security-testing tree
Date: Sat, 03 Jan 2009 22:55:53 +0000
Message-ID: <14722.1231023353@redhat.com>
References: <20081231125025.b74309b1.sfr@canb.auug.org.au> <20081120163734.9e5f0d61.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:56010 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759967AbZACW6q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 3 Jan 2009 17:58:46 -0500
In-Reply-To: <20081231125025.b74309b1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Mark Fasheh <mfasheh@suse.com>, linux-next@vger.kernel.org, Tiger Yang <tiger.yang@oracle.com>, James Morris <jmorris@namei.org>, Jan Kara <jack@suse.cz>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> This conflict is now between the ocfs2 tree and Linus' tree (the
> security-testing tree beat you to being merged :-)).

Replace current->fsuid with current_fsuid().

David

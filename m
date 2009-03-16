From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the bkl-removal tree with Linus'
 tree
Date: Mon, 16 Mar 2009 08:30:01 -0600
Message-ID: <20090316083001.68053422@bike.lwn.net>
References: <20090316170724.1251cce9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vena.lwn.net ([206.168.112.25]:52233 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757168AbZCPOaF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 10:30:05 -0400
In-Reply-To: <20090316170724.1251cce9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>

On Mon, 16 Mar 2009 17:07:24 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the bkl-removal tree got a conflict in
> fs/pipe.c between commit e5bc49ba7439b9726006d031d440cba96819f0f8
> ("pipe_rdwr_fasync: fix the error handling to prevent the leak/crash")
> from Linus' tree and commit 5c7eec1a9b90b18837a45cccb7fe3c182dce57d0
> ("Rationalize fasync return values") from the bkl-removal tree.

Sigh, I knew that was coming too, sorry.  I'll just pull the
bkl-removal tree forward, that should make that particular problem go
away.

Thanks,

jon

Jonathan Corbet / LWN.net / corbet@lwn.net

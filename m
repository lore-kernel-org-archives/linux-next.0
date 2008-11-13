From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Thu, 13 Nov 2008 12:33:04 +0000
Message-ID: <23452.1226579584@redhat.com>
References: <20081113162404.e8d64523.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:40467 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754004AbYKMMdv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 07:33:51 -0500
In-Reply-To: <20081113162404.e8d64523.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, "Serge E. Hallyn" <serue@us.ibm.com>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> 
> Today's linux-next merge of the creds tree got conflicts against the
> security-testing tree (besides the two I tried to fix up).
> 
> I have dropped it again for today.
> 
> I think the only way forward is for you and James to come to some
> arrangement.  Probably this will involve James merging your tree into his
> and me removing creds as a separate tree from linux-next.

We have come to an arrangement.  I'm fixing up my patches so that James can
just stack them on top of his tree.  After that, you'll get them via James.

David

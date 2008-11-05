From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the userns tree
Date: Wed, 05 Nov 2008 11:49:03 +0000
Message-ID: <22795.1225885743@redhat.com>
References: <20081105163314.30c72d57.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:55496 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755271AbYKELtr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Nov 2008 06:49:47 -0500
In-Reply-To: <20081105163314.30c72d57.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, "Serge E. Hallyn" <serue@us.ibm.com>, linux-next@vger.kernel.org, James Morris <jmorris@namei.org>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> 
> Today's linux-next merge of the userns tree got conflicts caused by the
> creds tree that the userns tree is based on.  I excluded the creds tree
> (since the conflicts were a bit complex) so I need to exclude the userns
> tree as well for today.

Can you give more details?

I wonder if I need to be more proactive in getting the wrapper patches pushed
into their respective subsys trees.

David

From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Wed, 12 Nov 2008 18:23:36 +0000
Message-ID: <2867.1226514216@redhat.com>
References: <20081112163006.d526f0eb.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:33123 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752041AbYKLSXn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 13:23:43 -0500
In-Reply-To: <20081112163006.d526f0eb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the creds tree got a conflicts in
> security/keys/internal.h and security/keys/process_keys.c between commit
> 1f8f5cf6e4f038552a3e47b66085452c08556d71 ("KEYS: Make request key
> instantiate the per-user keyrings") from Linus' tree and
> f71e534c1149637f4eb186b351e6afeb8584551c ("KEYS: Alter use of key
> instantiation link-to-keyring argument") from the creds tree.
> 
> It needs local knowledge to fix up, so I will drop the creds tree for
> today.

I've pushed a merge of that.

David

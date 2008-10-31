From: Eric Sandeen <sandeen@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 31 Oct 2008 11:54:19 -0500
Message-ID: <490B383B.5040409@redhat.com>
References: <20081031164708.fd0bfba5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:53061 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752294AbYJaQy6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 12:54:58 -0400
In-Reply-To: <20081031164708.fd0bfba5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>

Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the creds tree got conflicts in
> fs/ext4/balloc.c between commits 8c3bf8a01c005385e9be0bc992e10abfb355278c
> ("merge ext4_claim_free_blocks & ext4_has_free_blocks") and
> a996031c87e093017c0763326a08896a3a4817f4 ("delay capable() check in
> ext4_has_free_blocks()") from the ext4 tree and commit
> e6396a30cfa855ccca8cc21bcd92bb40ed10619f ("CRED: Wrap task credential
> accesses in the Ext4 filesystem") from the creds tree.
> 
> Overlapping change/move of code.  I fixed it up (see below) and can carry
> the fix.

Looks fine, thanks.

-Eric

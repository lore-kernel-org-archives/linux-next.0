From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 31 Oct 2008 10:37:18 +0000
Message-ID: <11176.1225449438@redhat.com>
References: <20081031165606.52de69dc.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:48354 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751988AbYJaKhk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 06:37:40 -0400
In-Reply-To: <20081031165606.52de69dc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Alan Cox <alan@redhat.com>, Andrew Morton <akpm@linux-foundation.org>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the creds tree got conflicts in
> include/linux/security.h and security/security.c between commit
> 731572d39fcd3498702eda4600db4c43d51e0b26 ("nfsd: fix vm overcommit
> crash") from Linus' tree and commit
> a3338909826d32d821158a6adc43ce0a1654b31d ("CRED: Make execve() take
> advantage of copy-on-write credentials") from the creds tree.
> 
> Just overlapping additions changes. I fixed it up (see below).

Looks good.  I've pushed my own version of this into my tree.

David

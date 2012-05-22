From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with Linus' tree
Date: Tue, 22 May 2012 08:29:24 -0600
Message-ID: <87likkmgqj.fsf@xmission.com>
References: <20120522174426.1cd39ec7841e7545bb340cdd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:46540 "EHLO
	out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752960Ab2EVO3f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 May 2012 10:29:35 -0400
In-Reply-To: <20120522174426.1cd39ec7841e7545bb340cdd@canb.auug.org.au>
	(Stephen Rothwell's message of "Tue, 22 May 2012 17:44:26 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> Today's linux-next merge of the userns tree got a conflict in fs/stat.c
> between commit a52dd971f947 ("vfs: de-crapify "cp_new_stat()" function")
> from Linus' tree and commit a7c1938e22c0 ("userns: Convert stat to return
> values mapped from kuids and kgids") from the userns tree.
>
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks good thanks.

Eric

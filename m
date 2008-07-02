From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the bkl-removal tree
Date: Wed, 2 Jul 2008 15:10:21 -0600
Message-ID: <20080702151021.56570002@bike.lwn.net>
References: <20080701194544.f2109cdd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vena.lwn.net ([206.168.112.25]:60424 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753780AbYGBVKY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Jul 2008 17:10:24 -0400
In-Reply-To: <20080701194544.f2109cdd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Gerald Schaefer <gerald.schaefer@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Tue, 1 Jul 2008 19:45:44 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the bkl-removal tree got a conflict in
> drivers/s390/char/monreader.c between commit
> 4b45ec0706ac12bf0c790747e55b4f3fec776c7a ("[S390] Cleanup monreader
> printk messages.") from the s390 tree and commit
> 167ae8a4822ed405037e72d660acf3294ab32807 ("monreader: BKL pushdown")
> from the bkl-removal tree.

That one's a simple matter of moving the include of
<linux/smp_lock.h>.  I've done that, so this conflict should be gone
now.

Thanks,

jon

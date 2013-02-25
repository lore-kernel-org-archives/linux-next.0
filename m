From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Date: Mon, 25 Feb 2013 12:36:34 +0100
Message-ID: <512B4CC2.80008@suse.cz>
References: <20130225105650.6b89477b11c895ba99a666fe@canb.auug.org.au> <512B3CD8.5070802@suse.cz> <20130225215845.c0ec14a467aa6fe8e788e80e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43714 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759799Ab3BYLgi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Feb 2013 06:36:38 -0500
In-Reply-To: <20130225215845.c0ec14a467aa6fe8e788e80e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Grzeschik <m.grzeschik@pengutronix.de>

On 25.2.2013 11:58, Stephen Rothwell wrote:
> ----------------------------------------------------------------------
> $ ls -l /bin/sh
> lrwxrwxrwx 1 root root 4 Jul  7  2010 /bin/sh -> bash
> $ bash --version
> GNU bash, version 4.2.20(1)-release (x86_64-pc-linux-gnu)
[...]
> But bash in sh mode does not work:
> 
> $ cat xtst.sh
> #!/bin/sh
> 
> cd /scratch/sfr/powerpc_ppc64_defconfig
> 
> . .config
> 
> exit 0
> $ ./xtst.sh
> ./xtst.sh: line 5: .: .config: file not found

Ah, so it's a too new bash that causes this. I can also reproduce it now.

Michal

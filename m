From: "NeilBrown" <neilb@suse.de>
Subject: Re: linux-next: md tree build warnings
Date: Thu, 20 Nov 2008 16:24:46 +1100 (EST)
Message-ID: <a441d5f4cdd1d529e288149f659b553c.squirrel@neil.brown.name>
References: <20081120161056.47b6130e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:44002 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752623AbYKTFY4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 00:24:56 -0500
In-Reply-To: <20081120161056.47b6130e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Cheng Renquan <crquan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

On Thu, November 20, 2008 4:10 pm, Stephen Rothwell wrote:
> Hi Neil,
>
> Today's linux-next build (powerpc ppc64_defconfig) produced these new
> warnings:
>
> drivers/md/md.c: In function 'print_sb_1':
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',
> but argument 3 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',
> but argument 7 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',
> but argument 8 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',
> but argument 9 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',
> but argument 10 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Lu' expects type 'long long
> unsigned int', but argument 29 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',
> but argument 30 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',
> but argument 31 has type '__le64'
>
> Added by commit 4c3da1f23cf20603339493525adf8903a5722417 "md: need
> another print_sb for mdp_superblock_1".  We cast 64 bit quantities to
> "unsigned long long" when we print them since they are just "unsigned
> long" on some architectures.  Also since they are __le64, will they print
> anything useful on a big endian architecture?


Thanks.  Insufficient review on my part.  I'll get it sorted before you
next pull.

NeilBrown

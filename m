From: "rae l" <crquan@gmail.com>
Subject: Re: linux-next: md tree build warnings
Date: Thu, 20 Nov 2008 13:21:41 +0800
Message-ID: <91b13c310811192121q909bf25x1408458010a8f9cd@mail.gmail.com>
References: <20081120161056.47b6130e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.159]:20516 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752885AbYKTF1M (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Nov 2008 00:27:12 -0500
Received: by fg-out-1718.google.com with SMTP id 19so237015fgg.17
        for <linux-next@vger.kernel.org>; Wed, 19 Nov 2008 21:27:10 -0800 (PST)
In-Reply-To: <20081120161056.47b6130e.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Neil Brown <neilb@suse.de>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Thu, Nov 20, 2008 at 1:10 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Neil,
>
> Today's linux-next build (powerpc ppc64_defconfig) produced these new
> warnings:
>
> drivers/md/md.c: In function 'print_sb_1':
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', but argument 3 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', but argument 7 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', but argument 8 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', but argument 9 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', but argument 10 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Lu' expects type 'long long unsigned int', but argument 29 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', but argument 30 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', but argument 31 has type '__le64'
>
> Added by commit 4c3da1f23cf20603339493525adf8903a5722417 "md: need
> another print_sb for mdp_superblock_1".  We cast 64 bit quantities to
> "unsigned long long" when we print them since they are just "unsigned
> long" on some architectures.  Also since they are __le64, will they print
> anything useful on a big endian architecture?

That's my problem, I'm checking __le64 to cpu_le64 at once, and will
post another patch later.

>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>



-- 
Cheng Renquan, Shenzhen, China
Dan Quayle  - "This President is going to lead us out of this recovery."

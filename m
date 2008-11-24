From: "NeilBrown" <neilb@suse.de>
Subject: Re: linux-next: build warning
Date: Mon, 24 Nov 2008 18:53:46 +1100 (EST)
Message-ID: <c102bd10dc67100b000665a13846f114.squirrel@neil.brown.name>
References: <20081124173823.cb6a22cf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33692 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750722AbYKXHxx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 02:53:53 -0500
In-Reply-To: <20081124173823.cb6a22cf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Cheng Renquan <crquan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

On Mon, November 24, 2008 5:38 pm, Stephen Rothwell wrote:
> Hi Neil,
>
> Today's linux-next build (i386 defconfig) produced these warnings:
>
> drivers/md/md.c: In function 'print_sb_1':
> drivers/md/md.c:1678: warning: left shift count >= width of type
> drivers/md/md.c:1702: warning: left shift count >= width of type
>
> Caused by commit 8a11632aeb9ad49bbda3e2c6978b207c6aff1aa8 ("md: need
> another print_sb for mdp_superblock_1").

Thanks.  That's now fixed in my tree - you should see happiness tomorrow.

NeilBrown

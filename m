From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: kbuild tree build failure
Date: Tue, 25 Nov 2008 09:42:26 +0100
Message-ID: <20081125084226.GA31444@uranus.ravnborg.org>
References: <20081125154705.09683583.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:50997 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752081AbYKYIlD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 03:41:03 -0500
Content-Disposition: inline
In-Reply-To: <20081125154705.09683583.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, Nov 25, 2008 at 03:47:05PM +1100, Stephen Rothwell wrote:
> Hi Sam,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> WARNING: modpost: Found 11 section mismatch(es).
> To see full details build your kernel with:
> 'make CONFIG_DEBUG_SECTION_MISMATCH=y'
> .tmp_kallsyms1.S:1:23: error: asm/types.h: No such file or directory
> 
> I have dropped the kbuild tree for today.

Fixed.

	Sam

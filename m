From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: kbuild tree build warning
Date: Wed, 10 Jun 2009 08:47:23 +0200
Message-ID: <20090610064723.GA25493@uranus.ravnborg.org>
References: <20090610115255.035da856.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:44039 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753743AbZFJGpG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2009 02:45:06 -0400
Content-Disposition: inline
In-Reply-To: <20090610115255.035da856.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 10, 2009 at 11:52:55AM +1000, Stephen Rothwell wrote:
> Hi Sam,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> In file included from arch/x86/kernel/vmlinux.lds.S:23:
> include/asm-generic/vmlinux.lds.h:726:47: warning: backslash-newline at end of file
> 
> Caused by commit ef53dae8658cf0e93d380983824a661067948d87 ("Improve
> vmlinux.lds.h support for arch specific linker scripts").

I already fixed this locally but I forgot to do a "git commit --amend" :-)
Will be fixed in next push of kbuild-next.

	Sam

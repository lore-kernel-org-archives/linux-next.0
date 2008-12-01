From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: sparc tree build failure
Date: Mon, 1 Dec 2008 06:41:40 +0100
Message-ID: <20081201054140.GA21718@uranus.ravnborg.org>
References: <20081201104639.5080f12e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:36831 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750709AbYLAFkR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Dec 2008 00:40:17 -0500
Content-Disposition: inline
In-Reply-To: <20081201104639.5080f12e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

On Mon, Dec 01, 2008 at 10:46:39AM +1100, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
>   GEN     /scratch/sfr/powerpc_ppc64_defconfig/Makefile
> ***
> *** Can't find default configuration "arch/sparc/configs/ppc64_defconfig"!
> ***
> 
> Caused by commit 9cdcf85e1bf5dca97c1304292810041af2fcbd42 ("Subject:
> [PATCH 08/10] sparc,sparc64: unify Makefile") which seems to arbitrarily
> set SRCARCH in the top level make file to sparc!
Crap - missed an if/endif
Fix is simple:
diff --git a/Makefile b/Makefile
index 0043224..45f4300 100644
--- a/Makefile
+++ b/Makefile
@@ -206,7 +206,9 @@ ifeq ($(ARCH),x86_64)
 endif
 
 # Additional ARCH settings for sparc
+ifeq ($(ARCH),sparc64)
        SRCARCH := sparc
+endif
 
 # Where to locate arch specific headers
 hdr-arch  := $(SRCARCH)

> 
> (One way to take over the world, I guess :-))
Reminds me about Pinky & Brain - we almost suceeded!

	Sam

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of most trees
Date: Thu, 22 Jun 2017 16:23:38 +1000
Message-ID: <20170622162338.7ea0df3e@canb.auug.org.au>
References: <20170622152441.3704b3d9@canb.auug.org.au>
        <20170622154952.0c66951b@roar.ozlabs.ibm.com>
        <20170622162011.583d68d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59033 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751159AbdFVGXl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jun 2017 02:23:41 -0400
In-Reply-To: <20170622162011.583d68d0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: David Miller <davem@davemloft.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

Hi Nick,

On Thu, 22 Jun 2017 16:20:11 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Thu, 22 Jun 2017 15:49:52 +1000 Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > It could be this
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=thin-ar&id=ec2c9c20f0efab37ae31de44fe0617aa61283905
> > 
> >     kbuild: handle libs-y archives separately from built-in.o archives
> > 
> > That touches the lib linking code regardless of CONFIG_THIN_ARCHIVE.
> > You should be able to revert it by itself (which will break a few
> > other archs, so you would also have to revert the default y patch
> > for thin archives to repair your tree if this is the cause).  
> 
> Yeah, reverting that commit fixes the sparc64 build. (i have not done
> that in today;s linux-next release, however).

But it broke the 32 bit sparc defconfig:

arch/sparc/lib/strlen.o: In function `strlen':
(.text+0x0): multiple definition of `strlen'
lib/string.o:string.c:(.text+0x4b4): first defined here

No unexpected, I expect :-)
-- 
Cheers,
Stephen Rothwell

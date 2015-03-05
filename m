From: Toshi Kani <toshi.kani@hp.com>
Subject: Re: [PATCH] Fix undefined ioremap_huge_init when CONFIG_MMU is not
 set
Date: Thu, 05 Mar 2015 16:43:43 -0700
Message-ID: <1425599023.17007.293.camel@misato.fc.hp.com>
References: <1425570246-812-1-git-send-email-toshi.kani@hp.com>
	 <20150306104113.555c8888@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20150306104113.555c8888@canb.auug.org.au>
Sender: owner-linux-mm@kvack.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kbuild-all@01.org, fengguang.wu@intel.com, hannes@cmpxchg.org
List-Id: linux-next.vger.kernel.org

On Fri, 2015-03-06 at 10:41 +1100, Stephen Rothwell wrote:
> Hi Toshi,
> 
> On Thu,  5 Mar 2015 08:44:06 -0700 Toshi Kani <toshi.kani@hp.com> wrote:
> >
> > Fix a build error, undefined reference to ioremap_huge_init, when
> > CONFIG_MMU is not defined on linux-next and -mm tree.
> > 
> > lib/ioremap.o is not linked to the kernel when CONFIG_MMU is not
> > defined.
> > 
> > Signed-off-by: Toshi Kani <toshi.kani@hp.com>
> > ---
> >  include/linux/io.h |    5 +++--
> >  lib/ioremap.c      |    1 -
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> Added to my copy of the akpm-current tree today (and so into linux-next).

Thanks Stephen!
-Toshi


--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

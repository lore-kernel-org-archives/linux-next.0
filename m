From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure
Date: Mon, 20 Oct 2008 08:48:57 -0700
Message-ID: <20081020154857.GC24666@kroah.com>
References: <20081020230420.aa85f83b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752601AbYJTPwr@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081020230420.aa85f83b.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Christopher Harrer <charrer@alacritech.com>, Michael Miles <mmiles@alacritech.com>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linus@kroah.com
List-Id: linux-next.vger.kernel.org

On Mon, Oct 20, 2008 at 11:04:20PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> In file included from drivers/staging/sxg/sxg.c:77:
> drivers/staging/sxg/sxghif.h:859: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'Compilation'
> drivers/staging/sxg/sxg.c: In function 'sxg_transmit_packet':
> drivers/staging/sxg/sxg.c:1949: error: 'SXG_SGL_BUF_SIZE' undeclared (first use in this function)
> drivers/staging/sxg/sxg.c:1958: error: implicit declaration of function 'SXG_SGL_BUFFER'
> drivers/staging/sxg/sxg.c:1958: warning: assignment makes pointer from integer without a cast
> drivers/staging/sxg/sxg.c: In function 'sxg_mcast_set_mask':
> drivers/staging/sxg/sxg.c:2846: warning: format '%llx' expects type 'long long unsigned int', but argument 5 has type 'u64'
> 
> I applied the following patch.

Ah, doh, sorry, I should have caught that.  I'll go apply this to the
tree, thanks.

greg k-h

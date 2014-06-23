From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build failure after merge of the crypto tree
Date: Mon, 23 Jun 2014 21:40:26 +0800
Message-ID: <20140623134026.GA21647@gondor.apana.org.au>
References: <20140623114942.6a937466@canb.auug.org.au>
 <20140623122747.GA21213@gondor.apana.org.au>
 <20140623231531.26c67841@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140623231531.26c67841@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tadeusz Struk <tadeusz.struk@intel.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 23, 2014 at 11:15:31PM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> On Mon, 23 Jun 2014 20:27:47 +0800 Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >
> > That's weird as it built correctly here.  This looks like a
> > make/gcc issue as the missing header file is meant to be found
> > with an additional -I.
> > 
> > Could you do a make V=1 for me and show me what the gcc command-line
> > looks like?
> 
> Not until tomorrow.  In the mean time, could you try it with an
> external object dir i.e. "make O=..."
> 
> If that breaks, I think you need to change CURDIR to srcdir or some
> such ...

Thanks for the hint Stephen.  I've added the following fix which
hopefully should fix the problem.

commit e60b244281cfe03ddd7c5c15c4e6b6d6316bb530
Author: Herbert Xu <herbert@gondor.apana.org.au>
Date:   Mon Jun 23 21:37:53 2014 +0800

    crypto: qat - Fix build problem with O=
    
    qat adds -I to the ccflags.  Unfortunately it uses CURDIR which
    breaks when make is invoked with O=.  This patch replaces CURDIR
    with $(src) which should work with/without O=.
    
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/drivers/crypto/qat/qat_dh895xcc/Makefile b/drivers/crypto/qat/qat_dh895xcc/Makefile
index 8e4924d..25171c5 100644
--- a/drivers/crypto/qat/qat_dh895xcc/Makefile
+++ b/drivers/crypto/qat/qat_dh895xcc/Makefile
@@ -1,4 +1,4 @@
-ccflags-y := -I$(CURDIR)/drivers/crypto/qat/qat_common
+ccflags-y := -I$(src)/../qat_common
 obj-$(CONFIG_CRYPTO_DEV_QAT_DH895xCC) += qat_dh895xcc.o
 qat_dh895xcc-objs := adf_drv.o \
 		adf_isr.o \

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

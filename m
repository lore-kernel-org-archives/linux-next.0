From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 22 Jan 2016 13:40:45 +1100
Message-ID: <20160122134045.438cd9d9@canb.auug.org.au>
References: <20151231232210.7ab890f1@canb.auug.org.au>
	<20160114151541.17e76d23@canb.auug.org.au>
	<20160115130527.c43357d0aef93d22380c6673@linux-foundation.org>
	<20160116100047.681e0e03@canb.auug.org.au>
	<20160115151401.03fe1a39ca397079407c2ca9@linux-foundation.org>
	<s5h4meductq.wl-tiwai@suse.de>
	<s5hmvs0uytw.wl-tiwai@suse.de>
	<20160121073859.3a6c22a3@canb.auug.org.au>
	<20160122112442.75c07aac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160122112442.75c07aac@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Vinod Koul <vinod.koul@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

On Fri, 22 Jan 2016 11:24:42 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Thu, 21 Jan 2016 07:38:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Wed, 20 Jan 2016 15:09:47 +0100 Takashi Iwai <tiwai@suse.de> wrote:  
> > >
> > > On Sat, 16 Jan 2016 09:51:29 +0100,
> > > Takashi Iwai wrote:    
> > > > 
> > > > There are a few ways to fix this, but all are not comfortable.
> > > > 
> > > > A. Disable compress API for powerpc.    
> > 
> > This also affects alpha, mips and (maybe) sparc.  
> 
> This was exposed on PowerPC by commit bf76f73c5f65 ("powerpc: enable
> UBSAN support") which is in Linus' tree as of this morning.  The only
> relevant change that made was in the compiler flags (I tested this by
> building the file without that commit but with these new compiler flags:
> 
> -fsanitize=shift -fsanitize=integer-divide-by-zero
> -fsanitize=unreachable -fsanitize=vla-bound -fsanitize=null
> -fsanitize=signed-integer-overflow -fsanitize=bounds
> -fsanitize=object-size -fsanitize=returns-nonnull-attribute
> -fsanitize=bool -fsanitize=enum -fsanitize=alignment
> 
> The preprocessed file is the same in both cases, but with these flags
> the compiler errors.

So for now I have suppressed the error using the following patch (which
I will keep in my fixes tree until some other fix is applied):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 22 Jan 2016 13:24:57 +1100
Subject: [PATCH] next: suppress the building of all the sound codecs on PPC
 for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 50693c867e71..ee5f36b9c787 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -13,6 +13,7 @@ menu "CODEC drivers"
 config SND_SOC_ALL_CODECS
 	tristate "Build all ASoC CODEC drivers"
 	depends on COMPILE_TEST
+	depends on !PPC
 	select SND_SOC_88PM860X if MFD_88PM860X
 	select SND_SOC_L3
 	select SND_SOC_AB8500_CODEC if ABX500_CORE
-- 
2.6.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

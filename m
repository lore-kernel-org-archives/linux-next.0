From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: upstream tree build failure
Date: Thu, 23 Apr 2009 16:06:56 +1000
Message-ID: <20090423160656.fac84e3f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

[I am now using gcc version 4.4.0 ...]

Today's linux-next build (powerpc ppc44x_defconfig) failed like this:

arch/powerpc/mm/tlb_nohash_low.S:206:6: error: #elif with no expression

Previous gcc versions didn't notice this because one of the preceding
#ifs always evaluated to true.  I have applied the following patch for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 23 Apr 2009 16:00:47 +1000
Subject: [PATCH] powerpc: fix for long standing bug noticed by gcc 4.4.0

Previous gcc versions didn't notice this because one of the preceding

gcc 4.4.0 produced this error:

arch/powerpc/mm/tlb_nohash_low.S:206:6: error: #elif with no expression

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/mm/tlb_nohash_low.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/mm/tlb_nohash_low.S b/arch/powerpc/mm/tlb_nohash_low.S
index 45fed36..21e1b9a 100644
--- a/arch/powerpc/mm/tlb_nohash_low.S
+++ b/arch/powerpc/mm/tlb_nohash_low.S
@@ -203,6 +203,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_TLBILX)
 	isync
 1:	wrtee	r10
 	blr
-#elif
+#else
 #error Unsupported processor type !
 #endif
-- 
1.6.2.3

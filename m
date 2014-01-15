From: Richard Weinberger <richard@nod.at>
Subject: [PATCH] um: Include generic barrier.h
Date: Wed, 15 Jan 2014 20:35:53 +0100
Message-ID: <1389814553-19861-1-git-send-email-richard@nod.at>
References: <52D6B591.3070707@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <user-mode-linux-devel-bounces@lists.sourceforge.net>
In-Reply-To: <52D6B591.3070707@infradead.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/user-mode-linux-devel>,
	<mailto:user-mode-linux-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=user-mode-linux-devel>
List-Post: <mailto:user-mode-linux-devel@lists.sourceforge.net>
List-Help: <mailto:user-mode-linux-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/user-mode-linux-devel>,
	<mailto:user-mode-linux-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: user-mode-linux-devel-bounces@lists.sourceforge.net
To: richard@nod.at
Cc: paulmck@linux.vnet.ibm.com, sfr@canb.auug.org.au, rdunlap@infradead.org, linux-next@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net
List-Id: linux-next.vger.kernel.org

...to get smp_store_release().

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 arch/um/include/asm/Kbuild | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/um/include/asm/Kbuild b/arch/um/include/asm/Kbuild
index fdde187..fb3a6cc 100644
--- a/arch/um/include/asm/Kbuild
+++ b/arch/um/include/asm/Kbuild
@@ -4,3 +4,4 @@ generic-y += ftrace.h pci.h io.h param.h delay.h mutex.h current.h exec.h
 generic-y += switch_to.h clkdev.h
 generic-y += trace_clock.h
 generic-y += preempt.h
+generic-y += barrier.h
-- 
1.8.4.2


------------------------------------------------------------------------------
CenturyLink Cloud: The Leader in Enterprise Cloud Services.
Learn Why More Businesses Are Choosing CenturyLink Cloud For
Critical Workloads, Development Environments & Everything In Between.
Get a Quote or Start a Free Trial Today. 
http://pubads.g.doubleclick.net/gampad/clk?id=119420431&iu=/4140/ostg.clktrk

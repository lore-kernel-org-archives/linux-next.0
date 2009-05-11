From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] kvm: fix build error: add missing semi-colon
Date: Mon, 11 May 2009 09:32:38 -0700
Message-ID: <4A085326.3030707@oracle.com>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au>
Sender: kvm-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, avi@redhat.com, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Add missing ; to fix build error:

arch/x86/kvm/x86.c:1259: error: expected',' or ';' before 'const'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 arch/x86/kvm/x86.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090511.orig/arch/x86/kvm/x86.c
+++ linux-next-20090511/arch/x86/kvm/x86.c
@@ -1252,7 +1252,7 @@ static void do_cpuid_ent(struct kvm_cpui
 #ifdef CONFIG_X86_64
 	unsigned f_lm = F(LM);
 #else
-	unsigned f_lm = 0
+	unsigned f_lm = 0;
 #endif
 
 	/* cpuid 1.edx */


-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/

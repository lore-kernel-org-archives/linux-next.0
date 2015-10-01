From: Borislav Petkov <bp@alien8.de>
Subject: Re: linux-next: Tree for Oct 1 (arch/x86/ras/mce_amd_inj.c)
Date: Thu, 1 Oct 2015 19:49:59 +0200
Message-ID: <20151001174958.GC3544@pd.tnic>
References: <20151001165001.02d3ada5@canb.auug.org.au>
 <560D6FD4.20203@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:36840 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756088AbbJARuD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Oct 2015 13:50:03 -0400
Content-Disposition: inline
In-Reply-To: <560D6FD4.20203@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aravind Gopalakrishnan <aravind.gopalakrishnan@amd.com>

On Thu, Oct 01, 2015 at 10:39:32AM -0700, Randy Dunlap wrote:
> On 09/30/15 23:50, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20150930:
> > 
> 
> 
> on x86_64:
> 
> ../arch/x86/ras/mce_amd_inj.c: In function 'toggle_nb_mca_mst_cpu':
> ../arch/x86/ras/mce_amd_inj.c:214:42: warning: dereferencing 'void *' pointer [enabled by default]
>   struct pci_dev *F3 = node_to_amd_nb(nid)->misc;
>                                           ^
> ../arch/x86/ras/mce_amd_inj.c:214:42: error: request for member 'misc' in something not a structure or union

Thanks Randy,

this is most likely due to us using node_to_amd_nb() - an AMD_NB
facility - but we're not depending on it. Does that help?

---
diff --git a/arch/x86/ras/Kconfig b/arch/x86/ras/Kconfig
index 10fea5fc821e..98b3ef750984 100644
--- a/arch/x86/ras/Kconfig
+++ b/arch/x86/ras/Kconfig
@@ -1,6 +1,6 @@
 config AMD_MCE_INJ
 	tristate "Simple MCE injection interface for AMD processors"
-	depends on RAS && EDAC_DECODE_MCE && DEBUG_FS
+	depends on RAS && EDAC_DECODE_MCE && DEBUG_FS && AMD_NB
 	default n
 	help
 	  This is a simple debugfs interface to inject MCEs and test different

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

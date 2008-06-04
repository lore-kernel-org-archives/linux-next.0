From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 4 -
	firmware/keyspan/mpr.fw.gen.S
Date: Wed, 04 Jun 2008 18:52:10 +0100
Message-ID: <1212601930.32207.134.camel@pmac.infradead.org>
References: <20080604180025.3ecd03ff.sfr@canb.auug.org.au>
	 <48468091.5000102@linux.vnet.ibm.com>
	 <1212580245.32207.51.camel@pmac.infradead.org>
	 <54a3f4cc48b03f9fe63be0bcd7c2ab20@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1761723AbYFDRwe@vger.kernel.org>
In-Reply-To: <54a3f4cc48b03f9fe63be0bcd7c2ab20@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Andy Whitcroft <apw@shadowen.org>
List-Id: linux-next.vger.kernel.org

On Wed, 2008-06-04 at 19:19 +0200, Segher Boessenkool wrote:
> It is a new feature in GNU make 3.81, which was released slightly
> over two years ago.

Hm, Ok. I'll stick in a workaround. Thanks.

diff --git a/firmware/Makefile b/firmware/Makefile
index b4f758a..166a9b0 100644
--- a/firmware/Makefile
+++ b/firmware/Makefile
@@ -83,6 +83,13 @@ wordsize_deps := $(wildcard include/config/64bit.h include/config/32bit.h \
 		include/config/superh32.h include/config/superh64.h \
 		include/config/x86_32.h include/config/x86_64.h)
 
+# Workaround for ancient versions of make, where .SECONDEXPANSION doesn't work.
+# It'll end up depending on these targets, so make them a PHONY rule which
+# depends on _all_ the directories in $(firmware-dirs), and it'll work out OK.
+PHONY += $(objtree)/$$(%) $(objtree)/$(obj)/$$(%)
+$(objtree)/$$(%) $(objtree)/$(obj)/$$(%): $(firmware-dirs)
+	@true
+
 # For the $$(dir %) trick, where we need % to be expanded first.
 .SECONDEXPANSION:
 


-- 
dwmw2

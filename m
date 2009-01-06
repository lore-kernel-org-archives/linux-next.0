From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: manual merge of the rr tree
Date: Tue, 6 Jan 2009 09:05:57 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0901060845001.11819@quilx.com>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au>
 <200901051727.11403.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901050915180.13193@quilx.com>
 <200901061134.49369.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi025.sbcis.sbc.com ([207.115.36.54]:56774 "EHLO
	nlpi025.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751950AbZAFPGr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Jan 2009 10:06:47 -0500
In-Reply-To: <200901061134.49369.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, andi@firstfloor.org

yOn Tue, 6 Jan 2009, Rusty Russell wrote:

> It was a Richard Henderson thing.  It was over six years ago, but I found
> one decent reference to it:
>
> 	http://lwn.net/2002/0214/a/per-cpu.php3
>
> Hope that answers your question?

Well thats the patch you sent in to Linus. I see one relevant comment in
there:

+/* This macro obfuscates arithmetic on a variable address so that gcc
+   shouldn't recognize it. This prevents optimizations such as the
+   famous:
+	strcpy(s, "xxx"+X) => memcpy(s, "xxx"+X, 4-X) */
+#define reloc_hide(var, off)						\
+  ({ __typeof__(&(var)) __ptr;					\
+    __asm__ ("" : "=g"(__ptr) : "0"((void *)&(var) + (off)));	\
+    *__ptr; })


I dont get the point here.

strcpy(s, "xxx" + X ) -> memcpy(s, "xxx" + X, strlen("xxx" + X) + 1) -> memcpy(s, "xxx" + X, 4 - X)

So far okay.

The problem is the adding of an offset to a variable? X is the per cpu
offset?

Strings are not put into per cpu areas by the compiler so this example
here is not clear nor relevant to percpu issues.


Andi said a while back that the RELOC_HIDE macro exists because of
wrapping issues. http://lists.openwall.net/linux-kernel/2006/08/24/340.
That issue does not seem to be apply on x86 since signed and
unsigned additions are the same. Moreover zero based per cpu addresses
will avoid wrapping entirely.

Could we clearly document what the point of RELOC_HIDE is?

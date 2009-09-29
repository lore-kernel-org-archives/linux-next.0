From: "Jan Beulich" <jbeulich@novell.com>
Subject: Re: linux-next: tree build failure
Date: Tue, 29 Sep 2009 10:28:36 +0100
Message-ID: <4AC1E15502000078000516B5@vpn.id2.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753886AbZI2J2i@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, hollisb@us.ibm.com
Cc: akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

>>> Hollis Blanchard  09/29/09 2:00 AM >>>
>First, I think there is a real bug here, and the code should read like
>this (to match the comment):
>    /* type has to be known at build time for optimization */
>-    BUILD_BUG_ON(__builtin_constant_p(type));
>+    BUILD_BUG_ON(!__builtin_constant_p(type));
>
>However, I get the same build error *both* ways, i.e.
>__builtin_constant_p(type) evaluates to both 0 and 1? Either that, or
>the new BUILD_BUG_ON() macro isn't working...

No, at this point of the compilation process it's neither zero nor one,
it's simply considered non-constant by the compiler at that stage
(this builtin is used for optimization, not during parsing, and the
error gets generated when the body of the function gets parsed,
not when code gets generated from it).

Jan

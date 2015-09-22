From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Tue, 22 Sep 2015 16:27:51 +0300
Message-ID: <20150922132751.GB17969@node.dhcp.inet.fi>
References: <5023113A-80F3-4C3A-AF50-6B08134A070F@axis.com>
 <201509221250.t8MCoJLP014241@ignucius.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:34094 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933206AbbIVN1z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Sep 2015 09:27:55 -0400
Received: by wicfx3 with SMTP id fx3so192116407wic.1
        for <linux-next@vger.kernel.org>; Tue, 22 Sep 2015 06:27:53 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <201509221250.t8MCoJLP014241@ignucius.se.axis.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com, Hans-Peter Nilsson <hans-peter.nilsson@axis.com>
Cc: starvik@axis.com, linux@roeck-us.net, jespern@axis.com, hughd@google.com, kirill.shutemov@linux.intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, minchan@kernel.org, linux-cris-kernel@axis.com

On Tue, Sep 22, 2015 at 02:50:19PM +0200, Hans-Peter Nilsson wrote:
> > From: Mikael Starvik <mikael.starvik@axis.com>
> > Date: Tue, 22 Sep 2015 14:19:38 +0200
> 
> > For cris it is completely valid to do that.
> 
> Correct, just as it's completely valid for any system to specify
> an ABI that says that structures are laid out "packed" by
> default.
> 
> > It has been an
> > issue before. If you for some reason really require dword
> > alignment there should be an align in the struct.
> 
> Yep.
> 
> > CC:ing the compiler guy for further comments.
> 
> I have no new information.
> 
> > > 22 sep 2015 kl. 14:03 skrev Kirill A. Shutemov <kirill@shutemov.name>:
> 
> > > Kinda. It's false positive PageTail() due low bit set in
> > > page->rcu_head.next.
> > > 
> > > It happens (at least) due broken alignment of 'rcu' field within
> > > task_struct -- offsetof(struct task_struct, rcu): 773.
> > > 
> > > That's looks veery broken. I would guess compiler does something horribly
> > > wrong. I hope it's not an ABI issue. :-/
> 
> It is an ABI issue, but I'm sure you can cope.  If you need to
> imply something you have to provide something.  If not, I'd say
> the term "horrible" would fit hackish assumptions of the failing
> code (and related code that works by happenstance).
> 
> That element (the struct) needs *explicit* padding or alignment
> to the required multiplicity of bytes for anyone to portably be
> able to imply something other than "byte alignment" for the
> layout of it, as elements of an array, across systems.  Use
> dummy elements or a compiler construct like __attribute__
> ((__aligned__ (...))) per kernel policy or taste.  I'd recommend
> specifying the alignment, so TRT will happen for it when it in
> turn is an element of an otherwise unpadded struct.
> 
> (I assume all applicable allocators provide "natural" alignment
> of, say, sizeof (long)) or that'll be a separate issue.)

I see. I would say it's very risky ABI choice, but okay.

What was the reason behind? I don't understand it.
Is it free to make misaligned memory access on CRIS?
What about atomicity? How it works for misaligned accesses?

The patch below fixes issue for me.

I'm not sure if we want to ask for alignment to sizeof(long).
aligned(2) works too.

Paul, any thoughts?

diff --git a/include/linux/types.h b/include/linux/types.h
index c314989d9158..ead18bdcaf70 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -209,7 +209,7 @@ struct ustat {
 struct callback_head {
        struct callback_head *next;
        void (*func)(struct callback_head *head);
-};
+}  __attribute__((aligned(sizeof(long))));
 #define rcu_head callback_head
 
 typedef void (*rcu_callback_t)(struct rcu_head *head);
-- 
 Kirill A. Shutemov

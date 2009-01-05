From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: manual merge of the rr tree
Date: Mon, 5 Jan 2009 09:29:28 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0901050915180.13193@quilx.com>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au>
 <200901051727.11403.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi053.sbcis.sbc.com ([207.115.36.82]:34883 "EHLO
	nlpi053.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752011AbZAEP3x (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Jan 2009 10:29:53 -0500
In-Reply-To: <200901051727.11403.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

On Mon, 5 Jan 2009, Rusty Russell wrote:

> 3) We do still need RELOC_HIDE: it's for the compiler, not us.  It
>    can otherwise make assumptions about pointers remaining within objects.

Never heard about that one. If the compiler would make the assumption that
pointers stay within a struct then the processor could hold data from
another per cpu section in registers while writing to the per cpu variable
of that per cpu section right?

But doesnt GCC invalidate all object pointers to a certain type of struct
if one field is modified?

And how will this work in cases where the pointer value is converted to
unsigned long?

From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Tue, 6 Jan 2009 11:34:48 +1030
Message-ID: <200901061134.49369.rusty@rustcorp.com.au>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901051727.11403.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901050915180.13193@quilx.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42238 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750878AbZAFBEz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 20:04:55 -0500
In-Reply-To: <Pine.LNX.4.64.0901050915180.13193@quilx.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>

On Tuesday 06 January 2009 01:59:28 Christoph Lameter wrote:
> On Mon, 5 Jan 2009, Rusty Russell wrote:
> 
> > 3) We do still need RELOC_HIDE: it's for the compiler, not us.  It
> >    can otherwise make assumptions about pointers remaining within objects.
> 
> Never heard about that one. If the compiler would make the assumption that
> pointers stay within a struct then the processor could hold data from
> another per cpu section in registers while writing to the per cpu variable
> of that per cpu section right?
> 
> But doesnt GCC invalidate all object pointers to a certain type of struct
> if one field is modified?

It was a Richard Henderson thing.  It was over six years ago, but I found
one decent reference to it:

	http://lwn.net/2002/0214/a/per-cpu.php3

Hope that answers your question?
Rusty.

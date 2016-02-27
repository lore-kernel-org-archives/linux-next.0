From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] x86, pkeys: fix siginfo ABI breakage from new field
Date: Sat, 27 Feb 2016 12:41:55 +0100
Message-ID: <20160227114154.GA16200@gmail.com>
References: <20160226173427.54A6949F@viggo.jf.intel.com>
 <6C5C3B9B-CAD6-4010-9A3E-AFFF7E13FAE3@zytor.com>
 <20160227091013.6e0606d1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36539 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756185AbcB0LmA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 27 Feb 2016 06:42:00 -0500
Content-Disposition: inline
In-Reply-To: <20160227091013.6e0606d1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Dave Hansen <dave@sr71.net>, linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi,
> 
> On Fri, 26 Feb 2016 09:44:00 -0800 "H. Peter Anvin" <hpa@zytor.com> wrote:
> >
> > 
> > __u64 is okay, "unsigned long" is really messy in the presence of 32-on-64 bit ABIs...
> 
> Yeah, but unfortunately, any 64 bit scalar type here will change the
> alignment of the enclosing unions on (some) 32 bit platforms and thus
> break the ABI.

Then a different solution has to be found.

Thanks,

	Ingo

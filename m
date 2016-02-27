From: Dave Hansen <dave@sr71.net>
Subject: Re: [PATCH] x86, pkeys: fix siginfo ABI breakage from new field
Date: Sat, 27 Feb 2016 11:16:44 -0800
Message-ID: <56D1F61C.5050308@sr71.net>
References: <20160226173427.54A6949F@viggo.jf.intel.com>
 <6C5C3B9B-CAD6-4010-9A3E-AFFF7E13FAE3@zytor.com>
 <20160227091013.6e0606d1@canb.auug.org.au> <20160227114154.GA16200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.sr71.net ([198.145.64.142]:39672 "EHLO blackbird.sr71.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751389AbcB0TQq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 27 Feb 2016 14:16:46 -0500
In-Reply-To: <20160227114154.GA16200@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de

On 02/27/2016 03:41 AM, Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > On Fri, 26 Feb 2016 09:44:00 -0800 "H. Peter Anvin" <hpa@zytor.com> wrote:
>>> > > __u64 is okay, "unsigned long" is really messy in the presence of 32-on-64 bit ABIs...
>> > 
>> > Yeah, but unfortunately, any 64 bit scalar type here will change the
>> > alignment of the enclosing unions on (some) 32 bit platforms and thus
>> > break the ABI.
> Then a different solution has to be found.

I've acked Stephen's initial patch changing the 'u64' to an 'int'.  x86
only needs 4 bits, and in the remote chance that a future implementation
needed more space, we could easily add a second 32-bit field "_pkey_hi"
or something that wouldn't have the alignment issues of a true 64-bit type.

How should we get Stephen's patch in to the tip tree?

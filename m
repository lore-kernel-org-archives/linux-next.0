From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] x86, pkeys: fix siginfo ABI breakage from new field
Date: Sat, 27 Feb 2016 09:10:13 +1100
Message-ID: <20160227091013.6e0606d1@canb.auug.org.au>
References: <20160226173427.54A6949F@viggo.jf.intel.com>
	<6C5C3B9B-CAD6-4010-9A3E-AFFF7E13FAE3@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51639 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752825AbcBZWKR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Feb 2016 17:10:17 -0500
In-Reply-To: <6C5C3B9B-CAD6-4010-9A3E-AFFF7E13FAE3@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dave Hansen <dave@sr71.net>, linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de

Hi,

On Fri, 26 Feb 2016 09:44:00 -0800 "H. Peter Anvin" <hpa@zytor.com> wrote:
>
> 
> __u64 is okay, "unsigned long" is really messy in the presence of 32-on-64 bit ABIs...

Yeah, but unfortunately, any 64 bit scalar type here will change the
alignment of the enclosing unions on (some) 32 bit platforms and thus
break the ABI.

-- 
Cheers,
Stephen Rothwell

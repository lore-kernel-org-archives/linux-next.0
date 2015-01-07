From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: livepatching tree for linux-next
Date: Wed, 7 Jan 2015 14:43:17 -0800
Message-ID: <20150107144317.61ab2080877a4d8227990551@linux-foundation.org>
References: <alpine.LNX.2.00.1412221412360.1680@pobox.suse.cz>
	<20141223094607.GA16445@infradead.org>
	<20141223151056.GA4789@treble.redhat.com>
	<20141226155613.36dd95b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141226155613.36dd95b9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, Josh Poimboeuf <jpoimboe@redhat.com>, Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 26 Dec 2014 15:56:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> OK, I have added this from today

My x86_64 allmodconfig broke.

In file included from include/linux/livepatch.h:29,
                 from kernel/livepatch/core.c:30:
./arch/x86/include/asm/livepatch.h:29:2: error: #error Your compiler must support -mfentry for live patching to work

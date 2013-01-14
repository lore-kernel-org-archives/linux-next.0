From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [next-20130114] Call-trace in LTP (lite) madvise02 test (block|mm|vfs
 related?)
Date: Mon, 14 Jan 2013 19:56:02 +0100
Message-ID: <50F454C2.6000509@kernel.dk>
References: <CA+icZUW1+BzWCfGkbBiekKO8b6KiyAiyXWAHFmVUey2dHnSTzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <CA+icZUW1+BzWCfGkbBiekKO8b6KiyAiyXWAHFmVUey2dHnSTzw@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
To: sedat.dilek@gmail.com
Cc: linux-next <linux-next@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On 2013-01-14 19:33, Sedat Dilek wrote:
> Hi,
> 
> while running LTP lite on my next-20130114 kernel I hit this
> call-trace (file attached).
> 
> Looks to me like problem in the block layer, but not sure.
> Might one of the experts have look at it?

Really? 600kb of data to look through? Can't you just paste the actual
error, I can't even find it...

-- 
Jens Axboe

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

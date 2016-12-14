From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Wed, 14 Dec 2016 19:26:09 +1100
Message-ID: <20161214192609.36f6678c@canb.auug.org.au>
References: <20161214132828.1d128963@canb.auug.org.au>
        <20161214072411.GA1635@gmail.com>
        <bd5e8291-5ace-eb83-5b63-6af8957376bf@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bd5e8291-5ace-eb83-5b63-6af8957376bf@nod.at>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Weinberger <richard@nod.at>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Gstir <david@sigma-star.at>
List-Id: linux-next.vger.kernel.org

Hi Richard,

On Wed, 14 Dec 2016 09:05:10 +0100 Richard Weinberger <richard@nod.at> wrote:
>
> The commit comes via my UBIFS tree. But I never saw this warning, I'm testing with both gcc-4.8 and gcc-6.1.
> Let me investigate into that.
> 
> Does today's tip change some compiler flags?

Linus' tree commit

  a76bcf557ef4 ("Kbuild: enable -Wmaybe-uninitialized warning for "make W=1"")

was introduced between -rc4 and -rc5 so it is not in your tree.

-- 
Cheers,
Stephen Rothwell

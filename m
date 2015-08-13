From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the tip tree
Date: Thu, 13 Aug 2015 08:34:33 -0700
Message-ID: <20150813153433.GA1749@kroah.com>
References: <20150813145535.6db96f9f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150813145535.6db96f9f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 13, 2015 at 02:55:35PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/ozwpan/ozproto.c
> 
> between commit:
> 
>   5a447f09a8df ("staging: ozwpan: Fix hrtimer wreckage")
> 
> from the tip tree and commit:
> 
>   a73e99cb67e7 ("staging: ozwpan: Remove from tree")
> 
> from the staging tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as necessary
> (no action is required).

Sounds good to me, thanks.

greg k-h

From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Nov 14
Date: Tue, 13 Nov 2012 21:53:45 -0800
Message-ID: <20121113215345.680e1f8e.akpm@linux-foundation.org>
References: <20121114163042.64f0c0495663331b9c2d60d6@canb.auug.org.au>
	<20121113213742.292f3ace.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121113213742.292f3ace.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Hugh Dickins <hughd@google.com>
List-Id: linux-next.vger.kernel.org

On Tue, 13 Nov 2012 21:37:42 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:

> It would help if the old sched/numa code wasn't in -next while you're
> away.

Now I think about it, that's going to be hard.  If I integrate against
tomorrow's -next, the mmotm patches will be against next+schednuma. 
Then you'll need to unintegrate them - effectively redo them against
mainline.

That won't be toooo hard, but there are some tricky bits.  Is there a way
I can extract a schednuma-free -next tomorrow?  That way I can do the wrangling.

This thing really has been a pain ;(  I've been uncharacteristically
patient!

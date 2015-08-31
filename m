From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: bad base of the h8300 tree
Date: Tue, 1 Sep 2015 07:40:33 +1000
Message-ID: <20150901074033.4282c9c4@canb.auug.org.au>
References: <20150831074304.0ce16f9f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150831074304.0ce16f9f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Yoshinori,

On Mon, 31 Aug 2015 07:43:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> The h8300 tree today has been based on linux-next.  This cannto work.
> Please rebase this onto Linus' tree (or some other stable base).
> 
> I cannot use your tree in this state, so it will be dropped from
> linux-next until it is fixed.  Also, Linus cannot pull it in this state.

And now your tree conatins lots and lots of very old commits that do
not even have Signed-off-by tags :-(.  The version I have been using
has a HEAD of commit:

99bcfda85f66 "Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time""

(which, it turns out" also has no Signed-off-by :-()

Maybe you should reset your tree to that and try to move on from there.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the arm64 tree
Date: Fri, 31 Mar 2017 22:24:58 +1100
Message-ID: <20170331222458.45534c5c@canb.auug.org.au>
References: <20170331140217.3c0fc28f@canb.auug.org.au>
        <CAK8P3a0nSKFrp7n3CDvh29vYUiH+4mmHr5jnTv4UgchBnpqvpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a0nSKFrp7n3CDvh29vYUiH+4mmHr5jnTv4UgchBnpqvpg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Arnd,

On Fri, 31 Mar 2017 11:32:54 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>
> Mark Brown's build bot now reports this build failure:
> 
>         arm64-defconfig
> ../arch/arm64/include/asm/bug.h:62:29: error: implicit declaration of
> function '_BUG_FLAGS' [-Werror=implicit-function-declaration]
> 
> I think the last line needs s/_BUG_FLAGS/__BUG_FLAGS/
> aside from that, the merge looks right to me, but I wonder if
> there is a way to prevent the conflict from showing up later
> for Linus.

Yeah, I have fixed that for Monday.  I just presume that Linus will not
be half blind when he fixes it up. :-)

Or someone could remember to mention it to him. ;-)
-- 
Cheers,
Stephen Rothwell

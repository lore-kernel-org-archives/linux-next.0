From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next x86 build fixes
Date: Thu, 15 Dec 2016 07:41:51 +1100
Message-ID: <20161215074151.2412ddb8@canb.auug.org.au>
References: <CAB=NE6XSPhQsjXNPhfuUjjHruBvxt-EF5q4N_Lu2ndz5Uo7_qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAB=NE6XSPhQsjXNPhfuUjjHruBvxt-EF5q4N_Lu2ndz5Uo7_qQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, linux-next@vger.kernel.org, X86 ML <x86@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Adam Borowski <kilobyte@angband.pl>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Luis,

On Wed, 14 Dec 2016 11:17:25 -0600 "Luis R. Rodriguez" <mcgrof@do-not-panic.com> wrote:
>
> Curious if the x86 symbol build issues are supposed to be resolved
> already on linux-next as of today, if not, how's it looking to get
> this fixed ? I am carrying around Adam's temporary patch "kbuild:
> provide include/asm/asm-prototypes.h for x86" on top of linux-next but
> each day I move on I keep seeing this is still not fixed and keep
> having to carry it. Curious what the delays are to get this resolved,
> the last thread I saw seemed to acknowledge the issue and that Nick
> was working on a fix ?

That commit will be in linux-next today (it was added to the kbuild
tree last night (my time)).

-- 
Cheers,
Stephen Rothwell

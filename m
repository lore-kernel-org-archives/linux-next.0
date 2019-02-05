From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: linux-next: Fixes tag needs some work in the origin tree
Date: Tue, 05 Feb 2019 10:47:43 -0800 (PST)
Message-ID: <mhng-d27cd6f4-522a-4666-a046-1803f6ee37c9@palmer-si-x1c4>
References: <20190203083310.12b97619@canb.auug.org.au>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190203083310.12b97619@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: schwab@suse.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Sat, 02 Feb 2019 13:33:10 PST (-0800), Stephen Rothwell wrote:
> [Just a reminder for the future.]
>
> Hi all,
>
> In commit
>
>   2bb10639f12c ("RISC-V: fix bad use of of_node_put")
>
> Fixes tag
>
>   Fixes: 94f9bf118f ("RISC-V: Fix of_node_* refcount")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Thanks.  Is there a script I should be running to pre-check these?

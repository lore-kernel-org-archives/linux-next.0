From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Dec 1
Date: Fri, 2 Dec 2016 07:23:02 +1100
Message-ID: <20161202072302.3b127688@canb.auug.org.au>
References: <20161201174235.21689436@canb.auug.org.au>
        <c8120142-ec74-c866-f1b2-cafc3d109574@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8120142-ec74-c866-f1b2-cafc3d109574@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Michal Marek <mmarek@suse.cz>
List-Id: linux-next.vger.kernel.org

Hi Randy,

On Thu, 1 Dec 2016 12:17:30 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
>
> on i386:
> 
> WARNING: EXPORT symbol "__sw_hweight32" [arch/x86/lib/built-in.ko] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "___preempt_schedule" [arch/x86/entry/built-in.ko] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "___preempt_schedule" [arch/x86/built-in.ko] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "___preempt_schedule" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__put_user_2" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__get_user_2" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__put_user_1" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__get_user_1" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__sw_hweight32" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "empty_zero_page" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__put_user_8" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__put_user_4" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__get_user_4" [vmlinux] version generation failed, symbol will not be versioned.
> 
> Do I have a tools problem?

No, these are existing problems that are now complained about.  Nick
Piggin hopes to get rid of these warnings for 3.10.

-- 
Cheers,
Stephen Rothwell

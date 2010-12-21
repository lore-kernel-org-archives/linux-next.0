From: Nick Piggin <npiggin@kernel.dk>
Subject: Re: systemd failing with vfs-scale-working patch-set
Date: Tue, 21 Dec 2010 15:57:13 +1100
Message-ID: <20101221045713.GA3189@amd>
References: <AANLkTiku116GCiLJcEa9KcQeLJq+LM8qsBJZdMC7iCrO@mail.gmail.com>
 <AANLkTikabyDocBhHLjBjewkrFfyQLUdSqHiRDRw4q4s9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikabyDocBhHLjBjewkrFfyQLUdSqHiRDRw4q4s9@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: sedat.dilek@gmail.com
Cc: Nick Piggin <npiggin@kernel.dk>, systemd-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, eparis@redhat.com
List-Id: linux-next.vger.kernel.org

On Mon, Dec 20, 2010 at 10:07:14PM +0100, Sedat Dilek wrote:
> Hi Nick,
> 
> after upgrading my toolchain and kernel-buildsystem I found some time
> spending in getting some more infos on the systemd w/ vfs-scale
> problem.
> Eric reported in [1] same problems as I have seen.
> 
> My systemd is now v15+git20101210.8a9ef77 and Linux kernel is:
> 
> # cat /proc/version
> Linux version 2.6.37-rc6-686 (Debian
> 2.6.37~rc6-5~next20101220.dileks.1) (sedat.dilek@gmail.com) (gcc
> version 4.5.2 (Debian 4.5.2-1) ) #1 SMP Mon Dec 20 19:03:29 CET 2010
> 
> I could take some new pics [2].
> 
> [3] shows a kernel NULL pointer dereference (dmesg command in
> kdb-console), but the address is not displayed, might be I need to set
> some additional kernel-debug-options.
> 
> [4] shows the output of "btp 4" (backtrace PID #4 from kdb-console),
> see also in [3] "*pde = 00000000" (8 zeroes) shows <4> (PID #4) at the
> beginning of the line.
> 
> I have also a "btp 1" (systemd has PID #1).
> 
> Hope this helps to narrow down the problem.
> If you need additional informations or (disasm-ed) files, please let me know.
> 
> Some pics are doubled, sorry for the bad quality, I won't be a surgery
> (need a calm hand, turned off auto-flash of my digicam is the real
> cause I guess ;-)).

Thanks to you both for testing and reporting this. The important part is
NULL instruction pointer at dput.

I have a patch to set various d_flags according to what d_op functions
have been defined. This allows branch and cacheline load reduction in
common cases in fastpaths. However those flags were set but not cleared,
not expecting d_ops to be switched on active dentries.

cgroups filesystem actually switches from simple dentry ops to its own
one, when turning from a negative to positive dentry. That's possibly OK
technically (although I didn't consider all races), but AFAIKS it is not
something that a filesystem is allowed to "know".

I'll submit a patch to fix cgroups, and a bugcheck to catch such things
again.

Thanks,
Nick


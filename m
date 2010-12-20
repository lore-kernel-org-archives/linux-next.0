From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: systemd failing with vfs-scale-working patch-set
Date: Mon, 20 Dec 2010 22:07:14 +0100
Message-ID: <AANLkTikabyDocBhHLjBjewkrFfyQLUdSqHiRDRw4q4s9@mail.gmail.com>
References: <AANLkTiku116GCiLJcEa9KcQeLJq+LM8qsBJZdMC7iCrO@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <systemd-devel-bounces+gcssd-systemd-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <AANLkTiku116GCiLJcEa9KcQeLJq+LM8qsBJZdMC7iCrO@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/systemd-devel>,
	<mailto:systemd-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/systemd-devel>
List-Post: <mailto:systemd-devel@lists.freedesktop.org>
List-Help: <mailto:systemd-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/systemd-devel>,
	<mailto:systemd-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: systemd-devel-bounces+gcssd-systemd-devel=m.gmane.org@lists.freedesktop.org
Errors-To: systemd-devel-bounces+gcssd-systemd-devel=m.gmane.org@lists.freedesktop.org
To: Nick Piggin <npiggin@kernel.dk>
Cc: linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, systemd-devel@lists.freedesktop.org, eparis@redhat.com
List-Id: linux-next.vger.kernel.org

Hi Nick,

after upgrading my toolchain and kernel-buildsystem I found some time
spending in getting some more infos on the systemd w/ vfs-scale
problem.
Eric reported in [1] same problems as I have seen.

My systemd is now v15+git20101210.8a9ef77 and Linux kernel is:

# cat /proc/version
Linux version 2.6.37-rc6-686 (Debian
2.6.37~rc6-5~next20101220.dileks.1) (sedat.dilek@gmail.com) (gcc
version 4.5.2 (Debian 4.5.2-1) ) #1 SMP Mon Dec 20 19:03:29 CET 2010

I could take some new pics [2].

[3] shows a kernel NULL pointer dereference (dmesg command in
kdb-console), but the address is not displayed, might be I need to set
some additional kernel-debug-options.

[4] shows the output of "btp 4" (backtrace PID #4 from kdb-console),
see also in [3] "*pde = 00000000" (8 zeroes) shows <4> (PID #4) at the
beginning of the line.

I have also a "btp 1" (systemd has PID #1).

Hope this helps to narrow down the problem.
If you need additional informations or (disasm-ed) files, please let me know.

Some pics are doubled, sorry for the bad quality, I won't be a surgery
(need a calm hand, turned off auto-flash of my digicam is the real
cause I guess ;-)).

Regards,
- Sedat -


[1] http://marc.info/?l=linux-fsdevel&m=129287321819101&w=2
[2] http://files.iniza.org/for_npiggin/2010-12-20/
[3] http://files.iniza.org/for_npiggin/2010-12-20/DSCN2344.JPG
[4] http://files.iniza.org/for_npiggin/2010-12-20/DSCN2353.JPG

From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: sysctl tree build failure
Date: Thu, 12 Nov 2009 00:08:59 -0800
Message-ID: <m1ljicp3l0.fsf@fess.ebiederm.org>
References: <20091112184805.1c0720cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752308AbZKLIJB@vger.kernel.org>
In-Reply-To: <20091112184805.1c0720cb.sfr@canb.auug.org.au> (Stephen Rothwell's message of "Thu\, 12 Nov 2009 18\:48\:05 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> Today's linux-next build (powerpc allnoconfig) failed like this:
>
> kernel/built-in.o: In function `get_sysctl':
> sysctl_binary.c:(.text+0x100d4): undefined reference to `dev_get_by_index'
>
> Caused by commit 26a7034b40ba80f82f64fa251a2cbf49f9971c6a ("sysctl:
> Reduce sys_sysctl to a compatibility wrapper around /proc/sys").
>
> CONFIG_NET is not set for this build.
>
> I have used this patch for today:
> (It does produce this warning, though:
>
> kernel/sysctl_binary.c:1253: warning: unused variable 'net'
>
> so needs more work.)

Thank you, and my apologies.  I thought I had tried it with every
applicable compile option but apparently not.

Ugh.  It looks like I have a small refcount leak in that case as
well.  Blind I was.

Thank you very I will have this fixed shortly.

Eric

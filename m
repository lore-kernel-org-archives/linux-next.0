From: CAI Qian <caiqian@redhat.com>
Subject: Re: kdump regression compared to v2.6.35
Date: Mon, 30 Aug 2010 06:24:28 -0400 (EDT)
Message-ID: <1633441528.1498131283163868227.JavaMail.root@zmail06.collab.prod.int.phx2.redhat.com>
References: <4C7B6C07.6010800@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4C7B6C07.6010800@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: torvalds@linux-foundation.org, linux-next@vger.kernel.org, kexec <kexec@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


----- "Tejun Heo" <tj@kernel.org> wrote:

> Hello,
> 
> On 08/30/2010 05:42 AM, CAI Qian wrote:
> >> Hmmm... I can't reproduce it here.  I wonder what the difference
> is.
> >> Can you please trigger sysrq-t after the boot is hung and post the
> >> result?
> > Sysrq keys did not work at this early stage of booting for me even
> > adding sysrq_always_enabled.
> 
> I see.  I'll prepare a debug patch which tries to catch long
> execution
> delays in workqueue but in the meantime can you please turn on
> hangcheck timer and see whether it triggers after the kernel hangs
> during boot?
Can't see any difference with hangcheck timer enabled.
> Thanks.
> 
> -- 
> tejun
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec

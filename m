From: Eric Paris <eparis@parisplace.org>
Subject: Re: [PATCH -next] cpufreq: provide cpufreq_get stub
Date: Tue, 6 Oct 2009 16:29:01 -0400
Message-ID: <7e0fb38c0910061329x54b90f8djb2db59ce6152c19e@mail.gmail.com>
References: <20091006165220.b5cb1c44.sfr@canb.auug.org.au>
	 <20091006110211.139b91e5.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933189AbZJFU3j@vger.kernel.org>
In-Reply-To: <20091006110211.139b91e5.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Avi Kivity <avi@redhat.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, cpufreq@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Oct 6, 2009 at 2:02 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> When CONFIG_CPU_FREQ is disabled, cpufreq_get() needs a stub.
> Used by kvm (although it looks like a bit of the kvm code could
> be omitted when CONFIG_CPU_FREQ is disabled).
>
> arch/x86/built-in.o: In function `kvm_arch_init':
> (.text+0x10de7): undefined reference to `cpufreq_get'
>
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

It does what it says it does and gives me a building kernel again.

Tested-by: Eric Paris <eparis@redhat.com>

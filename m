From: Avi Kivity <avi@redhat.com>
Subject: Re: [PATCH] kvm: fix irqfd build failure discovered in linux-next
Date: Thu, 21 May 2009 16:10:09 +0300
Message-ID: <4A1552B1.3040502@redhat.com>
References: <20090521172122.bb12027c.sfr@canb.auug.org.au> <20090521130426.22997.77787.stgit@dev.haskins.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <20090521130426.22997.77787.stgit@dev.haskins.net>
Sender: kvm-owner@vger.kernel.org
To: Gregory Haskins <ghaskins@novell.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Gregory Haskins wrote:
> Stephen Rothwell noted a build failure in arch != x86 in last nights
> linux-next tree, as noted here:
>
> http://lkml.org/lkml/2009/5/21/32
>
> This patch corrects the build issue by requiring explicit support for
> IRQFD to be defined, and only defining it on x86 (the only arch fully
> supported).  The code itself isnt architecture dependent, but we need
> to add a new file to each makefile, advertise the capability, and
> of course, test that it works for each supported arch.  We will submit
> patches against each relevant arch at a later time to enable support
> there as well.
>
> Signed-off-by: Gregory Haskins <ghaskins@novell.com>
> ---
>
>  arch/x86/kvm/Makefile    |    1 +
>  include/linux/kvm_host.h |   17 +++++++++++++++++
>  virt/kvm/eventfd.c       |    6 ++++++
>  virt/kvm/kvm_main.c      |    2 +-
>  4 files changed, 25 insertions(+), 1 deletions(-)
>
> diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
> index 01e3c61..e5ce95e 100644
> --- a/arch/x86/kvm/Makefile
> +++ b/arch/x86/kvm/Makefile
> @@ -1,5 +1,6 @@
>  
>  EXTRA_CFLAGS += -Ivirt/kvm -Iarch/x86/kvm
> +EXTRA_CFLAGS += -DKVM_HAVE_EVENTFD
>  
>   

The standard idiom for this is to use a Kconfig symbol; see for example 
HAVE_KVM_IRQCHIP in arch/*/kvm/Kconfig.


-- 
error compiling committee.c: too many arguments to function


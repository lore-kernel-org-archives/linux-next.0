From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm tree build failure
Date: Thu, 21 May 2009 10:32:27 +0300
Message-ID: <4A15038B.1090204@redhat.com>
References: <20090521172122.bb12027c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752624AbZEUHcs@vger.kernel.org>
In-Reply-To: <20090521172122.bb12027c.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory Haskins <ghaskins@novell.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell wrote:
> Hi Avi,
>
> Today's linux-next build (powerpc ppc44x_defconfig) failed like this:
>
> arch/powerpc/kvm/built-in.o: In function `kvm_destroy_vm':
> kvm_main.c:(.text+0x2cfc): undefined reference to `kvm_irqfd_release'
> arch/powerpc/kvm/built-in.o: In function `kvm_vm_ioctl':
> kvm_main.c:(.text+0x3230): undefined reference to `kvm_irqfd'
>
> Caused by commit 302471ec2b5b6f74eba06973fb85e4584d20ef1e ("KVM: irqfd")
> which I have reverted for today.
>   

Sorry about that.  I now have build testing for s390 and ia64, so of 
course it triggered on ppc.

I'll look for a ppc machine for build testing.

-- 
error compiling committee.c: too many arguments to function

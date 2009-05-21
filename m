From: Boaz Harrosh <bharrosh@panasas.com>
Subject: Re: linux-next: kvm tree build failure
Date: Thu, 21 May 2009 10:37:03 +0300
Message-ID: <4A15049F.8000707@panasas.com>
References: <20090521172122.bb12027c.sfr@canb.auug.org.au> <4A15038B.1090204@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:61879 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751549AbZEUHhI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2009 03:37:08 -0400
In-Reply-To: <4A15038B.1090204@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory Haskins <ghaskins@novell.com>

On 05/21/2009 10:32 AM, Avi Kivity wrote:
> Stephen Rothwell wrote:
>> Hi Avi,
>>
>> Today's linux-next build (powerpc ppc44x_defconfig) failed like this:
>>
>> arch/powerpc/kvm/built-in.o: In function `kvm_destroy_vm':
>> kvm_main.c:(.text+0x2cfc): undefined reference to `kvm_irqfd_release'
>> arch/powerpc/kvm/built-in.o: In function `kvm_vm_ioctl':
>> kvm_main.c:(.text+0x3230): undefined reference to `kvm_irqfd'
>>
>> Caused by commit 302471ec2b5b6f74eba06973fb85e4584d20ef1e ("KVM: irqfd")
>> which I have reverted for today.
>>   
> 
> Sorry about that.  I now have build testing for s390 and ia64, so of 
> course it triggered on ppc.
> 
> I'll look for a ppc machine for build testing.
> 

Can't you cross compile for ppc? I can't remember someone posted a link
with binary cross-compiler packages a while back.

Boaz

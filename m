From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 12 Oct 2016 14:30:36 -0700
Message-ID: <20161012143036.0a313028dd8174b4fff47787@linux-foundation.org>
References: <20161012134010.5d88d2c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:38319 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756034AbcJLVah (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Oct 2016 17:30:37 -0400
In-Reply-To: <20161012134010.5d88d2c8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>

On Wed, 12 Oct 2016 13:40:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from include/linux/list.h:8:0,
>                  from include/linux/kobject.h:20,
>                  from include/linux/device.h:17,
>                  from arch/powerpc/include/asm/io.h:27,
>                  from include/linux/kexec.h:17,
>                  from arch/powerpc/kernel/machine_kexec_64.c:13:
> arch/powerpc/kernel/machine_kexec_64.c: In function 'arch_kexec_kernel_image_probe':
> arch/powerpc/kernel/machine_kexec_64.c:420:29: error: 'kexec_file_loaders' undeclared (first use in this function)
>   for (i = 0; i < ARRAY_SIZE(kexec_file_loaders); i++) {
>                              ^
> arch/powerpc/kernel/machine_kexec_64.c: In function 'setup_purgatory':
> arch/powerpc/kernel/machine_kexec_64.c:568:27: error: 'SLAVE_CODE_SIZE' undeclared (first use in this function)
>   slave_code_buf = kmalloc(SLAVE_CODE_SIZE, GFP_KERNEL);
>                            ^
> arch/powerpc/kernel/machine_kexec_64.c: In function 'setup_new_fdt':
> arch/powerpc/kernel/machine_kexec_64.c:774:8: error: implicit declaration of function 'setup_ima_buffer' [-Werror=implicit-function-declaration]
>   ret = setup_ima_buffer(image, fdt, chosen_node);

Yes, these patches seem to have become broken.  They've had a hard life :(

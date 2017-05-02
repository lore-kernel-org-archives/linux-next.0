From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings
Date: Tue, 2 May 2017 21:21:10 +1000
Message-ID: <20170502212110.28f434f2@canb.auug.org.au>
References: <20170502160530.34b680b7@canb.auug.org.au>
        <878tmfega2.fsf@concordia.ellerman.id.au>
        <20170502211701.6e84c10e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54787 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750709AbdEBLVN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 May 2017 07:21:13 -0400
In-Reply-To: <20170502211701.6e84c10e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@ozlabs.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Michael,

On Tue, 2 May 2017 21:17:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Tue, 02 May 2017 19:53:25 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Though we are supposed to be building with -Werror, so those should be
> > breaking the build. I assume you have turned Werror off?  
> 
> I assume that allyesconfig turns on CONFIG_PPC_DISABLE_WERROR ...

Also, how many configs (if any) turn on CONFIG_KVM_BOOK3S_64_PR?

-- 
Cheers,
Stephen Rothwell

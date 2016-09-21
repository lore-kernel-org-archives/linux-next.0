From: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 20 Sep 2016 23:26:57 -0300
Message-ID: <2789631.bINkkb0RYT@hactar>
References: <20160920164414.4062bb0b@canb.auug.org.au> <20160920173012.1abe1d84@canb.auug.org.au> <87mvj2srvj.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57671 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754843AbcIUC1G (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Sep 2016 22:27:06 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8L2Mm2P107320
        for <linux-next@vger.kernel.org>; Tue, 20 Sep 2016 22:27:06 -0400
Received: from e24smtp05.br.ibm.com (e24smtp05.br.ibm.com [32.104.18.26])
        by mx0a-001b2d01.pphosted.com with ESMTP id 25jpef26qs-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 20 Sep 2016 22:27:05 -0400
Received: from localhost
        by e24smtp05.br.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <bauerman@linux.vnet.ibm.com>;
        Tue, 20 Sep 2016 23:27:02 -0300
In-Reply-To: <87mvj2srvj.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Am Dienstag, 20 September 2016, 22:00:32 schrieb Michael Ellerman:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > On Tue, 20 Sep 2016 16:44:14 +1000 Stephen Rothwell 
<sfr@canb.auug.org.au> wrote:
> >> After merging the akpm-current tree, today's linux-next build (powerpc
> >> ppc64_defconfig) failed like this:
> >> 
> >> powerpc-linux-gcc: error: unrecognized command line option '-m'
> >> scripts/Makefile.build:290: recipe for target
> >> 'arch/powerpc/purgatory/printf.o' failed
> >> 
> >> and a few more like that.
> > 
> > OK, this is (most likely) caused by the CONFIG_WORD_SIZE -> BITS change
> > interacting with the KEXEC_FILE changes. Tomorrow I will do a better
> > merge conflict resolution patch that fixes all those.
> 
> Ah yep looks like that's the problem, patch below should fix it?
> 
> I think I'd actually prefer it if purgatory didn't redefine the CFLAGS
> from scratch, so I'll see if Thiago can do that and send a new version.

I could move the purgatory inside arch/powerpc/boot and use its BOOTCFLAGS. 
The needs of the purgatory and the boot wrapper are very similar. Would that 
be better?
-- 
[]'s
Thiago Jung Bauermann
IBM Linux Technology Center

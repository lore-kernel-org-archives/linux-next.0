From: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 20 Sep 2016 22:12:07 -0300
Message-ID: <2398986.v4utNoeCOx@hactar>
References: <20160920164414.4062bb0b@canb.auug.org.au> <20160921091622.53067648@canb.auug.org.au> <87bmzirta5.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42505 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755187AbcIUBMQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Sep 2016 21:12:16 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8L18a6m040107
        for <linux-next@vger.kernel.org>; Tue, 20 Sep 2016 21:12:16 -0400
Received: from e24smtp03.br.ibm.com (e24smtp03.br.ibm.com [32.104.18.24])
        by mx0b-001b2d01.pphosted.com with ESMTP id 25jua9bxqd-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 20 Sep 2016 21:12:15 -0400
Received: from localhost
        by e24smtp03.br.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <bauerman@linux.vnet.ibm.com>;
        Tue, 20 Sep 2016 22:12:14 -0300
In-Reply-To: <87bmzirta5.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Am Mittwoch, 21 September 2016, 10:27:46 schrieb Michael Ellerman:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > On Tue, 20 Sep 2016 22:00:32 +1000 Michael Ellerman <mpe@ellerman.id.au> 
wrote:
> >> Ah yep looks like that's the problem, patch below should fix it?
> > 
> > Yeah, I am just going to (logically) run "sed
> > 's/CONFIG_WORD_SIZE/BITS/'"
> > over the tree during the merge of the apm-current tree today.
> > 
> >> I think I'd actually prefer it if purgatory didn't redefine the CFLAGS
> >> from scratch, so I'll see if Thiago can do that and send a new version.
> > 
> > That could be better, but there are still some additions of
> > CONFIG_WORD_SIZE elsewhere :-(
> 
> I don't see any others in yesterday's next?

This kbuild failure is one case:

https://lists.ozlabs.org/pipermail/linuxppc-dev/2016-September/148898.html

elf_util_64.o is only built if CONFIG_WORD_SIZE=64. This is affects the 
bisectabilty of many patches in the kexec_file_load series. Should I post a 
new version rebased on powerpc/next?

-- 
[]'s
Thiago Jung Bauermann
IBM Linux Technology Center

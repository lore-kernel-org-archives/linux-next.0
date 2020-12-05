Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE76C433FE
	for <linux-next@archiver.kernel.org>; Sat,  5 Dec 2020 05:20:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31E6922D2B
	for <linux-next@archiver.kernel.org>; Sat,  5 Dec 2020 05:20:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgLEFUE (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sat, 5 Dec 2020 00:20:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:57262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgLEFUE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 5 Dec 2020 00:20:04 -0500
Date:   Fri, 4 Dec 2020 21:19:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1607145563;
        bh=g89QweBKoaMnhghk9FmJWAmYTP2xcaWTmqJqp57zI50=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=1erlj0fzZ9Wo45XoIkw1uOxPGJy+kcVeO9NmXmai/qVA9E9mqn2xjLv0CGieGavfh
         DBo9dfdViMzs8DIgqXZ+xqcxMA2JR7Yxbg+3vVsXjQp/XZ4XsBtTcK10j9bg/vHT7O
         6v9tURcEfXIGij3HXI0zD/HPEi04Qt16sw2olUWA=
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Victor Chibotaru <tchibo@google.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
Message-Id: <20201204211923.a88aa12dc06b61780282dd1b@linux-foundation.org>
In-Reply-To: <20201204210000.660293c6@canb.auug.org.au>
References: <20201204210000.660293c6@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 4 Dec 2020 21:00:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the akpm tree, today's linux-next build (powerpc
> allyesconfig) produced warnings like this:
> 
> kernel/kcov.c:296:14: warning: conflicting types for built-in function '__sanitizer_cov_trace_switch'; expected 'void(long unsigned int,  void *)' [-Wbuiltin-declaration-mismatch]
>   296 | void notrace __sanitizer_cov_trace_switch(u64 val, u64 *cases)
>       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Odd.  clang wants that signature, according to
https://clang.llvm.org/docs/SanitizerCoverage.html.  But gcc seems to
want a different signature.  Beats me - best I can do is to cc various
likely culprits ;)

Which gcc version?  Did you recently update gcc?

> ld: warning: orphan section `.data..Lubsan_data177' from `arch/powerpc/oprofile/op_model_pa6t.o' being placed in section `.data..Lubsan_data177'
> 
> (lots of these latter ones)
> 
> I don't know what produced these, but it is in the akpm-current or
> akpm trees.


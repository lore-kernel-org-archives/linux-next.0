Return-Path: <SRS0=K3uQ=UU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F12CC43613
	for <linux-next@archiver.kernel.org>; Fri, 21 Jun 2019 00:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7334F2085A
	for <linux-next@archiver.kernel.org>; Fri, 21 Jun 2019 00:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561075661;
	bh=F0RJup2dvaTl58+4clVYeHCpyFz0GuLGSTYU0fqgXvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=rWx2KwIrdJhaBykuWPn9QyKyPRmCSsyM3PG/Ps7V++GSm+8t2gYoEj2Zy/ZL0thmf
	 QDfWAClSErqtoDWCqi68up0ko+zzkLqYBm8SxFmOoKsnCNn8Mbd8oYWAO43p3GRXTJ
	 G3eANXE778uWM14lik1L3mhoAbN4c11P0Ffv8dB0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfFUAHl (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 20 Jun 2019 20:07:41 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:42059 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfFUAHk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Jun 2019 20:07:40 -0400
Received: by mail-lf1-f52.google.com with SMTP id y13so3662978lfh.9
        for <linux-next@vger.kernel.org>; Thu, 20 Jun 2019 17:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2z2u574W9H71BioYVxLQ0ozgxvmOVS9ZyuXKTynCQ8I=;
        b=eOYdft4VCOo1FjwQ83dZ9VZGvR/D+h+ysV8dTzc6d3lCPpwPy4PFUttAcLDdDTNmtV
         5wENLEbsDTZAkJzA7xaOEBCxkFvMReHYVkdBdeUIC8ba/5mU9mSYbDhp9jGLS6WOz8nr
         P4fPq8bVR1aMtzI71pdeWLxLHYJHDCFgdOR4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2z2u574W9H71BioYVxLQ0ozgxvmOVS9ZyuXKTynCQ8I=;
        b=ig4ac/d0fA0xECbqBb7dINIv8xDGLfLjVIj5NQEIGtD1f1TR/gBwx9MiIYxUErMTMB
         qe3frR8rqT8Raznf/iDnRSIUgkpHfACUvIevooCZFy5tzg1OK98h/3ubEiPwcUvhQT7T
         2YhLnKGt12zYd/9kProEDnYcCuIwIlpf2omxXmIjPTMWqUiC8n2f148szpUw5V/jgrme
         O34pgnAErb3gqOrQDc25hIN5jsaoQPau4tnaP8Ohlom1NKxQ9TgBLvVIhokop0d3F7Lw
         uA49fNiK3rFlVlK/Ch7FtxJLLXHLsqVxMhrikhpQHPdeFPL99+kAbZWyvVDBzyrfDnpW
         7tYA==
X-Gm-Message-State: APjAAAXxIk8z0Dd9ouW3SHTq91h6WdDDACF0szWaVd4DKDfcawicMNkj
        238+K/WQ0KJfrS59VhCXbkw9hr+F2x4=
X-Google-Smtp-Source: APXvYqxgOBbC1dVH0kXLxrnKFi9G2orkv0ZUkN86BKeebNXKURC39o4im+guKXk14fowZ4N/RW+Gyg==
X-Received: by 2002:a19:2247:: with SMTP id i68mr65230586lfi.174.1561075658109;
        Thu, 20 Jun 2019 17:07:38 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id z12sm157454lfe.2.2019.06.20.17.07.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 17:07:36 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id m23so4284423lje.12
        for <linux-next@vger.kernel.org>; Thu, 20 Jun 2019 17:07:36 -0700 (PDT)
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr7451510ljm.180.1561075656161;
 Thu, 20 Jun 2019 17:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190522100808.66994f6b@canb.auug.org.au> <20190528114320.30637398@canb.auug.org.au>
 <20190621095907.4a6a50fa@canb.auug.org.au>
In-Reply-To: <20190621095907.4a6a50fa@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 20 Jun 2019 17:07:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=whVBjssws88tSeoVLG5o5ZWXQu=S7rv-0Hd3qt9=VYsTQ@mail.gmail.com>
Message-ID: <CAHk-=whVBjssws88tSeoVLG5o5ZWXQu=S7rv-0Hd3qt9=VYsTQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the scsi tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 20, 2019 at 4:59 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> At what point does it become worth while to do a back merge of v5.2-rc4
> (I think the last of the SPDX changes went into there) to take care of
> all these (rather than Linus having to edit each of these files himself
> during the merge window)?

For just trivial conflicts like this that have no code, I really would
prefer no backmerges.

That said, I would tend to trust the due diligence that Thomas, Greg &
co have done, and am wondering why the scsi tree ends up having
different SPDX results in the first place..

             Linus

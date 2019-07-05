Return-Path: <SRS0=eJvT=VC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD4CC5B57D
	for <linux-next@archiver.kernel.org>; Fri,  5 Jul 2019 22:32:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D511D2133F
	for <linux-next@archiver.kernel.org>; Fri,  5 Jul 2019 22:32:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.b="XBE4SDcA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfGEWcb (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 5 Jul 2019 18:32:31 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41546 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfGEWcb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jul 2019 18:32:31 -0400
Received: by mail-ot1-f66.google.com with SMTP id o101so10433507ota.8
        for <linux-next@vger.kernel.org>; Fri, 05 Jul 2019 15:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1wm0pw4O8jGrQBiDWGY1iI0LWQ3L51MTQbW4ZCjLQSg=;
        b=XBE4SDcAEoyDwNhulgwMtQTbrBG037H4PVtb7nFjbFfO2ZNN3pM/nd7NEiDXajAFdW
         TLFKn4/fILMTGTiYgco+0kEADRLiWR6qV1l7Jt9KrVk23UB+dGn9VZeuMt15OingZftG
         0qbCE9oI4nHFuHXjSBfgmZCrbqxHvK79C1hHZ8lo6ZSm13TyURqE9pB3FvoP9FZBK7px
         Pzr+ZC405VKPGBR2+d7wRb74aL0Rypv7pyUWdIkqlLs4pW6YR8g0RhG/YFfMoGmHxsit
         YNsAgMdgjZ2zn0HTOGzhE9tfNAQ0fQSh2rNWvjCGLLfhE+N2D7vYGs7MSu7wKz/AlHFC
         R4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1wm0pw4O8jGrQBiDWGY1iI0LWQ3L51MTQbW4ZCjLQSg=;
        b=FPKTQZ8reNKbr+XnluD8n2bDTuFvWBj45c0y0ITmst3um3dgIYzjufvFezXXH9LFUl
         ljRuo4cwySReBnsL8CJX1C72PHqNiHx3exDYGW0r+7xAttzBzZrdOUDCCJYTxIxdbC5c
         OcPzw2EIrO/XU8K3ppjTLck4ulFWvdjVqGkwoSnKivXCp2hHxs9S220GWFdw4XRXdROw
         dcq2DBx2vK4XCeB6CWVgYJgk2YEhIHZ+jY/3L6lZSnzFm/EGnpYoQoQeC8WMXkcy1LTu
         GY9azTZP71wiSeSiINo6CAt4N05qq2tSeOATvTc3KbCmgplWsyiRsaBREalq4w4S2a1b
         IETg==
X-Gm-Message-State: APjAAAX5nVfc4obmBnoEhGsOITHDwR97FoRIUfZKu6n5ZR/ynYBDYD0K
        oym07tx15lnt3fy2ycy1PobUXE768uABbMusQmRamA==
X-Google-Smtp-Source: APXvYqwGQbiNPwIE2byyxn0tHolot0gPU6NwuDBWiOyEImIrwg3SDFRjKvMGl+cUVDjhjAMM1pAdKSMDIUS/iPsAT8w=
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr4626247oto.207.1562365950689;
 Fri, 05 Jul 2019 15:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190705172025.46abf71e@canb.auug.org.au>
In-Reply-To: <20190705172025.46abf71e@canb.auug.org.au>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 5 Jul 2019 15:32:19 -0700
Message-ID: <CAPcyv4gU7TfBucm2WoAyUng8qaUQOxGu0PuuJNVd1u0m9Q_tQw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pankaj Gupta <pagupta@redhat.com>,
        Yuval Shaia <yuval.shaia@oracle.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jakub Staron <jstaron@google.com>,
        Cornelia Huck <cohuck@redhat.com>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 5, 2019 at 12:20 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the nvdimm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from <command-line>:32:
> ./usr/include/linux/virtio_pmem.h:19:2: error: unknown type name 'uint64_t'
>   uint64_t start;
>   ^~~~~~~~
> ./usr/include/linux/virtio_pmem.h:20:2: error: unknown type name 'uint64_t'
>   uint64_t size;
>   ^~~~~~~~

/me boggles at how this sat in 0day visible tree for a long while
without this report?

>
> Caused by commit
>
>   403b7f973855 ("virtio-pmem: Add virtio pmem driver")
>
> I have used the nvdimm tree from next-20190704 for today.

Thanks Stephen, sorry for the noise.

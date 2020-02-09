Return-Path: <SRS0=+b1C=35=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD13C2BA83
	for <linux-next@archiver.kernel.org>; Sun,  9 Feb 2020 23:48:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 450932083B
	for <linux-next@archiver.kernel.org>; Sun,  9 Feb 2020 23:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581292123;
	bh=DKspgpYP4vrYVmDoryQ0kZqHxE9kAnC5rXDeYgqQ1PY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=kcXX7JcNarX1OUxc/czGzDEIB8zRUtYnxzc7BnjVKmWH3LROuU1uyRg3lGIq5usNp
	 y/6bDi7CqxcM1Vj2s8stAeILyj52MKSO6PS7OHxU18kuI43JBHaAPUqX5yGPgE98Rt
	 8zanBs6VQ2Uhn9UD8+P76x7/PuDshxlUUksXKiuM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgBIXsl (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 9 Feb 2020 18:48:41 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46393 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgBIXsl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Feb 2020 18:48:41 -0500
Received: by mail-lf1-f67.google.com with SMTP id z26so2845097lfg.13
        for <linux-next@vger.kernel.org>; Sun, 09 Feb 2020 15:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7qvl6TOYvLiKT8J0iO19pvnc3/hyeywMYYkZ/FlpkFQ=;
        b=OLTJtcXRacKws8QoDAKx/glLSqSXdvT1W+hLkXz2TVjhZjFEBccZqQXpw/casFjlBE
         iTo1DCzs7kEHyUFH0Ibq2XG9uME+DWZNKtUqZGgvTdC/D1kh5FNAkB4j7Sg9WSr7u4TG
         cCHLZqFU2QwM/4yvL0wLS1FTQi3aoc3XJVTBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7qvl6TOYvLiKT8J0iO19pvnc3/hyeywMYYkZ/FlpkFQ=;
        b=a/NHEA+IpSD1OwM2tqii9olQsHCJOLtgOq8BZIolVRqa9DMpX/DLMp/NYpoNHOHuzK
         yz9m8kJdluK1V+uzw1fMRLMQ+vq3mBl25u/incsb2XJHJ0UDXIx1BmnquqICWiMy7vcT
         Vh7zKffiI30Aor/sa/ktqAb0YeEM9+5CYtupbqkKWYwQX7XxpzSLCJf7ZFxyWpBR8of0
         boRkEZQA8zNKBVPxR25fWKUodldvhl9wTgelpJmf+5iq4K26695NRTdLVK1CYCznrp+V
         qcbSlSAzAFbtPyLuXwHGXsZMx02wTGjxn7ilPsLWMSdUGjQ6ffNHfhCjWhBXuRrQ9ZWz
         y4TA==
X-Gm-Message-State: APjAAAVxW5ucy43TfXH20OoTaiW67wBxM80CHX7ZpmDfFM3Eq9YI5cVn
        TsWQyAHRAzky1ixnQE7omtgIaLxxbBg=
X-Google-Smtp-Source: APXvYqxIK9FQKstGKoqzcAqJV9MT8mcskZnu1i/tabMZ5jRhjegI5brjSIw6Lo4Hf5+gw1BlpWqcEQ==
X-Received: by 2002:a19:f80a:: with SMTP id a10mr4587674lff.107.1581292118333;
        Sun, 09 Feb 2020 15:48:38 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 14sm5258445ljj.32.2020.02.09.15.48.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2020 15:48:37 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id c23so2879766lfi.7
        for <linux-next@vger.kernel.org>; Sun, 09 Feb 2020 15:48:36 -0800 (PST)
X-Received: by 2002:a19:4849:: with SMTP id v70mr4737816lfa.30.1581292116618;
 Sun, 09 Feb 2020 15:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20200210080821.691261a8@canb.auug.org.au> <CAHk-=wiM9gSf=EifmenHZOccd16xvFgQyV=V=9jEHR7_h3b0JA@mail.gmail.com>
 <20200209225735.3c2eacb6@why>
In-Reply-To: <20200209225735.3c2eacb6@why>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 9 Feb 2020 15:48:20 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiZqek8X3DzqP69--vm3cn9EMGNcuOtDStALMuMmuA7YA@mail.gmail.com>
Message-ID: <CAHk-=wiZqek8X3DzqP69--vm3cn9EMGNcuOtDStALMuMmuA7YA@mail.gmail.com>
Subject: Re: linux-next: build failure in Linus' tree
To:     Marc Zyngier <maz@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Feb 9, 2020 at 2:57 PM Marc Zyngier <maz@kernel.org> wrote:
>
> Do you mind applying the following patch on top? It fixes the breakage
> here.

Done. Added proper reported-by (and cc).

              Linus

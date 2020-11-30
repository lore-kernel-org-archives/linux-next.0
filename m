Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D2FC64E8A
	for <linux-next@archiver.kernel.org>; Mon, 30 Nov 2020 01:15:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AD3D20757
	for <linux-next@archiver.kernel.org>; Mon, 30 Nov 2020 01:15:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="VJyTZOT2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgK3BOz (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 29 Nov 2020 20:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgK3BOz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Nov 2020 20:14:55 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387B6C0613D2
        for <linux-next@vger.kernel.org>; Sun, 29 Nov 2020 17:14:15 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id o25so12562349oie.5
        for <linux-next@vger.kernel.org>; Sun, 29 Nov 2020 17:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ci5CHLJxKEcy3QWlP5ZvQNWjEsU1uJaTooeTMXCOkpM=;
        b=VJyTZOT2W29g9lbzViVerqyxYm7t7mekhgBqzEWmnluCOlHr2+wAAXF2oBjzVFQTdl
         IVfHGeqn6AgbopUWPbI3iiRViRmWoo0w5XHuKhWOnWIpdgV8DwxmpEpt39eMuiM/TYEo
         I38gNqc8yOFe2xA1nLldGR6sm272WxkmrazpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ci5CHLJxKEcy3QWlP5ZvQNWjEsU1uJaTooeTMXCOkpM=;
        b=gEpVJkNCFJAkbTMwBcL0hDUDEKEqaeoSyvsuNhNBT/E+LX9POo+2P1cWt/PLYY35G2
         5Up7vYCG00bSB1uNCvgAltvnqNkfMjHS5K2BPfYo6igcsUCD/xOLdAVtnD1zQO1OELCe
         YD/j2K9SZpfvW+Z8BYs4YbKylJGsfjCmV59CDtMW5dwk46sCCK9voBKVPsTaLk1TSV3w
         4KTlAOUOnbPUeQTKnwgxonF7ja8O2BBupfZcieOtSyJG/qgILMFkdHh4uHRygPMMHo+b
         e5n1yGV0UIAq6FNaxH6cMYgk8xuDm9p6SYARicXu3VHiUoR44Lh3yh7kLdxWshfvhedj
         HBaQ==
X-Gm-Message-State: AOAM530kiJaUBgiKUDMERkTZNPEaFsVAmPD+iKANyJ0H+JFF41By3T8X
        i4kBe1BUBLoEGoMf8YVkuhE1IdS/hgqpmwY635l+6A==
X-Google-Smtp-Source: ABdhPJymLyefZTD/4eV25dOV/S5KuIzuKplJyzh8FiRAmYTfgDr8hG8J+7cMZ8JYzSdefgfeq0Wd7eeQhUWW/l4oDB8=
X-Received: by 2002:aca:f3d6:: with SMTP id r205mr12752793oih.152.1606698854248;
 Sun, 29 Nov 2020 17:14:14 -0800 (PST)
MIME-Version: 1.0
References: <20201130115603.48e91a19@canb.auug.org.au>
In-Reply-To: <20201130115603.48e91a19@canb.auug.org.au>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Mon, 30 Nov 2020 01:14:03 +0000
Message-ID: <CAM9ZRVsq_VwYpuW70V7Dnfmqc7WXYcwsirGOo94B03Lp0uGyPQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the hwmon-staging tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 30 Nov 2020 at 00:56, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the hwmon-staging tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> drivers/hwmon/pwm-fan.c: In function 'pwm_fan_is_visible':
> drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx' [-Wunused-variable]
>   167 |  struct pwm_fan_ctx *ctx = (struct pwm_fan_ctx *)data;
>       |                      ^~~
>
> Introduced by commit
>
>   439ed83acc19 ("hwmon: (pwm-fan) Convert to hwmon_device_register_with_info API")
>

Ah yes. I removed the code that used ctx but forgot to remove the
assignment itself. I'm surprised it didn't generate a warning for me.

I can fix it up tomorrow and send a v3 patch series.

Thanks,

-- 
Paul Barker
Konsulko Group

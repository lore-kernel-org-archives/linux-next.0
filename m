Return-Path: <SRS0=APSk=VI=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7200FC74A36
	for <linux-next@archiver.kernel.org>; Thu, 11 Jul 2019 00:40:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 349BC21530
	for <linux-next@archiver.kernel.org>; Thu, 11 Jul 2019 00:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nPIq4MYp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfGKAko (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 10 Jul 2019 20:40:44 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44185 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727325AbfGKAko (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Jul 2019 20:40:44 -0400
Received: by mail-ot1-f68.google.com with SMTP id b7so4053652otl.11
        for <linux-next@vger.kernel.org>; Wed, 10 Jul 2019 17:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nRxHbQJUv2T55q/06mFxT6UHW4SoaZqc6/AtO2q+TCk=;
        b=nPIq4MYp1Jeuw8NeIRF96fBnbfWao+w3VanqHjwh6HMYJS1Ox5s6oZAQmLxPyDBB+f
         /tSbtuIBkpHACNM/zJONQqWHcQiZ7zyY47znCEghmf8w6VNXiCGGR++xrvzsu7ZfiKPA
         zDkps+El/aiJmWvi/1Gc0IHA8cC2osoN/shYv/dhYw2/m5TYiQvj++Bh4BOjxdK10S8E
         31z6ksbfHJLoMm+eGqIu0CM0skJ96UPr6vNf8kVPJ2koH63vxPewBCZzlWETXYc9Lz6g
         4F+Lg5P+z8Nvm36GLQJAQ7V59qiecO417qwhOGNGL8N9K1buGOFSMooYC9mpIs4Bfkmp
         cRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nRxHbQJUv2T55q/06mFxT6UHW4SoaZqc6/AtO2q+TCk=;
        b=ob64rdI3K0bpHM5Y4ehvFZ+i8VvP95lhkX375ckMwWeOsYeOk7W1793nKdvnbOzJg5
         cLlIq4AV3e8he3O4bRlM0sjNyTWGtEFxXLikp7ib7U4dWQUaXKF6DeUYja72F9/nuRja
         izxLyZBb0tv4mgvowxJgNMdJdicafLPYUYV2n/xKzF6/hn3Rvfp6vbJwecxBkKIo4Tsv
         aJLMXtjV8+fpztWq1IhitSPcHHad0TdijCbj/nfByU661sqc1UoE3hsXgdjzQ/My+0xd
         /i8M611EgQfotnHoMsLy4xYbwD9gkQlcDUGrGje/iJxnMpz5m1Gan5zTXH4oryWqT/lt
         SGnw==
X-Gm-Message-State: APjAAAUqzZ6R6XIqJClIIFg1lSCoP148eNqc/CFnLTe81JHKfZaWpltk
        wnPnSrZG99zyb847e6hjyFSwXJGjaaPlxp0zRGgyDQ==
X-Google-Smtp-Source: APXvYqxvyXf3j4ah2asatdlAdmPmxamClfiBWHPA0zmtMfnmPxGneAZKDvFGXKZ1Zh65bAQxTxz4A1zOC1eHrX/DxsE=
X-Received: by 2002:a05:6830:2010:: with SMTP id e16mr982366otp.344.1562805643578;
 Wed, 10 Jul 2019 17:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190711021344.774c81e2@canb.auug.org.au>
In-Reply-To: <20190711021344.774c81e2@canb.auug.org.au>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Thu, 11 Jul 2019 08:40:32 +0800
Message-ID: <CA+Px+wUFhqAP6G+5uaECc2dArVC6-ZUD6FUEL3D9WQ7-FMmzbg@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the sound-asoc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 11, 2019 at 12:13 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> In commit
>
>   6cd249cfad68 ("ASoC: max98357a: use mdelay for sdmode-delay")
>
> Fixes tag
>
>   Fixes: cec5b01f8f1c ("ASoC: max98357a: avoid speaker pop when playback
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over more than one line. Also, don't
> include blank lines among the tags.
I am sorry for this fault.

Mark, do you need me to resend the patch to fix the commit message?

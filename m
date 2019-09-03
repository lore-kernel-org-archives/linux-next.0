Return-Path: <SRS0=JzBx=W6=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C56C3A5A5
	for <linux-next@archiver.kernel.org>; Tue,  3 Sep 2019 06:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C3C522DBF
	for <linux-next@archiver.kernel.org>; Tue,  3 Sep 2019 06:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567492367;
	bh=5pUDqUn3TgYiTUnGByg+KbYtQYT6LJFcrhzjF3iBKBE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=EsoGJzqIDBkAS6lKTivpwsxF+qSvTujqRyY4kV565X3eCPTZxOmU5uyL1t+F0Kgy/
	 eLDUXmw0B5fH9D2XL2WyGG493DeO45aew2ZoIh2sEDfVHhkHs6E8Byzqm/ltCeOYTO
	 s19a91Yf1aTgnwPQdMxu1T9cATA2JW3a9dVr9hmo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbfICGcq (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 3 Sep 2019 02:32:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:42924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbfICGcq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Sep 2019 02:32:46 -0400
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51A1622DCC;
        Tue,  3 Sep 2019 06:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567492365;
        bh=5pUDqUn3TgYiTUnGByg+KbYtQYT6LJFcrhzjF3iBKBE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WfAfgqTvQCJFO0hzcBmgA47eZzHPWmvutpdxtRC1ijJdxUFt8m7wt7hU03ZvGSXL/
         zB1c5AWx9Gtc1irDDNnM+dYmnKdZ3RdYx60Sywj6XqwE8b+BvTDwPkefnEvJ3NlNH4
         N65PrDVhrjfmWWs5oez2EzVmZiFFimHUA22tG+R8=
Received: by mail-lj1-f170.google.com with SMTP id l1so14787012lji.12;
        Mon, 02 Sep 2019 23:32:45 -0700 (PDT)
X-Gm-Message-State: APjAAAWYujR84xEvT40F2PO/TOXvGSnSIrfkdwOUBBHO4C8dLXkH3MQn
        WF47gFdN2cL+lGkyXQFo7HnQZoFTdLl+IB9lp+U=
X-Google-Smtp-Source: APXvYqzQIWnkYmU1PasGV7zhiUkawW9cHgMoppzbSYTWX8V8UODx6+azFZsIkQPyQ3V8uF4wsRA1lPBdkpwEFct0cKQ=
X-Received: by 2002:a2e:8091:: with SMTP id i17mr11723605ljg.13.1567492363425;
 Mon, 02 Sep 2019 23:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190903153718.14b7a5e7@canb.auug.org.au>
In-Reply-To: <20190903153718.14b7a5e7@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 3 Sep 2019 08:32:32 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfokg493On43AJkx=YWz-6Tee8_G+Mha9cnLVeBvyb9mQ@mail.gmail.com>
Message-ID: <CAJKOXPfokg493On43AJkx=YWz-6Tee8_G+Mha9cnLVeBvyb9mQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 samsung-krzk tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Rob Herring <robh@kernel.org>
Cc:     Rob Herring <robherring2@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guillaume Gardet <guillaume.gardet@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 3 Sep 2019 at 07:37, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>   Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
>
> between commit:
>
>   5833f5a5daf3 ("dt-bindings: gpu: mali: Add Samsung exynos5250 compatible")
>
> from the samsung-krzk tree and commit:
>
>   553cedf60056 ("dt-bindings: Convert Arm Mali Midgard GPU to DT schema")
>
> from the devicetree tree.
>
> I fixed it up (I just removed the txt file, some fixup will be requide for
> the new yaml file) and can carry the fix as necessary. This is now fixed

Thanks Stephen.

Rob,
The conflict is non trivial. I could drop the patch, so Guillaume
could rebase his patch on top of next and send it again for inclusion
through your tree. Any other ideas?

The patch itself:
https://patchwork.kernel.org/patch/11123729/

Best regards,
Krzysztof

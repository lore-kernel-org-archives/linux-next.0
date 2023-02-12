Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AA1C636D3
	for <linux-next@archiver.kernel.org>; Sun, 12 Feb 2023 22:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjBLWgd (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 12 Feb 2023 17:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjBLWgd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Feb 2023 17:36:33 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F26977C
        for <linux-next@vger.kernel.org>; Sun, 12 Feb 2023 14:36:31 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id j18so529632vkd.4
        for <linux-next@vger.kernel.org>; Sun, 12 Feb 2023 14:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pefoley.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m5X+loVkekmWAtecIw7mDl3tfiILMPh5j36qJ91yzL4=;
        b=nWDmOYxr1N+J11/m5t6fG/l13wuHTyUtyzsLr4y9aoSA0Bg77CSGQFT8Feq3i5xRlg
         WtyTeruo4+DBnw1NxQ9juNfACIGUxmxeu3PEMx/jCZLc7zMCoLY1kyilssnfck+o44Q3
         8gglsGdXLoVUVECPJHKqCfb89v85alwG9Jb44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5X+loVkekmWAtecIw7mDl3tfiILMPh5j36qJ91yzL4=;
        b=U+yb3cs4LYhksUce0gVtZhJ7iGSQTotjKq1WDPfPZ2+m/gH3vpt8ez9z2c9YbJYV65
         JjX0XEqVI0KGlQ5doUiPxRY1onjXtYzbm0+qMil2FHQYary0uLpwtqGteR4PaonbLp2e
         GY2OBeJLTYAqbvKcXnQDnk1wZD2spdnbBlOf5W//btTB1a0WFZ0Rv3IsYtzITAfVWyq+
         n9beHN/f2HaOd0UWoetKO6tPMyEQYyYh7qonyfgrpenZ0hlH1ER6+fj2ACG3qdK3w9bT
         jlP3MnQXf4uijdIzx+tlB9xlBnujKkPoAV9xYIy28Wxl8UD5GwJCsiYtqqgJzS9cCzq1
         u0oA==
X-Gm-Message-State: AO0yUKVqqtWxM6XmaELny34uhhfJMSnz32xaDDYTkKNwnc7C6Y8tbIi1
        Ji+IoqU0K9x4arIZt7CX/aX+MNRWPuPO1A9wAGQpoA==
X-Google-Smtp-Source: AK7set9CT/bP6FdQMWLZJ9gvk3wqo+zOjk/BDlcennIWv05w/gqQD1hEwzOYOa+C5KiHIRp+6+1xwuRg+i2xZbNOZwQ=
X-Received: by 2002:a1f:1786:0:b0:401:7237:7c37 with SMTP id
 128-20020a1f1786000000b0040172377c37mr265318vkx.43.1676241390343; Sun, 12 Feb
 2023 14:36:30 -0800 (PST)
MIME-Version: 1.0
References: <20230213081128.0659dd4d@canb.auug.org.au> <317345605.121578.1676237317911.JavaMail.zimbra@nod.at>
In-Reply-To: <317345605.121578.1676237317911.JavaMail.zimbra@nod.at>
From:   Peter Foley <pefoley2@pefoley.com>
Date:   Sun, 12 Feb 2023 14:36:19 -0800
Message-ID: <CAOFdcFOA6DJ31K-HNx71Wr0ZEg+SK_ydw1vTjgjpd_-fOj8D6w@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the uml tree
To:     Richard Weinberger <richard@nod.at>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Feb 12, 2023 at 1:28 PM Richard Weinberger <richard@nod.at> wrote:
> Peter, am I allowed to add "Signed-off-by: Peter Foley <pefoley2@pefoley.com>"
> to these patches?
>

Yeah, I guess I forgot to pass --signoff to git commit :|
Sorry about that.
Please add the missing trailer and I'll fix my config.

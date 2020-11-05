Return-Path: <SRS0=PU4T=EL=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9CBC4742C
	for <linux-next@archiver.kernel.org>; Thu,  5 Nov 2020 07:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87D7021556
	for <linux-next@archiver.kernel.org>; Thu,  5 Nov 2020 07:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jWDP+uZ5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729344AbgKEHmj (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 5 Nov 2020 02:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKEHmi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2020 02:42:38 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38778C0613D2
        for <linux-next@vger.kernel.org>; Wed,  4 Nov 2020 23:42:37 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id y17so546003ilg.4
        for <linux-next@vger.kernel.org>; Wed, 04 Nov 2020 23:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nYMj5B8BWo15ebmoENTlqcynsEIrOZjxAZRIpqlTbSU=;
        b=jWDP+uZ5aMCArRjKUWiuzUDeO4W7UTgHgRHVPYrKxn84iQqpu+4VVfcLWK/FVWcFs5
         x5+FgtyNY+CZKSAUk+v4c3u2ChtI3JSX7MXfAMVK1P6/JuJg3M7JnRhJo7DuARGrt9Gw
         P4k6+RYCwizk2ngzotT1wePFy558j4bEBGh9fY2vGkUxB4oHoTyfsksD0NfWFeYlF/Bl
         HiiuUh2Fi804DIE4woUou0eYjX775uMWQ1XXADdxxueEyCgu1LoIYOO/zDElFt1d3pA4
         4BXLecg7J9XOtuSmjVl5o8fbCSrXc86WDBldPPn4m94tMK//xMMFmPLZmN/epmYyOfni
         zySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nYMj5B8BWo15ebmoENTlqcynsEIrOZjxAZRIpqlTbSU=;
        b=cZHdkbSQ6mXq/jQkGQNSnbgIXFtkwfuxuQaFotdgKlmaO/emUylZ6HJAoZMh7dg2l+
         /7KoCP9zrSaoNF1UvOQhViLaGxCr00Qqn9+nP5VQQcAIlUasHqeVvNaI+TLZDwCJlHtD
         TZSubr1jnASb1jmvHQ1Ajlm3QM/hes3/sOoFjhNPrRDJG39sIjqUZIYtk7IWUMrasWf1
         rYGUmseWnwULHwJTBqT/nGSxVf0vfmaRdivF3EZoaYAttms7gpFQhr+Atyu8dYY+uGye
         k+UfJsHL1U6RgDTHdxr22jipLwpPzgHcsfhQ0Bsqy6wixYMHP7W2Py+pysIea/rQXI1b
         +i5Q==
X-Gm-Message-State: AOAM533mWcZDAc26OniYuKEs6tzrW1L0QAOUEvaIy7lP2xKxSDD/ABU3
        54z2uSs8boqC9ExN/xjtl2PXZyRcBU+57CGJbeLOpQ==
X-Google-Smtp-Source: ABdhPJyzX/wKmtoUtsCGqqzwjNYIqH9qq7akEDy5XhDEeT1kYTNmS/HDC/6Wxy7Az2nUTAyawYgiBeKLctBi/MqNlFA=
X-Received: by 2002:a05:6e02:c:: with SMTP id h12mr982930ilr.177.1604562156197;
 Wed, 04 Nov 2020 23:42:36 -0800 (PST)
MIME-Version: 1.0
References: <20201105174549.614c2de4@canb.auug.org.au> <20201105070311.GU4879@kernel.org>
In-Reply-To: <20201105070311.GU4879@kernel.org>
From:   "Anand K. Mistry" <amistry@google.com>
Date:   Thu, 5 Nov 2020 18:42:23 +1100
Message-ID: <CAATStaMD=w+onf==L-=MQ7suJf6EaNoup5o8yW-TEbfajkbdaQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 5 Nov 2020 at 18:03, Mike Rapoport <rppt@kernel.org> wrote:
>
> On Thu, Nov 05, 2020 at 05:45:49PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the akpm-current tree, today's linux-next build (htmldocs)
> > produced this warning:
> >
> > Documentation/filesystems/proc.rst:296: WARNING: Malformed table.
> > Text in column margin in table line 61.
> >
> > ==========================  ===================================================
> > Field                       Content
> > ==========================  ===================================================
>   ...
> > Speculation_Store_Bypass    speculative store bypass mitigation status
> > Speculation_Indirect_Branch indirect branch speculation mode
>   ...
> > ==========================  ===================================================
> > Documentation/filesystems/proc.rst:234: WARNING: Error parsing content block for the "table" directive: exactly one table expected.
>
> Looks like left column became too wide, so rather than shift the right
> column to the right, I'd suggest to drop underscores in Speculation*.

Hm. That makes it inconsistent with Speculation_Store_Bypass. I guess
it's the lesser of two evils.

How would I go about fixing this? Send a new (v2), fixed patch to the
mailing list? I'm not that familiar with how patches get merged
through the branches.

>
> >
> > .. table:: Table 1-2: Contents of the status files (as of 4.19)
> >
> >  ==========================  ===================================================
> >  Field                       Content
> >  ==========================  ===================================================
>    ...
> >  Speculation_Store_Bypass    speculative store bypass mitigation status
> >  Speculation_Indirect_Branch indirect branch speculation mode
> >  Cpus_allowed                mask of CPUs on which this process may run
> >  Cpus_allowed_list           Same as previous, but in "list format"
> >  Mems_allowed                mask of memory nodes allowed to this process
> >  Mems_allowed_list           Same as previous, but in "list format"
> >  voluntary_ctxt_switches     number of voluntary context switches
> >  nonvoluntary_ctxt_switches  number of non voluntary context switches
> >  ==========================  ===================================================
>
> Same here.
>
> > Introduced by commit
> >
> >   60b492d745d5 ("proc: provide details on indirect branch speculation")
> >
> > --
> > Cheers,
> > Stephen Rothwell
>
>
>
> --
> Sincerely yours,
> Mike.



-- 
Anand K. Mistry
Software Engineer
Google Australia

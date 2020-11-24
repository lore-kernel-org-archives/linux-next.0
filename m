Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FE5C56201
	for <linux-next@archiver.kernel.org>; Tue, 24 Nov 2020 14:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6D202087D
	for <linux-next@archiver.kernel.org>; Tue, 24 Nov 2020 14:14:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BuHOigF/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731656AbgKXOOL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 24 Nov 2020 09:14:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730566AbgKXOOK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2020 09:14:10 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B24C0617A6
        for <linux-next@vger.kernel.org>; Tue, 24 Nov 2020 06:14:10 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id t143so23890135oif.10
        for <linux-next@vger.kernel.org>; Tue, 24 Nov 2020 06:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hz2P2WPL1KrEPUlVDM13R5/lRmiVmQvTmZ2t096gK7I=;
        b=BuHOigF/7Vdcojt/ZD/BdAjNsubYUWz1psl6JtgnuMzs+Pp3SNjgx7E+ANSgpkyJYC
         PO+5vvizSnDU0R+DMz5TSdxewBHKMxGVsipqgrML2jiNbgSaa00KjZbzCTNmo5RJ77hi
         iSzOilufJSPMP9cODFm48MGiVamh9X0VKcl5dAMyMShyxyeHQ8Qv3JIx2ea76CzGZpRU
         ijM8nRUp2vNiF7mHHBS//oT4wY4fvv505qVrQNTA8zjlI0i3ZKmT1YsEbdVwiDKJflwb
         4tr4hbNZKJAiTyfU9e+zS0jgOweMp3wOdTEp+dI9GDsig+q1zHpQMVEpv/CYhTxHRuwS
         EU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hz2P2WPL1KrEPUlVDM13R5/lRmiVmQvTmZ2t096gK7I=;
        b=SU1BoXH+TB40osteR4ZFwIjC6GwGSwr/9f8XduNeX2g/ojQ2dtx9lUAXi7amdJVypu
         TjhnTvPs58pWbC8/r/lq7hhhOLGf57f00Zm7RCT5h1sjW8HB0uWUan+B+yaO24p2ybBA
         2I729wxxobabXXCbK3vIHyhnC5qazE98hT33VVIv5KNkECPKWRree+BzALpkY/ZUKnjI
         1fO8/wsgNFmGagocMmNaSUT8FCMyty3loDF0pMDCGiSWgJh2Z48Dw8vZUgjVTdUhvXfV
         VbA+REG6q7gJYqG6zkD51C2R2l7vwzH5rBk26/OjpCFteQyW/YlIe3SBKWyWdvkAfqPy
         dZUg==
X-Gm-Message-State: AOAM533+1sLydrPJ+lUIN4PEzyZbCKvau7iuHyOd6dIOef3dVw344s32
        Dnmg3dO+WRdBcTSroG3mzBVyRA==
X-Google-Smtp-Source: ABdhPJy8NCNmgnxEIPdXXoQnpW4iEmbZkWduC2RmKNv+z7ymjReFm++owUrGvbEvIHTXNQd9ydO5oQ==
X-Received: by 2002:aca:3205:: with SMTP id y5mr2907934oiy.162.1606227249741;
        Tue, 24 Nov 2020 06:14:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u63sm9283170oia.50.2020.11.24.06.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 06:14:09 -0800 (PST)
Date:   Tue, 24 Nov 2020 08:14:07 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andy Gross <agross@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the qcom tree
Message-ID: <20201124141407.GA185852@builder.lan>
References: <20201124181938.11046212@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124181938.11046212@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue 24 Nov 01:19 CST 2020, Stephen Rothwell wrote:

> Hi all,
> 
> Commit
> 
>   872b41c9a255 ("arm64: dts: qcom: sort sm8150 usb_2 node")
> 
> is missing a Signed-off-by from its author.
> 

Thanks for spotting this Stephen! The mistake has been corrected.

Regards,
Bjorn

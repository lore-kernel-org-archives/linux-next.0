Return-Path: <SRS0=eeeA=2H=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52827C43603
	for <linux-next@archiver.kernel.org>; Tue, 17 Dec 2019 18:21:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D886206D7
	for <linux-next@archiver.kernel.org>; Tue, 17 Dec 2019 18:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576606882;
	bh=dzYMfl8JcI/Le0q1ov6KbWOivHM1vp0+ovdLbfnX6Qg=;
	h=To:Cc:From:Subject:Date:List-ID:From;
	b=ubpvTIh/g9AokZzGVU92Les4htx8xMGPUgSq/itQ5WkK4HrdQ2xOfPW4eMQhx6/4s
	 PgD28cl0AOkmpQpKy7+psDYrydi1s+z9WRffGqml33QYTFz8qs3lrMRDBkZOMHKqvO
	 XLkI3+L7x+C9SN/3Lecj/v2zjKE2G8Ujhcn92oAc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfLQSVV (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 17 Dec 2019 13:21:21 -0500
Received: from mail-il1-f169.google.com ([209.85.166.169]:33374 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbfLQSVV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Dec 2019 13:21:21 -0500
Received: by mail-il1-f169.google.com with SMTP id v15so1889668iln.0
        for <linux-next@vger.kernel.org>; Tue, 17 Dec 2019 10:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=dzYMfl8JcI/Le0q1ov6KbWOivHM1vp0+ovdLbfnX6Qg=;
        b=DzoztPmSYCCfT3AVRMMwrIKPCrqdDKB8UEywOiiTxY+ee/ya108w8N+9qzhBQ2oYPy
         9t7gTokKG5PyUIDszXQPlS2W5AujThaJG7dnAYlABijii/2aQXYEcN3oNMvO7ZTYg/h1
         2iZNNSw8soMNF3orGbYnVQH5aCKPKMx3a7VBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=dzYMfl8JcI/Le0q1ov6KbWOivHM1vp0+ovdLbfnX6Qg=;
        b=RufNfhKOWKk9gLJLShWkou9EDYZZ6bjAwlN4mK3vPwkA0q/ULMOjGIN1vRQEsuS0g4
         I10up+zSdHHHS+VV6ajLiUme61zTDxI7MrdumySFydwRwsX9ckPt51RpkpYRZ2m2S99I
         FqDBfcyHkGg8rZy+lex/ACNGtnevCztWJMe85CpGWqYYj/5aqiUTiRPzIfCyFYwrNgt6
         MmuvC2jDcnCFntHRexzdJ3eIVzHyF62QkdbWISSaxJLanokJDgSSiX5q7wgL4SvdDn+V
         ONLWCaL9/4V1fuX/UWN5RkKivUByfSXqQRqZlErklKbmhLeC7hLEFbGhiNZN21fhYObL
         EdIg==
X-Gm-Message-State: APjAAAWVU9ZX/UEzxWO/KBH/Q4kYzCJeTvEfsibFJ+iMSm+teVawguXl
        HbkfDz7dQBrM5Ttfo2ALoYWbW4ppQO3O9A==
X-Google-Smtp-Source: APXvYqy/KgqcGlzMqv5Ix8aQF0Ou+7fVtmE4Tpg4yaAd2LzN5G8wntPvmjlgQxeoQrC75sSPLGi0hQ==
X-Received: by 2002:a92:884e:: with SMTP id h75mr18238549ild.199.1576606880357;
        Tue, 17 Dec 2019 10:21:20 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id s10sm5417782iop.36.2019.12.17.10.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 10:21:19 -0800 (PST)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Subject: Request to add linux-kselftest kunit branch
Message-ID: <15fd4946-1f64-cb36-c74c-1126e070d93b@linuxfoundation.org>
Date:   Tue, 17 Dec 2019 11:21:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Please add the following linux-kselftest kunit branch to linux-next.

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=kunit

Please include Brendan Higgins on the CC list for any issues on
this branch.

thanks,
-- Shuah

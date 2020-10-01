Return-Path: <SRS0=GrK0=DI=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81A9C4727C
	for <linux-next@archiver.kernel.org>; Thu,  1 Oct 2020 15:09:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98EA520848
	for <linux-next@archiver.kernel.org>; Thu,  1 Oct 2020 15:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPF6PiHp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732213AbgJAPJs (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 1 Oct 2020 11:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732104AbgJAPJs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 11:09:48 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D08CC0613D0;
        Thu,  1 Oct 2020 08:09:47 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id n61so5712360ota.10;
        Thu, 01 Oct 2020 08:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U0g09Rah3LxrhZwTf9GoVSaA9gSyeX4AfpYye/uEAuE=;
        b=TPF6PiHp1EPgq+RTiUAONnQUVkmpLMm0etlXShlH8gVlzDJ6R4owjU5qZSDoS5vJwn
         qDzZMsHR1Al21VEn1y4Dq6IvBjpHJtsg0jbONUPx7bo4ZTZhdpEw2ax8FWgApKk4RTSN
         A0BtWa+yF3/bdwOFtuzt+6DrjNESW4aMdowth73CyjrEgZUeCVcTZaWKauKY+2+na75/
         GjRke27bp/8c7S6gBB1OK0XZYl1Nm1JZn28fWLKk4NrjvxCgXWQUzBpTSbunM0YHDIo2
         Q4GS0uXcF+kWBjD4BGWHWlaXos2rmPgfhX//SPwPN7KC0GKQBwCV1aL7pVHdoG9TeCT8
         VUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=U0g09Rah3LxrhZwTf9GoVSaA9gSyeX4AfpYye/uEAuE=;
        b=jYy5glnTy780J9xCHLJITgyQ5YR1RjoEpdAYPu0AQ097ggaBTTE8Ba9SdgfOd4gisx
         8cyBFV2DtbT/xu36jC2pl4deHIf9s5Tlh5tDdAzftfcaoDsVcBBgB9DzboLfuJAm8UsU
         EqLa/uW2jn1cQg/CmQ4YP8nlpmJQ7G8DuF36x8PzhcuGachHEdPt5RMTbhKkmt6TtRiY
         K3nUXi2keYEo3SG6pEjRIXmtfnC+mpsqYfHXWe9WdlDava6DPdXkQqij93ZdZ/MkQeas
         wt5H+mFQj8bvLdlVW/jTjQyFrR5OS9DsJt0XA6j4vq1pn/ffkEaiwYqBRfkjfgcAFPIy
         YwDA==
X-Gm-Message-State: AOAM5316Eb2CGe6hR4CTdHIrfrO3Gq/B4OHUamHNJ+f/3e+VRArB1LCy
        ixBaBTyVvZPkOmX91STscO8=
X-Google-Smtp-Source: ABdhPJzotb2mZ2pV2e7egchL0U0gs98OQTt8NT1VSwbIMYkLCSRnnl513MWFPNP7waDS4CYR7oI69g==
X-Received: by 2002:a05:6830:3155:: with SMTP id c21mr5034140ots.2.1601564986581;
        Thu, 01 Oct 2020 08:09:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c14sm1448350ooi.9.2020.10.01.08.09.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 08:09:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 1 Oct 2020 08:09:44 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Vadim Pasternak <vadimp@nvidia.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hwmon-staging tree
Message-ID: <20201001150944.GA64648@roeck-us.net>
References: <20201001125310.3399978a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001125310.3399978a@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 01, 2020 at 12:53:10PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hwmon-staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/hwmon/pmbus/mp2975.c: In function 'mp2975_probe':
> drivers/hwmon/pmbus/mp2975.c:740:32: error: passing argument 2 of 'pmbus_do_probe' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   740 |  return pmbus_do_probe(client, id, info);
>       |                                ^~
>       |                                |
>       |                                const struct i2c_device_id *
> In file included from drivers/hwmon/pmbus/mp2975.c:13:
> drivers/hwmon/pmbus/pmbus.h:492:73: note: expected 'struct pmbus_driver_info *' but argument is of type 'const struct i2c_device_id *'
>   492 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
>       |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> drivers/hwmon/pmbus/mp2975.c:740:9: error: too many arguments to function 'pmbus_do_probe'
>   740 |  return pmbus_do_probe(client, id, info);
>       |         ^~~~~~~~~~~~~~
> In file included from drivers/hwmon/pmbus/mp2975.c:13:
> drivers/hwmon/pmbus/pmbus.h:492:5: note: declared here
>   492 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
>       |     ^~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   dd38ac315b23 ("hwmon: (pmbus) Add support for MPS Multi-phase mp2975 controller")
> 
Oops, sorry, got caught in API changes. Fixed.

Guenter

> I have used the hwmon-staging tree from next-20200930 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


